import 'package:aval3_nasa/app/data/datasource/planet_datasource.dart';
import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:flutter/cupertino.dart';

class ImplPlanetDataSource {
  static Future getRandomImages(int numImages) async {
    List<ImageUniverse> listPlanets =
        await PlanetDatasource.getRandomImages(numImages);

    List<ImageUniverse> newListPlanets = [];

    newListPlanets = listPlanets.map((e) => verifyVideos(e)).toList();

    return newListPlanets;
  }

  static ImageUniverse verifyVideos(ImageUniverse currentImage) {
    ImageUniverse copyImage = currentImage;
    while (copyImage.url.contains('https://youtube.com/') ||
        copyImage.url.contains('player.vimeo.com/')) {
      copyImage = PlanetDatasource.getRandomImage().then((value) => value)
          as ImageUniverse;
    }
    return copyImage;
  }
}
