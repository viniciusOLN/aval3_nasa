import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../imagepage/image_page.dart';

class CardTile extends StatelessWidget {
  ImageUniverse infosPlanet;
  CardTile({
    Key? key,
    required this.infosPlanet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => ImagePage(planetInfos: infosPlanet)),
        ),
      ),
      child: Stack(
        children: [
          Card(
            elevation: 12,
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CachedNetworkImage(
                colorBlendMode: BlendMode.color,
                fit: BoxFit.fill,
                imageUrl: infosPlanet.url,
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('😥'),
                      Text('Erro ao carregar imagem'),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.all(15),
            color: Color.fromARGB(106, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  infosPlanet.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  infosPlanet.date,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
