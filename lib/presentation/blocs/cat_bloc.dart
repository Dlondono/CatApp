import 'package:cat_app/data/datasource/cat_datasource.dart';
import 'package:cat_app/data/models/breed_model.dart';
import 'package:cat_app/data/models/cat_model.dart';
import 'package:flutter/material.dart';

enum CatState{initial, loading, loaded, failure}

class CatBloc extends ChangeNotifier{
  final CatDatasource catDatasource;
  CatBloc({required this.catDatasource});

  List<CatModel> cats=[];
  List<BreedModel> breeds=[];
  bool hasReachedMax = false;
  CatState _catState =CatState.initial;
  CatState get catState => _catState;

  setCatState(CatState value) {
    _catState = value;
    notifyListeners();
  }
  Future<void> getCats() async {
    setCatState(CatState.loading);

    if (hasReachedMax) setCatState(CatState.loaded);

    final catData = await catDatasource.getCats();
    hasReachedMax = catData.isEmpty;
    cats = catData;

    setCatState(CatState.loaded);

    notifyListeners();
  }
  Future<void> getCatsByBreed(String breed) async {
    setCatState(CatState.loading);

    if (hasReachedMax) setCatState(CatState.loaded);

    final breedData = await catDatasource.getCatsByBreed(breed);
    hasReachedMax = breedData.isEmpty;
    breeds = breedData;

    setCatState(CatState.loaded);

    notifyListeners();
  }
}