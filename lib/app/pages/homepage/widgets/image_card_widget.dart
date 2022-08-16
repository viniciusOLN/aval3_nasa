import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:aval3_nasa/app/utils/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import '../../imagepage/image_page.dart';
import 'container_infos_widget.dart';

class CardTile extends StatelessWidget {
  final ImageUniverse infosPlanet;
  const CardTile({
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
            elevation: 20,
            child: SizedBox(
              width: double.infinity,
              height: 196,
              child: ImageWidget(
                url: infosPlanet.url,
                boxFit: BoxFit.fill,
                sizedBoxLenght: 50,
                isHomepage: true,
              ),
            ),
          ),
          ContainerInfos(title: infosPlanet.title, date: infosPlanet.date),
        ],
      ),
    );
  }
}
