// ignore_for_file: unnecessary_const

import 'package:ecom/service/article_service.dart';
import 'package:ecom/views/listArticlesByCategories.dart';
import 'package:ecom/widgets/drawer.dart';
import 'package:flutter/material.dart';

class listecategories extends StatefulWidget {
  @override
  _listecategoriesState createState() => _listecategoriesState();
}

class _listecategoriesState extends State<listecategories> {
  _listecategoriesState();
  List<dynamic> _items = [];
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Les Categories"),
          
        ),
        drawer: DrawerBASE(context),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(_items.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => listarticlesbycat(_items[index]['CodeCat'],_items[index]['DesCat'])));
              },
              child: Card(
                color:  const Color.fromRGBO(255, 255, 255,
                    0.5), // set the background color to white with 50% transparency
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/800px-Hamburger_%28black_bg%29.jpg'), // set the background image
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                    child: Text(_items[index]['DesCat'], style: TextStyle(backgroundColor: Colors.white,
                    fontSize: 15,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = Colors.blue[700]!,
      
                    ),),
                  
                ),
              ),
            );
          }),
        ));
  }
}
