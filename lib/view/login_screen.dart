import 'package:desktopgame/generated/assets.dart';
import 'package:desktopgame/view/const-widget/button-const.dart';
import 'package:desktopgame/view/const-widget/common-dialog.dart';
import 'package:desktopgame/view/const-widget/text-field-const.dart';
import 'package:desktopgame/view/const-widget/timer/display-timer.dart';
import 'package:desktopgame/view/game_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:window_manager/window_manager.dart';

import '../constant/color-const.dart';
import '../constant/dynamic-size.dart';
import '../main.dart';
import 'const-widget/container-const.dart';
import 'const-widget/rotating-animation.dart';
import 'const-widget/text-const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Stack(
          children: [
            ContainerConst(
              height: screenHeight,
              width: screenWidth,
              color: Colors.red,
              image: const DecorationImage(
                  image: AssetImage("assets/bg/loginBg.png"), fit: BoxFit.fill),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appVersion(),
                  Sizes.spaceHeight5,
                  Sizes.spaceHeight5,
                  gameTitle(),
                  const Spacer(),
                  loginDesign(context)
                ],
              ),
            ),
            Positioned(
                bottom: screenHeight / 20,
                right: screenWidth / 7  ,
                child: RotationAnimation(
                  child: Image.asset(Assets.gameIconRotationChakra,
                      width: screenWidth / 3.3),
                )),
          ],
        ),
      ),
    );
  }

  Widget appVersion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextConst(
          text: "Ver. 2.0.187",
          fontSize: Sizes.fontSizeThree,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Widget gameTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sizes.spaceWidthThree,
        Sizes.spaceWidthThree,
        appLogo(),
        Sizes.spaceWidthTwo,
        SizedBox(
          width: screenWidth / 2.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("GOLDWIN",
                  style: GoogleFonts.dmSerifText(
                    textStyle: TextStyle(
                        fontSize: screenWidth / 10,
                        fontStyle: FontStyle.italic,
                        color: GameColor.goldenYellow,
                        height: 0.8),
                  )),
              Text("  Better Than Online Lottery Terminal",
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                        fontSize: screenWidth / 35,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  )),
              Sizes.spaceHeight15,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Sizes.spaceWidthOne,
                  TextConst(
                    text: "Date: $currentDate",
                    textColor: Colors.white,
                    fontSize: Sizes.fontSizeTwo,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextConst(
                        text: "Time: ",
                        textColor: Colors.white,
                        fontSize: Sizes.fontSizeTwo,
                      ),
                      LiveTimeDisplay()
                    ],
                  ),
                  Sizes.spaceWidthThree
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget appLogo() {
    return ContainerConst(
      alignment: Alignment.center,
      height: screenWidth / 12,
      width: screenWidth / 12,
      shape: BoxShape.circle,
      color: Colors.brown,
      child: const TextConst(
        text: "Logo",
        textColor: Colors.white,
      ),
    );
  }

  Widget loginDesign(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ContainerConst(
              padding: const EdgeInsets.all(5),
              width: screenWidth / 4.5,
              color: Colors.black.withOpacity(0.05),
              border:
                  Border.all(width: 0.5, color: Colors.white.withOpacity(0.5)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConst(
                        text: "Terminal: ",
                        textColor: Colors.white,
                        fontSize: Sizes.fontSizeThree,
                      ),
                      TextFieldConst(
                        width: screenWidth / 8,
                        height: 30,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      )
                    ],
                  ),
                  Sizes.spaceHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConst(
                        text: "Password: ",
                        textColor: Colors.white,
                        fontSize: Sizes.fontSizeThree,
                      ),
                      TextFieldConst(
                        width: screenWidth / 8,
                        height: 30,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      )
                    ],
                  ),
                  Sizes.spaceHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonConst(
                        border: const Border(
                            top: BorderSide(width: 1, color: Colors.white)),
                        width: screenWidth / 10,
                        height: 30,
                        borderRadius: BorderRadius.circular(2),
                        label: "Clear",
                      ),
                      ButtonConst(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const GameMenuScreen()));
                        },
                        border: const Border(
                            top: BorderSide(width: 1, color: Colors.white)),
                        width: screenWidth / 10,
                        height: 30,
                        borderRadius: BorderRadius.circular(2),
                        label: "Login",
                      )
                    ],
                  )
                ],
              ),
            ),
            Sizes.spaceHeight15,
            TextConst(
              text: "Welcome to Lottery Terminal",
              textColor: Colors.white,
              fontSize: Sizes.fontSizeThree,
            )
          ],
        ),
        actionButtons(context)
      ],
    );
  }

  Widget actionButtons(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        settingFunctionButton(),
        refreshFunctionButton(context),
        logoutFunctionButton(context),
      ],
    );
  }

  Widget logoutFunctionButton(context) {
    return IconButton(
      onPressed: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return CommonActionDialog(
                messageText: "Do you want to shutdown ?",
                yesTapped: () async {
                  await windowManager.close();
                },
              );
            });
      },
      icon: Image.asset(Assets.iconsPowerBtn),
    );
  }

  Widget refreshFunctionButton(context) {
    return IconButton(
      onPressed: ()  {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return CommonActionDialog(
                messageText: "Do you want to restart ?",
                yesTapped: () async {
                  Navigator.of(context).pop();
                },
              );
            });
      },
      icon: Image.asset(Assets.iconsRefreshBtn),
    );
  }

  Widget settingFunctionButton() {
    return IconButton(
        onPressed: () async {
          // await windowManager.close();
        },
        icon: Image.asset(
          Assets.iconsSettingBtn,
        ));
  }
}
