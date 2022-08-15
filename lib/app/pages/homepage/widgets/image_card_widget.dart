import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  ImageUniverse infosPlanet;
  CardTile({
    Key? key,
    required this.infosPlanet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        height: 200,
        child: Image.network(
          infosPlanet.url,
          fit: BoxFit.fill,
          scale: 1.0,
          errorBuilder: (context, exception, stackTrace) {
            return Text('Erro ao carregar a imagem😥');
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
