// import 'package:desktopgame/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:window_manager/window_manager.dart';
//
// class HeightWidthTest extends StatelessWidget {
//   const HeightWidthTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await WindowManager.instance.close();
//         },
//         child: const Icon(Icons.cancel),
//       ),
//       body: Center(child: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return Container(
//             height: screenHeight,
//             width: screenWidth,
//             color: Colors.green,
//             alignment: Alignment.center,
//             child: Text("Height= $screenHeight ---||--- Width= $screenWidth"),
//           );
//         },
//       )),
//     );
//   }
// }

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImagePickerTest extends StatefulWidget {
  const ImagePickerTest({super.key});

  @override
  State<ImagePickerTest> createState() => _ImagePickerTestState();
}

class _ImagePickerTestState extends State<ImagePickerTest> {
  String selectedFile = "";

  Uint8List? image;

  void _selectFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = result.files.first.name;
      });
      image = result.files.first.bytes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  _selectFile();
                },
                child: const Text("Browse",style: TextStyle(color: Colors.black),)),
            if (image != null)
              Image.memory(
                image!,
                height: 200,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
