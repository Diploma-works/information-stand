import 'package:flutter/material.dart';
import 'package:information_stand/features/places/models/place.dart';
import 'package:logger/logger.dart';

import '../../services/places_service/places_service_interface.dart';

class PlacesState with ChangeNotifier {
  PlacesServiceInterface placesService;
  Logger log;
  List<Place?> _places = [];
  List<String?> _categories = [];
  List<String?> _selectedCategories = [];

  PlacesState(this.placesService, this.log);

  List<Place?> get places => _places;

  List<String?> get categories => _categories;
  List<String?> get selectedCategories => _selectedCategories;

  Future<void> getPlaces() async {
    _places = await placesService.getPlaces();
    _categories = getAllCategories();
  }

  List<String?> getAllCategories() {
    Set<String> uniqueCategories = Set();
    for (var place in _places) {
      if (place != null) {
        uniqueCategories.add(place.category);
      }
    }
    return uniqueCategories.toList();
  }

  void toggleCategory(String? category) {
    if (category != null) {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
      notifyListeners();
    }
  }

}
