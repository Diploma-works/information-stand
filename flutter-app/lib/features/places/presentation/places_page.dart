import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:information_stand/features/places/presentation/pages/places_list.dart';
import 'package:information_stand/features/places/presentation/pages/places_map.dart';
import 'package:information_stand/features/places/services/places_service/places_service_interface.dart';
import 'package:information_stand/features/places/state/places_state/places_state.dart';
import 'package:information_stand/global/di.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../ui/theme/app_theme/app_theme.dart';
import '../models/place.dart';

@RoutePage()
class PlacesPage extends StatefulWidget {
  const PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          PlacesState(getIt<PlacesServiceInterface>(), getIt<Logger>()),
      builder: (context, child) {
        final state = context.read<PlacesState>();
        return Scaffold(
          appBar: CustomAppBar(
            isHome: false,
            colorAppbar:
                context.watch<AppThemeState>().style.mainLayout.color.appBar,
            colorClockBox: context.style.mainLayout.color.clock,
          ),
          body: FutureBuilder<void>(
            future: state.getPlaces(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          String? category = state.categories[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {
                                state.toggleCategory(category);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  return state.selectedCategories
                                          .contains(category)
                                      ? Colors.blue
                                      : Colors.grey;
                                }),
                              ),
                              child: Text(category ?? ''),
                            ),
                          );
                        },
                      ),
                    ),
                    TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(icon: Icon(Icons.list), text: 'List'),
                        Tab(icon: Icon(Icons.map), text: 'Map'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          PlacesList(),
                          Consumer<PlacesState>(builder: (context, state, _) {
                            List<Place?> filteredPlaces =
                                state.selectedCategories.isEmpty
                                    ? state.places
                                    : state.places.where((place) {
                                        return state.selectedCategories
                                            .contains(place?.category);
                                      }).toList();
                            return PlacesMap(
                              filteredPlaces: filteredPlaces,
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
