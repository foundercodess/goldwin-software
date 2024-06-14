import 'package:desktopgame/constant/dynamic-size.dart';
import 'package:desktopgame/main.dart';
import 'package:desktopgame/view/const-widget/button-const.dart';
import 'package:desktopgame/view/const-widget/container-const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonActionDialog extends StatefulWidget {
  final String? titleText;
  final String messageText;
  final void Function()? yesTapped;
  const CommonActionDialog(
      {super.key, this.titleText, required this.messageText, this.yesTapped});

  @override
  State<CommonActionDialog> createState() => _CommonActionDialogState();
}

class _CommonActionDialogState extends State<CommonActionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      child: ContainerConst(
        padding: const EdgeInsets.fromLTRB(7, 3, 7, 7),
        border: Border.all(color: Colors.black.withOpacity(0.6), width: 1),
        color: Colors.white,
        width: screenWidth / 3.5,
        height: screenWidth / 7,
        borderRadius: BorderRadius.circular(2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.titleText??"Message",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: Sizes.fontSizeTwo,
                        height: 0.8),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.clear_sharp,
                      color: Colors.grey,
                    ))
              ],
            ),
            Sizes.spaceHeight5,
            Text(
              widget.messageText,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: Sizes.fontSizeTwo,
                    height: 0.8),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonConst(
                  onTap: widget.yesTapped,
                  color: Colors.transparent,
                  border: Border.all(width: 1, color: Colors.black),
                  width: screenWidth / 10,
                  height: 25,
                  borderRadius: BorderRadius.circular(1),
                  label: "Yes",
                  textColor: Colors.black,
                ),
                ButtonConst(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.transparent,
                  border: Border.all(width: 1, color: Colors.black),
                  width: screenWidth / 10,
                  height: 25,
                  borderRadius: BorderRadius.circular(1),
                  label: "No",
                  textColor: Colors.black,
                ),
              ],
            ),
            Sizes.spaceHeight15
          ],
        ),
      ),
    );
  }
}
