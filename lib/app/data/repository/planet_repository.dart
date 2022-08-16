import 'package:aval3_nasa/app/data/datasource/planet_datasource.dart';
import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';

class ImplPlanetDataSource {
  static Future getRandomImages(int numImages) async {
    final Future listPlanets = PlanetDatasource.getRandomImages(numImages);

    return listPlanets;
  }

  static ImageUniverse verifyVideos(ImageUniverse currentImage) {
    ImageUniverse copyImage = currentImage;
    while (copyImage.url.contains('https://www.youtube.com/') ||
        copyImage.url.contains('player.vimeo.com/')) {
      copyImage = PlanetDatasource.getRandomImage().then((value) => value)
          as ImageUniverse;
    }
    return copyImage;
  }
}
