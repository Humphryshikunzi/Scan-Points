import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pamride/controllers/reponsiveness.dart';
import 'package:pamride/helpers/ColorsRes.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/images/drivinglicence.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              color: ColorsRes.gradientTwoColor,
              icon: Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              }),
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 32),
                    children: [
                      TextSpan(
                          text: 'Safiri',
                          style: GoogleFonts.overpass(
                              fontWeight: FontWeight.w200)),
                      TextSpan(
                          text: 'Car',
                          style: GoogleFonts.overpass(
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
            Stack(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: dark.withOpacity(.7),
                    ),
                    onPressed: () {}),
                Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: light, width: 2)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
