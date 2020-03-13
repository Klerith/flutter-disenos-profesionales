import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/slideshow.dart';

import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      // body: MiSlideshow(),
      body: Column(
        children: <Widget>[
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow())
        ],
      )
    );
  }
}

class MiSlideshow extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      // puntosArriba: true,
      colorPrimario: Color(0xffFF5A7E),
      // colorSecundario: Colors.red,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}

