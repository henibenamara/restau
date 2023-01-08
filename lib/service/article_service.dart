import 'package:ecom/constant/app_constant.dart';
import 'package:ecom/models/article.dart';
import 'package:ecom/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  Future<List<dynamic>> getAllCat() async {
    final response = await http.get(Uri.parse('https://mascotte-api.onrender.com/api/categorie'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> getArtbyCat(String id) async {
    final response = await http.get(Uri.parse('https://mascotte-api.onrender.com/api/articles/$id'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }
  
  Future<Response> addNewArticle(article art) async {
    final url = Uri.parse(
      AppConstants.API_URL + "https://mascotte-api.onrender.com/api/articles",
    );
    final request = await http.post(
      url,
      body: jsonEncode(art.toJson()),
      headers: AppConstants.HEADERS,
    );
    Response response = Response();
    try {
      if (request.statusCode == 201) {
        print('request.body : ${request.body}');
        print(request.headers);

        response = responseFromJson(request.body);
      } else {
        print(request.statusCode);
      }
    } catch (e) {
      return Response();
    }
    return response;
  }

  
}
