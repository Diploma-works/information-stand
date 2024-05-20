import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/custom_app_bar/providers/image_provider_impl.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/logo_image/logo_image.dart';
import 'package:information_stand/features/places/models/location/app_lat_long.dart';
import 'package:information_stand/features/places/services/location_service.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'dart:math' as math;

import '../../models/place.dart';

class PlacesMap extends StatefulWidget {

  List<Place?> filteredPlaces;

  PlacesMap({super.key, required this.filteredPlaces});

  @override
  State<PlacesMap> createState() => _PlacesMapState();
}

class _PlacesMapState extends State<PlacesMap> {
  Place? selectedPlacemark = null;
  final mapControllerCompleter = Completer<YandexMapController>();
  LocationService locationService = LocationService();
  List<MapObject> placemarks = [];
  StreamSubscription<Position>? locationSubscription;
  PlacemarkMapObject? userLocationMarker;
  bool isLoading = false;

  List<Place?> _previousFilteredPlaces = [];

  @override
  void didUpdateWidget(PlacesMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_previousFilteredPlaces != widget.filteredPlaces) {
      _addAllPointToMap(widget.filteredPlaces);
      _previousFilteredPlaces = widget.filteredPlaces;
    }
  }

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
    _startLocationUpdates();
  }

  void _startLocationUpdates() {
    locationSubscription = Geolocator.getPositionStream().listen((position) {
      final appLatLong =
          AppLatLong(lat: position.latitude, long: position.longitude);
      _updateUserLocationMarker(appLatLong);
    });
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    MapObjectId mapObjectId = const MapObjectId("userLocationMarker");
    userLocationMarker = PlacemarkMapObject(
        point: Point(
          latitude: location.lat,
          longitude: location.long,
        ),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('lib/assets/user.png'),
              rotationType: RotationType.rotate,
              scale: 1.5),
        ),
        mapId: mapObjectId,
        opacity: 1);
    setState(() {
      placemarks.add(userLocationMarker!);
    });
    if (selectedPlacemark == null) {
      _moveToCurrentLocation(location, 12);
    }
    setState(() {
      isLoading = true;
    });
  }

  Future<void> _moveToCurrentLocation(
      AppLatLong appLatLong, double zoom) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: zoom,
        ),
      ),
    );
  }

  void _updateUserLocationMarker(AppLatLong appLatLong) async {
    MapObjectId mapObjectId = const MapObjectId("userLocationMarker");
    userLocationMarker = PlacemarkMapObject(
        point: Point(
          latitude: appLatLong.lat,
          longitude: appLatLong.long,
        ),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('lib/assets/user.png'),
              rotationType: RotationType.rotate,
              scale: 1.5),
        ),
        mapId: mapObjectId,
        opacity: 1);
    final index = placemarks.indexWhere(
        (marker) => marker.mapId.value == userLocationMarker!.mapId.value);
    if (index >= 0) {
      setState(() {
        placemarks[index] = userLocationMarker!;
      });
    } else {
      placemarks.add(userLocationMarker!);
    }
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371;

    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    double distance = radius * c;
    return distance;
  }

  void findNearestPlacemark(List<Place?> points) async {
    Point userPoint = userLocationMarker!.point;
    double minDistance = double.infinity;
    Place? nearestPlacemark;
    for (var placemark in points) {
      if (placemark != null) {
        Point placemarkPoint =
            Point(latitude: placemark.latitude, longitude: placemark.longitude);

        double lat1 = userPoint.latitude * math.pi / 180;
        double lon1 = userPoint.longitude * math.pi / 180;
        double lat2 = placemarkPoint.latitude * math.pi / 180;
        double lon2 = placemarkPoint.longitude * math.pi / 180;

        double distance = _calculateDistance(lat1, lon1, lat2, lon2);

        if (distance < minDistance) {
          minDistance = distance;
          nearestPlacemark = placemark;
        }
      }
      setState(() {
        selectedPlacemark = nearestPlacemark;
      });
      _moveToCurrentLocation(
          AppLatLong(
              lat: nearestPlacemark!.latitude,
              long: nearestPlacemark.longitude),
          14);
    }
  }

  Future<Uint8List> _buildClusterAppearance(Cluster cluster) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(200, 200);
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    const radius = 60.0;

    final textPainter = TextPainter(
        text: TextSpan(
            text: cluster.size.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 50)),
        textDirection: TextDirection.ltr);

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final textOffset = Offset((size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2);
    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);
    textPainter.paint(canvas, textOffset);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  void _zoomIn() async {
    YandexMapController controller = await mapControllerCompleter.future;
    controller.moveCamera(CameraUpdate.zoomIn(),
        animation: const MapAnimation(duration: 0.5));
  }

  void _zoomOut() async {
    YandexMapController controller = await mapControllerCompleter.future;
    controller.moveCamera(CameraUpdate.zoomOut(),
        animation: const MapAnimation(duration: 0.5));
  }

  void _currentLocation() async {
    YandexMapController controller = await mapControllerCompleter.future;
    Position currentPosition = await Geolocator.getCurrentPosition();
    AppLatLong userLocation = AppLatLong(
      lat: currentPosition.latitude,
      long: currentPosition.longitude,
    );
    controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: userLocation.lat,
              longitude: userLocation.long,
            ),
          ),
        ),
        animation: const MapAnimation(duration: 0.5));
  }

  void close() {
    setState(() {
      selectedPlacemark = null;
    });
  }

  Place? getPointByName(String id, List<Place?> points) {
    return points.where((element) => element!.id == int.parse(id)).first;
  }

  MapObject getPlaceMarkByName(String name) {
    return placemarks.where((mapObject) => mapObject.mapId.value == name).first;
  }

  void _addAllPointToMap(List<Place?> points) {
    List<PlacemarkMapObject> pl = [];
    for (var point in points) {
      if (point != null) {
        final placemark = PlacemarkMapObject(
            point: Point(
              latitude: point.latitude,
              longitude: point.longitude,
            ),
            onTap: (placemark, point) {
              setState(() {
                selectedPlacemark = getPointByName(placemark.mapId.value, points);
              });
              Place? temp = getPointByName(placemark.mapId.value, points);
              _moveToCurrentLocation(
                  AppLatLong(
                    lat: temp!.latitude,
                    long: temp.longitude,
                  ),
                  13);
            },
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image:
                    BitmapDescriptor.fromAssetImage('assets/images/point.png'),
                rotationType: RotationType.rotate,
                scale: 1.3)),
            mapId: MapObjectId(point.id.toString()),
            opacity: 1);
        pl.add(placemark);
      }
    }
    final largeMapObject = ClusterizedPlacemarkCollection(
      mapId: const MapObjectId('map'),
      radius: 30,
      minZoom: 15,
      onClusterAdded:
          (ClusterizedPlacemarkCollection self, Cluster cluster) async {
        return cluster.copyWith(
            appearance: cluster.appearance.copyWith(
                opacity: 0.75,
                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromBytes(
                        await _buildClusterAppearance(cluster)),
                    scale: 1))));
      },
      placemarks: pl,
      onClusterTap: (ClusterizedPlacemarkCollection self, Cluster cluster) {
        _moveToCurrentLocation(
            AppLatLong(
                lat: cluster.appearance.point.latitude,
                long: cluster.appearance.point.longitude),
            13);
      },
    );
    setState(() {
      placemarks.add(largeMapObject);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: !isLoading
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoImage(
                    imageProvider: context.watch<ImageProviderImpl>(),
                  ),
                  Text(
                    'Загружаем карту, строим маршруты…',
                  )
                ],
              ))
            : Stack(
                  children: [
                    if (isLoading)
                      YandexMap(
                        onMapCreated: (controller) {
                          controller.moveCamera(CameraUpdate.newCameraPosition(
                              const CameraPosition(
                                  target: Point(
                                      latitude: 55.7522200,
                                      longitude: 37.6155600),
                                  zoom: 5)));
                          _addAllPointToMap(widget.filteredPlaces);
                          mapControllerCompleter.complete(controller);
                          if (selectedPlacemark != null) {
                            controller
                                .moveCamera(CameraUpdate.newCameraPosition(
                              CameraPosition(
                                  target: Point(
                                    latitude: selectedPlacemark!.latitude,
                                    longitude: selectedPlacemark!.longitude,
                                  ),
                                  zoom: 15),
                            ));
                          }
                        },
                        scrollGesturesEnabled: true,
                        mapObjects: placemarks,
                        logoAlignment: const MapAlignment(
                            horizontal: HorizontalAlignment.left,
                            vertical: VerticalAlignment.bottom),
                      ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              width: 40,
                              height: 40,
                              child: RawMaterialButton(
                                onPressed: _currentLocation,
                                fillColor: Colors.white70,
                                child: const Icon(Icons.my_location_sharp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  width: 40,
                                  height: 40,
                                  child: RawMaterialButton(
                                    onPressed: _zoomIn,
                                    fillColor: Colors.white70,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  width: 40,
                                  height: 40,
                                  child: RawMaterialButton(
                                    onPressed: _zoomOut,
                                    fillColor: Colors.white70,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
