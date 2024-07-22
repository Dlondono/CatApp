import 'package:cat_app/core/constants.dart';
import 'package:cat_app/data/models/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/cat_model.dart';

class CatDatasource{

  Future<List<CatModel>> getCats() async {
    List<CatModel> cats = [];
    final headers = {'accept': 'application/json', 'Content-Type': 'application/json', 'x-api-key':apiKey};

    final response =
    await http.get(Uri.parse('${apiUrl}breeds'), headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      for (var cat in data as List) {
        cats.add(CatModel.fromJson(cat));
      }
      return cats;
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception();
    }
  }
  Future<List<BreedModel>> getCatsByBreed([String? breed]) async {
    List<BreedModel> cats = [];
    final headers = {'accept': 'application/json', 'Content-Type': 'application/json', 'x-api-key':apiKey};

    final response =
    await http.get(Uri.parse('${apiUrl}images/search?limit=20&breed_ids=$breed'), headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      for (var cat in data as List) {
        cats.add(BreedModel.fromJson(cat));
      }
      return cats;
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception();
    }

  }
}
