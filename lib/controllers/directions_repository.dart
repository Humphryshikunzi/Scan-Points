import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/directions.dart';

class DirectionsRepository {
  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      "https://maps.googleapis.com/maps/api/directions/json?alternatives=true&origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=AIzaSyCzL2agVqlBJXUIcxLhFBj16n68Bl3gnAg",
      /* queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': "AIzaSyCzL2agVqlBJXUIcxLhFBj16n68Bl3gnAg",
        'alternatives': true,
      },*/
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    } else {}
    return Directions(
        bounds: LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0)),
        polylinePoints2: [],
        polylinePoints: [],
        totalDistance: '',
        totalDuration: '');
  }
}
