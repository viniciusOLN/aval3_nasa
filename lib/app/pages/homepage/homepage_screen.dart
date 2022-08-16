import 'package:aval3_nasa/app/pages/homepage/widgets/handle_error_widget.dart';
import 'package:aval3_nasa/app/pages/homepage/widgets/list_images_widget.dart';
import 'package:flutter/material.dart';
import '../../data/repository/planet_repository.dart';
import '../../utils/widgets/loading_widget.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/quantity_options_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int quantityImages = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        onPressed: () {
          setState(() {
            quantityImages = 20;
            ImplPlanetDataSource.getRandomImages(quantityImages);
          });
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Quantidade de imagens: $quantityImages'),
          QuantityOptions(
            onPressedPlus: () {
              if (quantityImages < 20) {
                setState(() {
                  quantityImages++;
                });
              }
            },
            onPressedRemove: () {
              if (quantityImages > 1) {
                setState(() {
                  quantityImages--;
                });
              }
            },
          ),
          const SizedBox(height: 30),
          Expanded(
            child: FutureBuilder(
              future: ImplPlanetDataSource.getRandomImages(quantityImages),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == null || snapshot.hasError) {
                    return HandleError(
                      onPressed: () {
                        setState(() {
                          ImplPlanetDataSource.getRandomImages(
                            quantityImages,
                          );
                        });
                      },
                    );
                  } else {
                    return ListViewImages(
                      quantityImages: quantityImages,
                      snapshot: snapshot,
                      onRefresh: () {
                        setState(() {
                          quantityImages = 20;
                        });
                        return ImplPlanetDataSource.getRandomImages(
                            quantityImages);
                      },
                    );
                  }
                } else {
                  return const Loading();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
