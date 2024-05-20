import 'package:information_stand/features/places/models/place.dart';

abstract interface class PlacesServiceInterface {

  Future<List<Place?>> getPlaces();
}