import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'ColorsRes.dart';
import 'FirebaseImageConstant.dart';

class DesignConfig {
  static RoundedRectangleBorder setRoundedBorder(
      Color bordercolor, double bradius, bool issetside) {
    return RoundedRectangleBorder(
        side: new BorderSide(color: bordercolor, width: issetside ? 1.0 : 0),
        borderRadius: BorderRadius.circular(bradius));
  }

  static RoundedRectangleBorder setHalfRoundedBorder(
      Color bordercolor,
      double bradius1,
      double bradius2,
      double bradius3,
      double bradius4,
      bool issetside) {
    return RoundedRectangleBorder(
        side: new BorderSide(color: bordercolor, width: issetside ? 1.0 : 0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(bradius1),
            bottomLeft: Radius.circular(bradius2),
            topRight: Radius.circular(bradius3),
            bottomRight: Radius.circular(bradius4)));
  }

  static BoxDecoration boxDecorationContainerRoundHalf(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
    );
  }

  static BoxDecoration boxDecorationContainerShadow(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
      boxShadow: [
        new BoxShadow(
            color: color,
            offset: new Offset(0.0, 2.0),
            blurRadius: 6.0,
            spreadRadius: 0)
      ],
    );
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationContainerborder(
      Color color, double radius) {
    return BoxDecoration(
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static const BoxShadow boxShadow = const BoxShadow(
    color: Colors.black12,
    offset: Offset(3, 3),
    blurRadius: 5,
  );

  static BoxDecoration buttonShadow(
      Color btncolor, double radius, Color bordercolor) {
    return BoxDecoration(
        color: btncolor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        border: Border.all(color: bordercolor),
        boxShadow: [
          BoxShadow(
            color: btncolor.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]);
  }

  static BoxDecoration buttonShadowColor(
      Color btncolor1, double radius, Color btncolor2) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Color(0x29000000),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 3),
        )
      ],
      gradient: LinearGradient(
        colors: [
          btncolor1,
          btncolor2,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0, 2],
      ),
    );
  }

  static BoxDecoration boxDecorationHalfContainerShadow(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
      boxShadow: [
        new BoxShadow(
            color: color,
            offset: new Offset(0.0, 2.0),
            blurRadius: 6.0,
            spreadRadius: 0)
      ],
    );
  }

  static Widget shadowButton(Color btncolor, String btntext, Color textcolor,
      double radius, Color bordercolor) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        alignment: Alignment.center,
        decoration: buttonShadow(btncolor, radius, bordercolor),
        child: Text(
          btntext,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textcolor,
          ),
        ),
      ),
    );
  }

  static Widget shadowButtonFullwidgth(Color btncolor, String btntext,
      Color textcolor, double radius, Color bordercolor, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      alignment: Alignment.center,
      decoration: buttonShadow(btncolor, radius, bordercolor),
      child: Text(
        btntext,
        style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              fontWeight: FontWeight.bold,
              color: textcolor,
            )),
      ),
    );
  }

  static setAppbar(String title, BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(67.0),
      child: Container(
        decoration: DesignConfig.boxDecorationContainerShadow(
            ColorsRes.containerShadowColor, 14, 14, 14, 14),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          )),
          backgroundColor: ColorsRes.white,
          shadowColor: Color(0xffffe8b7),
          //centerTitle: true,
          title: Text(
            title,
            style: TextStyle(color: ColorsRes.orangeColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: ColorsRes.orangeColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: ColorsRes.black,
          ),
        ),
      ),
    );
  }

  static Widget displayCourseImage(
      String? image, double height, double width, String? hash) {
    return FirebaseImageConstant.isfirebaseimage
        ? OctoImage(
            image: NetworkImage(
              image!,
            ),
            placeholderBuilder: OctoPlaceholder.blurHash(
              hash!,
            ),
            errorBuilder: OctoError.icon(color: Colors.black),
            width: width,
            height: height,
            fit: BoxFit.fill,
          )
        : Image.asset(
            image!,
            width: width,
            height: height,
            fit: BoxFit.fill,
          );
  }
}
