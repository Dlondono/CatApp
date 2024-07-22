import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_app/data/models/cat_model.dart';
import 'package:cat_app/presentation/detail_cat_screen.dart';
import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  const CatCard({required this.cat, this.imageUrl, super.key});

  final CatModel cat;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CatDetailScreen(cat: cat, imageUrl: imageUrl)));
        },
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
            ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cat.name ?? "",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    const Icon(Icons.info_outline,color: Colors.white,)
                  ],
                ),
              ),),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                color: Colors.white
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported,
                  size: 80,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cat.origin ?? "",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    Text("Inteligencia: ${cat.intelligence}/5",style: const TextStyle(color: Colors.white,fontSize: 16),),

                  ],
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
