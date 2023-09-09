import 'package:flutter/material.dart';
import 'package:pamride/widgets/change_them_button.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChangeThemeButtonWidget(),
              IconButton(
                icon: Icon(Icons.close), // "more_vert" icon
                onPressed: () {
                  // Add your button's action here
                  // This function will be called when the button is pressed
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
