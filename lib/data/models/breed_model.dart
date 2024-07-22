import 'package:cat_app/data/models/cat_model.dart';

class BreedModel {
  List<CatModel>? catModel;
  String? id;
  String? imageUrl;

  BreedModel({this.catModel, this.id, this.imageUrl});

  factory BreedModel.fromJson(Map<String?, dynamic> json) =>
      BreedModel(
        catModel: List<CatModel>.from(json["breeds"].map((model)=> CatModel.fromJson(model))),
        imageUrl: json["url"],
        id: json["id"]
      );

}
