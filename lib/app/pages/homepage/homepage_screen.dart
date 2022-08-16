import 'dart:html';

import 'package:aval3_nasa/app/data/datasource/planet_datasource.dart';
import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:aval3_nasa/app/pages/homepage/widgets/image_card_widget.dart';
import 'package:flutter/material.dart';

import '../../data/repository/planet_repository.dart';

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
      appBar: AppBar(
        title: const Text('Galeria do Universo'),
      ),
      body: Column(
        children: [
          Text('Quantidade de imagens: $quantityImages'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (quantityImages < 20) {
                    setState(() {
                      quantityImages++;
                    });
                  }
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  if (quantityImages > 1) {
                    setState(() {
                      quantityImages--;
                    });
                  }
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: ImplPlanetDataSource.getRandomImages(quantityImages),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('sem conexao');
                  case ConnectionState.done:
                    return ListView.builder(
                        itemCount: quantityImages,
                        itemBuilder: (context, index) {
                          print(snapshot.data[index].url);
                          return CardTile(infosPlanet: snapshot.data[index]);
                        });
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
