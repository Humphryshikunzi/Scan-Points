import 'package:flutter/material.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:pamride/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    String modeText = themeProvider.isDarkMode
        ? translation(context).lightMode
        : translation(context).darkMode;

    return Container(
      child: Row(
        children: [
          Switch.adaptive(
            value: themeProvider.isDarkMode,
            activeColor: ColorsRes.secondaryColor,
            onChanged: (value) {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(value);
            },
          ),
          Text(modeText),
        ],
      ),
    );
  }
}
