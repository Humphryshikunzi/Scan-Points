import 'package:flutter/foundation.dart';

class RidesPaginate extends ChangeNotifier {
  int ridesCount = 30;

  void incrementVariable() {
    ridesCount += 30;
    notifyListeners();
  }

  String origin = '';
  String destination = '';

  void setOrigin(String origin) {
    this.origin = origin; 
    notifyListeners();
  }
  void setDestination(String destination) { 
    this.destination = destination;
    notifyListeners();
  }
}
