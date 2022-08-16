import 'package:flutter/material.dart';
import 'image_card_widget.dart';

class ListViewImages extends StatelessWidget {
  final int quantityImages;
  final AsyncSnapshot snapshot;
  final Function() onRefresh;

  const ListViewImages({
    Key? key,
    required this.quantityImages,
    required this.snapshot,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: quantityImages,
        itemBuilder: (context, index) {
          return CardTile(infosPlanet: snapshot.data[index]);
        },
      ),
      onRefresh: () => onRefresh(),
    );
  }
}
