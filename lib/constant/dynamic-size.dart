import 'package:desktopgame/main.dart';
import 'package:flutter/cupertino.dart';

class Sizes{
  static double  get  fontSizeOne{
    return screenWidth/80;
  }

  static double  get  fontSizeTwo{
    return screenWidth/70;
  }

  static double  get  fontSizeThree{
    return screenWidth/60;
  }

  static double  get  fontSizeLarge{
    return screenWidth/30;
  }

  static double  get  fontSizeExtraLarge{
    return screenWidth/20;
  }

  static const spaceWidthOne= SizedBox(width: 15,);
  static const spaceWidthTwo= SizedBox(width: 20,);
  static const spaceWidthThree= SizedBox(width: 25,);

  static const spaceHeight5= SizedBox(height: 5,);
  static const spaceHeight15= SizedBox(height: 15,);
  static const spaceHeight20= SizedBox(height: 20,);
  static const spaceHeight25= SizedBox(height: 25,);
}