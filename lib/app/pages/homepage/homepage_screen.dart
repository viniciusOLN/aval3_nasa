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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  quantityImages = 20;
                  ImplPlanetDataSource.getRandomImages(quantityImages);
                });
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
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
          SizedBox(height: 30),
          Expanded(
            child: FutureBuilder(
              future: ImplPlanetDataSource.getRandomImages(quantityImages),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('sem conexao');
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      return RefreshIndicator(
                          child: ListView.builder(
                            itemCount: quantityImages,
                            itemBuilder: (context, index) {
                              return CardTile(
                                  infosPlanet: snapshot.data[index]);
                            },
                          ),
                          onRefresh: () {
                            setState(() {
                              quantityImages = 20;
                            });
                            return ImplPlanetDataSource.getRandomImages(
                                quantityImages);
                          });
                    }
                    return Column(
                      children: [
                        Text('Erro ao acessar a API'),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ImplPlanetDataSource.getRandomImages(
                                      quantityImages);
                                });
                              },
                              child: Text('Atualizar lista.'),
                            ),
                          ],
                        ),
                      ],
                    );
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
