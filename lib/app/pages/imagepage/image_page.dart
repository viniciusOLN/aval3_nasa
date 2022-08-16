import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final ImageUniverse planetInfos;
  const ImagePage({
    Key? key,
    required this.planetInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planetInfos.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              colorBlendMode: BlendMode.color,
              fit: BoxFit.cover,
              imageUrl: planetInfos.url,
              placeholder: (context, url) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              },
              errorWidget: (context, url, error) {
                print(error);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Text('😥'),
                    Text('Erro ao carregar imagem'),
                    SizedBox(height: 100),
                  ],
                );
              },
            ),
            Text(planetInfos.title),
            Text(planetInfos.date),
            Text(planetInfos.explanation),
          ],
        ),
      ),
    );
  }
}
