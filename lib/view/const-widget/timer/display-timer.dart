// live_time_display.dart
import 'package:desktopgame/view/const-widget/timer/timer-class.dart';
import 'package:flutter/material.dart';

import '../../../constant/dynamic-size.dart';
import '../text-const.dart';


class LiveTimeDisplay extends StatelessWidget {
  final LiveTime liveTime = LiveTime();

  LiveTimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: liveTime.getTimeStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return TextConst(
              text: "${snapshot.data}",
              textColor: Colors.white,
              fontSize: Sizes.fontSizeTwo,
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
