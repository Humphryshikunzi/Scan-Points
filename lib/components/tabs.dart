import 'package:flutter/material.dart';
import 'package:pamride/models/category.dart';
import 'package:pamride/services/app_state.dart';
import 'package:pamride/widgets/catgeory_widget.dart';
import 'package:provider/provider.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 30.0),
          child: Consumer<AppState>(
            builder: (context, appState, _) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width - 82,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (final category in categories)
                      CategoryWidget(
                        category: category,
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
