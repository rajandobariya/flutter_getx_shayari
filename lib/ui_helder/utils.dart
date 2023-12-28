import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blackColor = Color(0xFF000000);
const Color whiteColor = Color(0xFFF9F8FD);
const Color blueColor = Color(0xFF2B97FD);

TextStyle setTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return GoogleFonts.getFont('Poppins',
      fontSize: fontSize, color: color, fontWeight: fontWeight);
}

AppBar appBar() {
  return AppBar(
    backgroundColor: blueColor,
    centerTitle: true,
    title: Text(
      'Success Shayari',
      style: setTextStyle(
        20,
        whiteColor,
        FontWeight.w500,
      ),
    ),
  );
}

AppBar appBar2(String name) {
  return AppBar(
    iconTheme: IconThemeData(color: whiteColor),
    backgroundColor: blueColor,
    title: Text(name, style: setTextStyle(20, whiteColor, FontWeight.w500)),
  );
}

InkWell setInkWell(BuildContext context, String image, Callback onTap) {
  return InkWell(
    onTap: () {
      onTap.call();
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Container setContainer(String name) {
  return Container(
    margin: EdgeInsets.all(6),
    child: Text(
      name,
      style: setTextStyle(16, blackColor, FontWeight.w600),
    ),
  );
}

InkWell setContainerText(String name, Callback onTap) {
  return InkWell(
    onTap: () {
      onTap.call();
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white30,
        border: Border.all(
          color: blueColor,
        ),
      ),
      margin: EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            name,
            style: setTextStyle(16, blackColor, FontWeight.w600),
          ),
        ),
      ),
    ),
  );
}

GestureDetector setGestureDetector(
    BuildContext context, String image, Callback onTap) {
  return GestureDetector(
    onTap: () {
      onTap.call();
    },
    child: Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blueColor,
      ),
      height: 40,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        color: whiteColor,
      ),
    ),
  );
}
