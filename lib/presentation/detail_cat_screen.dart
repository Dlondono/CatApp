import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_app/data/models/cat_model.dart';
import 'package:cat_app/presentation/widgets/bullet_point_text.dart';
import 'package:flutter/material.dart';

class CatDetailScreen extends StatelessWidget {
  const CatDetailScreen({super.key, required this.cat, this.imageUrl});
  final CatModel cat;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          cat.name!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl!,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported,
              size: 80,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cat.description.toString(),
                      textAlign: TextAlign.justify,
                    ),
                    BulletPointText(
                        title: "Temperamento",
                        subtitle: cat.temperament.toString()),
                    BulletPointText(
                        title: "Origien", subtitle: cat.origin.toString()),
                    BulletPointText(
                        title: "Esperanza de vida",
                        subtitle: "${cat.lifeSpan}"),
                    BulletPointText(
                        title: "Inteligencia",
                        subtitle: "${cat.intelligence}/5"),
                    BulletPointText(
                        title: "Adaptabilidad",
                        subtitle: "${cat.adaptability}/5"),
                    BulletPointText(
                        title: "Problemas de salud",
                        subtitle: "${cat.healthIssues}/5"),
                    BulletPointText(
                        title: "Amigable con perros",
                        subtitle: "${cat.dogFriendly}/5"),
                    BulletPointText(
                        title: "Amigable con extraños",
                        subtitle: "${cat.strangerFriendly}/5"),
                    BulletPointText(
                        title: "Amigable con niños",
                        subtitle: "${cat.childFriendly}/5"),
                    BulletPointText(
                        title: "Nivel de energia",
                        subtitle: "${cat.energyLevel}/5"),
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
