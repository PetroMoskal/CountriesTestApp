import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../provider/items_provider.dart';
import '../widgets/reload_data.dart';
import '../widgets/country_item.dart';

class HomeScreen extends StatefulWidget {
  final title;
  HomeScreen(this.title);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Countries>(context, listen: false).fetchItems();
    }
    _isInit = false;
    // print(_isInit);
    super.didChangeDependencies();
  }

  // var contryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool loadingItems = Provider.of<Countries>(context).isLoading;
    final bool itemsAreLoaded = Provider.of<Countries>(context).isLoaded;
    final List<Item> allCountries = Provider.of<Countries>(context).items;
    final List<Item> foundCountries =
        Provider.of<Countries>(context).foundItems;
    final bool isSearching = Provider.of<Countries>(context).loadingList;
    final bool isSearched = Provider.of<Countries>(context).isSearched;

    var appBarHomeScreen = AppBar(
      title: Text(widget.title),
    );
    final appBarAndPaddingHeight = appBarHomeScreen.preferredSize.height +
        mediaQuery.padding.top +
        mediaQuery.padding.bottom +
        (mediaQuery.devicePixelRatio * 2);

    final double textFieldHeight =
        (mediaQuery.size.height - appBarAndPaddingHeight) * 0.07;

    return Scaffold(
      appBar: appBarHomeScreen,
      body: loadingItems
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : itemsAreLoaded
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: textFieldHeight,
                        child: TextField(
                          onChanged: (input) {
                            Provider.of<Countries>(context, listen: false)
                                .searchInput(input);
                            // Provider.of<Countries>(context, listen: false)
                            //     .testPrintInput();
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'enter counry name',
                            border: OutlineInputBorder(gapPadding: 10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: mediaQuery.size.height -
                          textFieldHeight -
                          appBarAndPaddingHeight,
                      child: isSearched
                          ? Container(
                              child: isSearching
                                  ? Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    )
                                  : ListView.builder(
                                      itemCount: foundCountries.length,
                                      itemBuilder: (context, i) =>
                                          CountryItem(foundCountries[i])),
                            )
                          : ListView.builder(
                              itemCount: allCountries.length,
                              itemBuilder: (context, i) =>
                                  CountryItem(allCountries[i])),
                    ),
                  ],
                )
              : ReloadData(),
    );
  }
}
