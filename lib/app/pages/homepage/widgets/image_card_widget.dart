import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class CardTile extends StatelessWidget {
  ImageUniverse infosPlanet;
  CardTile({
    Key? key,
    required this.infosPlanet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CachedNetworkImage(
        imageUrl: infosPlanet.url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
