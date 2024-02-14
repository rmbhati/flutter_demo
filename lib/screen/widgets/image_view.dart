import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class ImageViewDemo extends StatefulWidget {
  const ImageViewDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<ImageViewDemo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: size.height * 0.05,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              size: size.height * 0.03, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.title,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Mulish',
                fontSize: size.height * 0.023)),
        elevation: 10,
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 0.1)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("Image from Assets",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: SizedBox(
              width: size.height * 0.15,
              height: size.height * 0.15,
              child: Image.asset(fit: BoxFit.fill, 'assets/kgk.png'),
            ),
          ),
          Text('--------------------------------------------------',
              maxLines: 1,
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black54,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                  fontSize: size.height * 0.02)),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("Image from Networks",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Image.network(
                'https://www.flutter4u.com/wp-content/uploads/2021/07/Flutter4U_new.png',
                height: size.height * 0.1, loadingBuilder:
                    (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }),
          ),
          Text('--------------------------------------------------',
              maxLines: 1,
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black54,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                  fontSize: size.height * 0.02)),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("Fade in images with a placeholder",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/kgk.png',
              image: 'https://www.flutter4u.com/wp-content/uploads/2021/07/Flutter4U_new.png',
            ),
          )
        ],
      ),
    );
  }
}
