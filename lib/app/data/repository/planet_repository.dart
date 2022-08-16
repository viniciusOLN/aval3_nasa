import 'dart:math';

import 'package:aval3_nasa/app/data/datasource/planet_datasource.dart';
import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';

class ImplPlanetDataSource {
  static Future getRandomImages(int numImages) async {
    List<ImageUniverse> listPlanets = await PlanetDatasource.getRandomImages(
      numImages,
    );

    List<ImageUniverse> newListPlanets = [];

    newListPlanets = [...listPlanets];

    List<int> positionsWrongImages = [];

    for (int i = 0; i < newListPlanets.length; i++) {
      if (!(newListPlanets[i]
          .url
          .contains('https://apod.nasa.gov/apod/image/'))) {
        positionsWrongImages.add(i);
      }
    }

    for (int i = 0; i < positionsWrongImages.length; i++) {
      newListPlanets[positionsWrongImages[i]] = await verifyVideos(
        newListPlanets[positionsWrongImages[i]],
      );
    }

    return newListPlanets;
  }

  static Future<ImageUniverse> verifyVideos(ImageUniverse currentImage) async {
    ImageUniverse copyImage = currentImage;
    while (!(copyImage.url.contains('https://apod.nasa.gov/apod/image/'))) {
      copyImage = await PlanetDatasource.getRandomImage();
    }

    return copyImage;
  }
}
