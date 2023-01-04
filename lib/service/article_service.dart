import 'package:ecom/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class articleservice {
  static final articleservice _articleservice = articleservice._init();

  factory articleservice() {
    return _articleservice;
  }

  articleservice._init();

Future<List<dynamic>> fetchItems() async {
    final response = await http.get(Uri.parse('https://mascotte-api.onrender.com/api/articles'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load items');
    }
  }
  
  

  
}
