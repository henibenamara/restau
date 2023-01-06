import 'dart:html';
import 'dart:ui';

import 'package:ecom/service/article_service.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  _homeState();
  List<dynamic> _items = [];
  List<dynamic> _items1 = [];
  bool _isLoading = true;
  bool _isExpanded = false;
  String _codecat = "";
  String _nomcat = "categories";
  final articleservice _apiService = articleservice();
  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  void _fetchItems() async {
    final items = await _apiService.getAllCat();
    setState(() {
      _items = items;
      _isLoading = false;
    });
  }

  void _fetchItems1() async {
    final items1 = await _apiService.getArtbyCat(_codecat);
    setState(() {
      _items1 = items1;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text(_nomcat),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      drawer: Drawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      String description = _items[index]['DesCat'];
                      String displayDescription;
                      if (description.length > 17) {
                        displayDescription =
                            description.substring(0, 17) + "...";
                      } else {
                        displayDescription = description;
                      }

                      return InkWell(
                        onTap: () {
                          setState(() {
                            _isExpanded = true;
                            _codecat = _items[index]['CodeCat'];
                            _fetchItems1();
                            _nomcat = _items[index]['DesCat'];
                          });
                        },
                        child: Card(
                          child: Container(
                            width: 150,
                            height: 50,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/800px-Hamburger_%28black_bg%29.jpg'),
                                ),
                                Text(""),
                                Text(_items[index]['DesCat']),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_isExpanded)
                  Container(
                    height: MediaQuery.of(context).size.height - 220,
                    child: ListView.builder(
                      itemCount: _items1.length,
                      itemBuilder: (context, index) {
                        String description = _items1[index]['LibArt'];
                        String displayDescription;
                        if (description.length > 17) {
                          displayDescription =
                              description.substring(0, 17) + "...";
                        } else {
                          displayDescription = description;
                        }

                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.network(
                                    'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/frisco-redesign/Main_Nav_Cuisine_Types_a445ed69-f8df-4525-a0a3-817a20541590.jpg',
                                    width: 100),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(displayDescription,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      Text(
                                          _items1[index]['prix1'].toString() +
                                              " DT",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                      Text('',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Spacer(),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 2.0),
                                  child: FloatingActionButton(
                                    heroTag: "btn2",
                                    onPressed: () {},
                                    child: const Icon(Icons.info),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
    );
  }
}
