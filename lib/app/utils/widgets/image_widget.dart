import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double sizedBoxLenght;
  final BoxFit boxFit;
  final bool isHomepage;
  const ImageWidget({
    Key? key,
    required this.url,
    required this.boxFit,
    required this.sizedBoxLenght,
    required this.isHomepage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      colorBlendMode: BlendMode.color,
      fit: boxFit,
      imageUrl: url,
      placeholder: (context, url) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: !isHomepage ? sizedBoxLenght : 0),
            SizedBox(
              width: sizedBoxLenght,
              height: sizedBoxLenght,
              child: const CircularProgressIndicator(),
            ),
            SizedBox(height: !isHomepage ? sizedBoxLenght : 0),
          ],
        );
      },
      errorWidget: (context, url, error) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: sizedBoxLenght),
            const Text('😥'),
            const Text('Erro ao carregar imagem'),
            SizedBox(height: sizedBoxLenght),
          ],
        );
      },
    );
  }
}
