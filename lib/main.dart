import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShareMedia(),
    );
  }
}

class ShareMedia extends StatefulWidget {
  const ShareMedia({super.key});

  @override
  State<ShareMedia> createState() => _ShareMediaState();
}

class _ShareMediaState extends State<ShareMedia> {
  final url =
      "https://pilotbazar.com/storage/vehicles/xdm5tQGbiOpDy25xEeWGW5La1lAJL6bEhCauRfBl.jpg";
  String msg1 = "Hello bhai kiya hall hai";
  String msg2 =
      "50% off on all products https://pilotbazar.com/storage/vehicles/xdm5tQGbiOpDy25xEeWGW5La1lAJL6bEhCauRfBl.jpg";

  shareImageandText  () async {
                  final uri = Uri.parse(url);
                  final response = await http.get(uri);
                  final imageBytes = response.bodyBytes;
                  final tempDirectory = await getTemporaryDirectory();
                  final tempFile =
                      await File('${tempDirectory.path}/sharedImage.jpg')
                          .create();
                  await tempFile.writeAsBytes(imageBytes);

                  final image = XFile(tempFile.path);
                  await Share.shareXFiles([image], text: "jsflskjflsjdf");
                }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [

        // this image show up to the share option
        Image.network(url),
        Center(
            child: ElevatedButton.icon(
                onPressed: shareImageandText,
                icon: Icon(Icons.share),
                label: Text("SHARE"))),
      ],
    )));
  }
}
