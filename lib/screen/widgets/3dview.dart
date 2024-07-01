import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';


class ThreeDView extends StatefulWidget {
  const ThreeDView({super.key, required this.title});
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<ThreeDView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  size: orientation == Orientation.portrait
                      ? size.height * 0.025
                      : size.width * 0.02,
                  color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Mulish',
                    fontSize: orientation == Orientation.portrait
                        ? size.height * 0.023
                        : size.width * 0.018)),
            automaticallyImplyLeading: false,
            elevation: 10,
            shape: const Border(
                bottom: BorderSide(color: Colors.black, width: 0.1))),
        body: const ModelViewer(
          backgroundColor: Colors.transparent,
          //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          //src: 'http://10.100.24.183/jewelviewer/KR605705.glb',
          src: 'assets/aaa.glb',
          alt: 'A 3D model of an astronaut',
          autoRotate: true,
          //iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: false,
          cameraControls: true,
          autoPlay: true,
        )

        /*O3D.network(
              src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
              controller: controller,
            )*/
        /*O3D.asset(
              loading: Loading.eager,
              backgroundColor: Colors.transparent,
              //src: 'assets/astronaut.glb',
              src: 'assets/aaa.glb',
              controller: controller,
              disableZoom: true,
              autoPlay: true,
            )*/
        );
  }
}
