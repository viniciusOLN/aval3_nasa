import 'dart:convert';

import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import '../../utils/api_adresses.dart';
import 'package:http/http.dart' as http;

class PlanetDatasource {
  static Future getRandomImages(int numImages) async {
    Uri url = Uri.parse(
      '${ApiAdresses.planetsApi}?api_key=${ApiAdresses.apiKey}&count=$numImages',
    );

    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro ao tentar conseguir as imagens.');
    }

    List<ImageUniverse> listPlanets = [];

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    json.map((item) => listPlanets.add(ImageUniverse.fromJson(item))).toList();

    return listPlanets;
  }
}
