import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:aval3_nasa/app/data/repository/planet_repository.dart';
import 'package:flutter/material.dart';
import 'image_card_widget.dart';

class ListViewImages extends StatefulWidget {
  final int quantityImages;
  final AsyncSnapshot snapshot;
  final Function() onRefresh;

  ListViewImages({
    Key? key,
    required this.quantityImages,
    required this.snapshot,
    required this.onRefresh,
  }) : super(key: key);

  @override
  State<ListViewImages> createState() => _ListViewImagesState();
}

class _ListViewImagesState extends State<ListViewImages> {
  final controller = ScrollController();
  List listContent = [];

  @override
  void initState() {
    super.initState();
    listContent = widget.snapshot.data;
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future fetchData() async {
    List<ImageUniverse> newContent = await ImplPlanetDataSource.getRandomImages(
      widget.quantityImages,
    );
    setState(() => listContent.addAll(newContent));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        controller: controller,
        itemCount: listContent.length + 1,
        itemBuilder: (context, index) {
          if (index < listContent.length) {
            return CardTile(infosPlanet: widget.snapshot.data[index]);
          }
          return const Padding(
            padding: EdgeInsets.all(12),
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
      onRefresh: () => widget.onRefresh(),
    );
  }
}
