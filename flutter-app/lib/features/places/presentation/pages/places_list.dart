import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:information_stand/features/places/models/place.dart';
import 'package:information_stand/features/places/state/places_state/places_state.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<PlacesState>(
            builder: (context, state, _) {
              List<Place?> filteredPlaces = state.selectedCategories.isEmpty
                  ? state.places
                  : state.places.where((place) {
                      return state.selectedCategories.contains(place?.category);
                    }).toList();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                ),
                itemCount: filteredPlaces.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Image.memory(
                                base64Decode(filteredPlaces[index]!.base64Image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    filteredPlaces[index]!.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  // TextButton(
                                  //   onPressed: () {
                                  //     context.router.push(ExcursionInfoRoute(
                                  //         excursion: excursions[index],
                                  //         refresh: state.refreshExcursion));
                                  //   },
                                  //   child: Text(
                                  //     "Подробнее",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   style: ButtonStyle(
                                  //     backgroundColor: MaterialStateProperty.all(
                                  //         Color.fromRGBO(141, 140, 130, 1.0)),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
