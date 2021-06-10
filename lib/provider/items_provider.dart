import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/item.dart';

class Countries with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  bool isLoaded = false;
  bool isLoading = true;
  String errorMessage;

  Future<void> fetchItems() async {
    final String url = 'https://restcountries.eu/rest/v2/region/europes';

    try {
      final response = await http.get(Uri.parse(url));
      final fethchedData = json.decode(response.body) as List<dynamic>;
      List<Item> loadedItems = [];
      fethchedData.forEach((element) {
        loadedItems.add(Item(
          name: element['name'],
          subregion: element['subregion'],
          alpha2Code: element['alpha2Code'],
          flag: element['flag'],
          latlng: element['latlng'],
          numericCode: element['numericCode'],
          borders: element['borders'],
          currencies: element['currencies'],
        ));
        isLoading = false;
        _items = loadedItems;
        notifyListeners();
      });
      isLoaded = true;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      errorMessage = 'Failed to load data from the server';
      isLoaded = false;
      notifyListeners();
      throw (error);
    }
  }

  void reloadData() {
    isLoaded = false;
    isLoading = true;
    fetchItems();
    notifyListeners();
  }

  List<Item> foundItems = [];

  String countryInput;
  bool isSearched = false;
  bool loadingList = false;

  Future<void> searchInput(String input) async {
    if (input.length >= 3) {
      showLoader().then((value) => searchByContry());
      countryInput = input;
      isSearched = true;
      notifyListeners();
    } else {
      isSearched = false;
    }
    notifyListeners();
  }

  void searchByContry() {
    foundItems = _items
        .where((element) =>
            element.name.toLowerCase().contains(countryInput.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void deleteItem(name) {
    _items.removeWhere((element) => element.name == name);
    foundItems.removeWhere((element) => element.name == name);

    notifyListeners();
  }

  Future<void> showLoader() async {
    loadingList = true;
    await Future.delayed(Duration(milliseconds: 1500)).then(
      (_) => loadingList = false,
    );
  }
}
