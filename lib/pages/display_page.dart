import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_shayari/ui_helder/utils.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayPage extends StatefulWidget {
  String catename, shayari;

  DisplayPage({super.key, required this.catename, required this.shayari});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2(widget.catename),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white30,
                  border: Border.all(
                    color: blueColor,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.shayari,
                        style: setTextStyle(16, blackColor, FontWeight.w600),
                      ),
                    ),
                    Container(
                      color: blueColor,
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        setGestureDetector(context, "assets/icons/img_copy.png",
                            () {
                          Clipboard.setData(
                              ClipboardData(text: widget.shayari));
                          Get.snackbar(
                            "Copied",
                            widget.shayari,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: EdgeInsets.all(20),
                            backgroundColor: blueColor,
                            snackStyle: SnackStyle.FLOATING,
                          );
                        }),
                        SizedBox(
                          width: 20,
                        ),
                        setGestureDetector(
                            context, "assets/icons/img_whatsapp.png", () {
                          print("Whatsapp");
                          _launchURL(widget.shayari.toString());
                        }),
                        SizedBox(
                          width: 20,
                        ),
                        setGestureDetector(
                            context, "assets/icons/img_share.png", () {
                          print("Share");
                          Share.share(widget.shayari.toString());
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

_launchURL(String urlname) async {
  final Uri url = Uri.parse("https://wa.me/?text=" + urlname);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
