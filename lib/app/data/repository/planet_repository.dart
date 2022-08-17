import 'package:aval3_nasa/app/data/datasource/planet_datasource.dart';
import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';

class ImplPlanetDataSource {
  static String defaultUrl = 'https://apod.nasa.gov/apod/image/';

  static Future getRandomImages(int numImages) async {
    List<ImageUniverse> listPlanets = await PlanetDatasource.getRandomImages(
      numImages,
    );

    List<int> positionsWrongImages = [];

    for (int i = 0; i < listPlanets.length; i++) {
      if (!listPlanets[i].url.contains(defaultUrl)) {
        positionsWrongImages.add(i);
      }
    }

    for (int i = 0; i < positionsWrongImages.length; i++) {
      listPlanets[positionsWrongImages[i]] = await verifyVideos(
        listPlanets[positionsWrongImages[i]],
      );
    }

    return listPlanets;
  }

  static Future<ImageUniverse> verifyVideos(ImageUniverse currentImage) async {
    ImageUniverse copyImage = currentImage;
    while (!(copyImage.url.contains(defaultUrl))) {
      copyImage = await PlanetDatasource.getRandomImage();
    }

    return copyImage;
  }
}
