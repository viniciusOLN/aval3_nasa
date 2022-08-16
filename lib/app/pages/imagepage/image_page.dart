import 'package:aval3_nasa/app/data/models/image_planetary_model.dart';
import 'package:aval3_nasa/app/pages/imagepage/widgets/infos_image.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/image_widget.dart';

class ImagePage extends StatefulWidget {
  final ImageUniverse planetInfos;
  const ImagePage({
    Key? key,
    required this.planetInfos,
  }) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.planetInfos.title)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              url: widget.planetInfos.url,
              boxFit: BoxFit.cover,
              sizedBoxLenght: 100,
              isHomepage: false,
            ),
            const SizedBox(height: 10),
            InfosImage(
              title: widget.planetInfos.title,
              date: widget.planetInfos.date,
              explanation: widget.planetInfos.explanation,
            ),
          ],
        ),
      ),
    );
  }
}
