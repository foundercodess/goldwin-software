import 'package:desktopgame/constant/assets.dart';
import 'package:desktopgame/constant/color-const.dart';
import 'package:desktopgame/constant/dynamic-size.dart';
import 'package:desktopgame/generated/assets.dart';
import 'package:desktopgame/main.dart';
import 'package:desktopgame/view/const-widget/container-const.dart';
import 'package:desktopgame/view/const-widget/header_widget.dart';
import 'package:desktopgame/view/const-widget/text-const.dart';
import 'package:desktopgame/view/twelve_card_ten_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'const-widget/timer/display-timer.dart';

class GameMenuScreen extends StatefulWidget {
  const GameMenuScreen({super.key});

  @override
  State<GameMenuScreen> createState() => _GameMenuScreenState();
}

class _GameMenuScreenState extends State<GameMenuScreen> {
  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: ContainerConst(
          height: screenHeight,
          width: screenWidth,
          image: const DecorationImage(
              image: AssetImage(GameGraphics.gameMenuBg), fit: BoxFit.fill),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // headerSection(),
              HeaderSection(),
              const Spacer(),
              gameIconDesign(),
              Sizes.spaceHeight5,
              gameNameWithToggle(),
              Sizes.spaceHeight5,
              const Spacer(),

            ],
          ),
        ),
      ),
    );
  }

  Widget gameIconDesign() {
    return ContainerConst(
      border: Border.all(width: 8, color: Colors.red),
      height: screenHeight / 1.6,
      width: screenWidth / 1.7,
      image: const DecorationImage(
          image: AssetImage(Assets.gameIconTwelveCardTen), fit: BoxFit.fill),
    );
  }

  Widget gameNameWithToggle() {
    return ContainerConst(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const TwelveCardTenGameHomeScreen()));
      },
      height: screenHeight / 15,
      width: screenWidth / 6,
      color: Colors.green,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [BoxShadow(
        offset: const Offset(0,1),
        color: Colors.black.withOpacity(0.5),
        spreadRadius: 1, blurRadius: 1
      )],
      border: Border.all(),
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffcead4a),
            Color(0xffbf8607),
            Color(0xffcead4a),
          ]),
      alignment: Alignment.center,
      child: Text("12 Card 10",
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
                fontSize: Sizes.fontSizeLarge/1.4,
                fontStyle: FontStyle.italic,
                color: Colors.black),
          )),
    );
  }
}
