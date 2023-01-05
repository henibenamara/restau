import 'package:ecom/views/listCategories.dart';
import 'package:ecom/views/listarticle.dart';
import 'package:flutter/material.dart';

Widget DrawerBASE(BuildContext context) {
  return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),topRight: Radius.circular(100)),
      ),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('MENU '),
      ),
       
          ListTile(
              leading: Icon(Icons.home),
              title: Text('HOME '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => listecategories()));
              }),
               ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => listecategories()));
             
              }),
        ListTile(
              leading: Icon(Icons.indeterminate_check_box),
              title: Text('Articles '),
              onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => listarticles()));
             
              }),
       
        ],
      ));
}
