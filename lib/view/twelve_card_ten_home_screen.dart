import 'package:desktopgame/constant/color-const.dart';
import 'package:desktopgame/constant/dynamic-size.dart';
import 'package:desktopgame/generated/assets.dart';
import 'package:desktopgame/main.dart';
import 'package:desktopgame/view/const-widget/button-const.dart';
import 'package:desktopgame/view/const-widget/container-const.dart';
import 'package:desktopgame/view/const-widget/header_widget.dart';
import 'package:desktopgame/view/const-widget/text-const.dart';
import 'package:desktopgame/view/const-widget/text-field-const.dart';
import 'package:flutter/material.dart';

class TwelveCardTenGameHomeScreen extends StatefulWidget {
  const TwelveCardTenGameHomeScreen({super.key});

  @override
  State<TwelveCardTenGameHomeScreen> createState() =>
      _TwelveCardTenGameHomeScreenState();
}

class _TwelveCardTenGameHomeScreenState
    extends State<TwelveCardTenGameHomeScreen> {
  List<String> cardImageList = [
    Assets.cardRpj,
    Assets.cardRpk,
    Assets.cardRpq,
    Assets.cardRsj,
    Assets.cardRsk,
    Assets.cardRsq,
    Assets.cardBpj,
    Assets.cardBlk,
    Assets.cardBlj,
    Assets.cardBlq,
    Assets.cardBpk,
    Assets.cardBpq
  ];

  final dummyController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerConst(
        gradient: LinearGradient(colors: [
          Colors.orange.shade200,
          Colors.pink.shade100,
          Colors.pink.shade100
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        color: Colors.red,
        child: Column(
          children: [HeaderSection(), headerBottom(), gameContent()],
        ),
      ),
      bottomNavigationBar: bottomContent(),
    );
  }

  Widget gameContent() {
    return ContainerConst(
      alignment: Alignment.center,
      height: screenHeight / 1.24,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerConst(
            padding: const EdgeInsets.all(10),
            width: screenWidth / 1.8,
            alignment: Alignment.center,
            child:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            cardInfoContentDesign("12 Card 5", ""),
                            cardInfoContentDesign("Play", "5 Pts"),
                            cardInfoContentDesign("Win", "50 Pts"),
                          ],
                        ),
                        Sizes.spaceHeight25,
                        gameGrid(),
                        Sizes.spaceHeight15,
                        SizedBox(
                          width: screenWidth/3.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              allBettingFieldUi("", dummyController, width: screenWidth/17 ,labelAllowed: false),
                              allBettingFieldUi("", dummyController, width: screenWidth/17,labelAllowed: false),
                              allBettingFieldUi("", dummyController, width: screenWidth/17,labelAllowed: false),
                              allBettingFieldUi("", dummyController, width: screenWidth/17,labelAllowed: false),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth/3.5,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          allBettingFieldUi("All J", dummyController),
                          const Spacer(),
                          allBettingFieldUi("All Q", dummyController),
                          const Spacer(),
                          allBettingFieldUi("All K", dummyController),
                          Sizes.spaceHeight15,
                          ContainerConst(
                            width: screenWidth/13,
                            height: screenWidth/45,
                            color: const Color(0xff1bf507),
                            child: const TextConst(text: "LP (L)",textColor: Colors.white,),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Sizes.spaceHeight15,
                Container(
                  width: screenWidth/2.32,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      allBettingFieldUi("0", dummyController,labelAllowed: false, width: screenWidth/17, color:Colors.transparent),
                      Sizes.spaceWidthThree,
                      allBettingFieldUi("0", dummyController, labelAllowed: false, color: Colors.transparent),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ContainerConst(
            width: screenWidth / 2.3,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Widget gameGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: screenWidth / 3.5,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 25.0,
              // mainAxisSpacing: 5.0,
              childAspectRatio: screenWidth * 0.00036,
            ),
            itemCount: cardImageList.length,
            itemBuilder: (context, index) {
              return gridItem(
                cardImageList[index],
                'Item ${index + 1}',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget gridItem(String imageUrl, String initialText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ContainerConst(
          padding: const EdgeInsets.all(7),
          alignment: Alignment.center,
          border: Border.all(),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          child: ContainerConst(
            border: Border.all(),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFieldConst(
          border: Border.all(),
          height: 30,
        ),
      ],
    );
  }

  Widget allBettingFieldUi(String title, TextEditingController controller, {bool labelAllowed=true, double? width, Color? color}){
    return !labelAllowed?TextFieldConst(
      fieldRadius: BorderRadius.zero,
      filled: true,
      fillColor:color??Colors.green,
      width:width??screenWidth/13,
      controller: controller,
      border: Border.all(),
      label: title,
      height: 30,
      hintColor: Colors.black,
      borderRadius: BorderRadius.zero,
    ):Column(
      children: [
        TextConst(text: title, fontSize: Sizes.fontSizeTwo,),
        Sizes.spaceHeight5,
        TextFieldConst(
          fieldRadius: BorderRadius.zero,
          filled: true,
          fillColor: Colors.green,
          width:screenWidth/13,
          controller: controller,
          border: Border.all(),
          height: 30,
        ),
      ],
    );
  }

  Widget headerBottom() {
    return ContainerConst(
      height: screenHeight / 25,
      color: Colors.blue,
      child: Row(
        children: [
          headerBottomContentDesign("Draw", "11:40 PM"),
          headerBottomContentDesign("Left", "00:05: AM"),
          headerBottomContentDesign("Next Draw", ""),
        ],
      ),
    );
  }

  Widget headerBottomContentDesign(String key, String value) {
    return ContainerConst(
      width: screenWidth / 7.5,
      child: TextConst(text: "$key:  $value"),
    );
  }

  Widget cardInfoContentDesign(String key, String value) {
    return ContainerConst(
      width: screenWidth / 10,
      child: TextConst(text: "$key:  $value",),
    );
  }


  Widget bottomContent() {
    return ContainerConst(
      width: screenWidth,
      child: Row(
        children: [
          bottomButtonDesign("TSN", buttonWidth: screenWidth / 20),
          const Spacer(),
          bottomButtonDesign(
            "Clear",
          ),
          bottomButtonDesign("Buy", color: const Color(0xff1bf507)),
          bottomButtonDesign(
            "Upcoming",
          ),
          bottomButtonDesign("Barcode", color: const Color(0xfff0cf8d)),
          bottomButtonDesign(
            "Result",
          ),
          bottomButtonDesign("Report", color: const Color(0xfff0cf8d)),
          bottomButtonDesign(
            "Lobby",
          ),
          bottomButtonDesign("Password", color: const Color(0xfff0cf8d)),
          bottomButtonDesign("Exit", color: GameColor.gameRed),
        ],
      ),
    );
  }

  Widget bottomButtonDesign(String label, {double? buttonWidth, Color? color}) {
    return ButtonConst(
      onTap: () {
        Navigator.of(context).pop();
      },
      height: 35,
      color: color ?? Colors.purple,
      borderRadius: BorderRadius.circular(0),
      width: buttonWidth ?? screenWidth / 12,
      textColor: Colors.black,
      label: label,
    );
  }
}
