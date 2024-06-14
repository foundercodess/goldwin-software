import 'package:desktopgame/view/const-widget/text-const.dart';
import 'package:desktopgame/view/const-widget/timer/display-timer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant/color-const.dart';
import '../../constant/dynamic-size.dart';
import '../../generated/assets.dart';
import '../../main.dart';
import 'container-const.dart';

class HeaderSection extends StatelessWidget {
   HeaderSection({super.key});
  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return headerSection();
  }

  Widget headerSection() {
    return ContainerConst(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: screenWidth,
      height: screenHeight / 9,
      color: GameColor.gameRed,
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 6),
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5)
      ],
      child: Row(
        children: [
          appLogo(),
          gameName(),
          const Spacer(),
          sessionData(),
          Sizes.spaceWidthTwo,
          dateTime(),
          Sizes.spaceWidthTwo,
          activeIcon(),
        ],
      ),
    );
  }

  Widget appLogo() {
    return ContainerConst(
      alignment: Alignment.center,
      height: screenWidth / 10,
      width: screenWidth / 10,
      shape: BoxShape.circle,
      color: Colors.brown,
      child: const TextConst(
        text: "Logo",
        textColor: Colors.white,
      ),
    );
  }

  Widget gameName() {
    return TextConst(
      text: "GOLDWIN",
      fontSize: Sizes.fontSizeExtraLarge,
      textColor: GameColor.goldenYellow,
    );
  }

  Widget sessionData() {
    return SizedBox(
      width: screenWidth / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConst(
                text: "Terminal: ",
                textColor: Colors.white,
                fontSize: Sizes.fontSizeTwo,
              ),
              TextConst(
                text: "7711010603",
                textColor: Colors.white,
                fontSize: Sizes.fontSizeTwo,
              ),
            ],
          ),
          Sizes.spaceHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConst(
                text: "Balance: ",
                textColor: Colors.white,
                fontSize: Sizes.fontSizeTwo,
              ),
              TextConst(
                text: "15661",
                textColor: Colors.white,
                fontSize: Sizes.fontSizeTwo,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dateTime() {
    return SizedBox(
      width: screenWidth / 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConst(
                text: "Date: ",
                textColor: Colors.white,
                fontSize: Sizes.fontSizeTwo,
              ),
              TextConst(
                text: currentDate,
                textColor: Colors.white,
                fontSize: Sizes.fontSizeTwo,
              ),
            ],
          ),
          Sizes.spaceHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConst(
                text: "Time: ",
                textColor: Colors.white,
                fontSize: Sizes.fontSizeTwo,
              ),
              LiveTimeDisplay()
            ],
          ),
          Sizes.spaceWidthThree,
        ],
      ),
    );
  }

  Widget activeIcon() {
    return ContainerConst(
      gradient: const RadialGradient(
        tileMode: TileMode.mirror,
        focal: Alignment.topCenter,
        focalRadius: 0.6,
        colors: [Colors.green, Colors.green, Colors.black54],
      ),
      height: screenWidth / 18,
      width: screenWidth / 18,
      image: const DecorationImage(
          image: AssetImage(Assets.iconsGreenCircle), fit: BoxFit.fitWidth),
    );
  }

}
