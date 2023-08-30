import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart'
    hide TravelMode;
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_distance_matrix/google_distance_matrix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/Constant.dart';
import '../../helpers/DesignConfig.dart';

class PickLocations extends StatefulWidget {
  @override
  _PickLocationsState createState() => _PickLocationsState();
}

class _PickLocationsState extends State<PickLocations> {
  GoogleDistanceMatrix googleDistanceMatrix = GoogleDistanceMatrix();
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApikey = Constant.googleMapsAPIKey;
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(-1.0, 37.0);
  String pickupLocationTxt = "Search start location";
  String dropLocationTxt = "Search destination location";
  int distance = 0;
  double pickupLat = 0.0;
  double dropLat = 0.0;
  double pickupLon = 0.0;
  double dropLon = 0.0;
  String? countryAbbrev = 'ke';
  Set<Marker> list = <Marker>{};
  Map<PolylineId, Polyline> polylines = {};

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void _getDistanceMatrix() async {
    var distanceMatrix = await googleDistanceMatrix.getDistance(
      googleApikey,
      origin: Coordinate(latitude: '-7.7665339', longitude: '110.3333601'),
      destination: Coordinate(latitude: '-7.7602694', longitude: '110.4051345'),
    );

    setState(() {
      distance = distanceMatrix;
    });
  }

  @override
  void initState() {
    super.initState();
    getCountryAbbrev();
    _getDistanceMatrix();
    analytics.setCurrentScreen(screenName: "Pick Locations");
  }

  Future<void> getCountryAbbrev() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      countryAbbrev = _prefs.getString("cAbbrev")!;
    });
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApikey,
      PointLatLng(pickupLat, pickupLon),
      PointLatLng(dropLat, dropLon),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      //
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Choose Locations",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: ColorsRes.backgroundColor,
      ),
      body: Stack(children: [
        GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: startLocation,
            zoom: 10.0,
          ),
          mapType: MapType.normal,
          polylines: Set<Polyline>.of(polylines.values),
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
        ),
        Positioned(
          top: 10,
          child: InkWell(
            onTap: () async {
              var place = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleApikey,
                  mode: Mode.overlay,
                  types: [],
                  strictbounds: false,
                  components: [Component(Component.country, countryAbbrev!)],
                  onError: (err) {
                    //
                  });

              if (place != null) {
                setState(() {
                  pickupLocationTxt = place.description.toString();
                });

                final plist = GoogleMapsPlaces(
                  apiKey: googleApikey,
                  apiHeaders: await GoogleApiHeaders().getHeaders(),
                );
                String placeid = place.placeId ?? "0";
                final detail = await plist.getDetailsByPlaceId(placeid);
                final geometry = detail.result.geometry!;
                final lat = geometry.location.lat;
                final lang = geometry.location.lng;
                pickupLat = lat;
                pickupLon = lang;
                var newlatlang = LatLng(lat, lang);
                list.add(Marker(
                  markerId: MarkerId('Start'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: newlatlang,
                ));
                mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: newlatlang, zoom: 17),
                  ),
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListTile(
                    title: Text(
                      pickupLocationTxt,
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Icon(Icons.search),
                    dense: true,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 70,
          child: InkWell(
            onTap: () async {
              var place = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleApikey,
                  mode: Mode.overlay,
                  types: [],
                  strictbounds: false,
                  components: [Component(Component.country, countryAbbrev!)],
                  onError: (err) {
                    //
                  });

              if (place != null) {
                setState(() {
                  dropLocationTxt = place.description.toString();
                });

                final plist = GoogleMapsPlaces(
                  apiKey: googleApikey,
                  apiHeaders: await GoogleApiHeaders().getHeaders(),
                );
                String placeid = place.placeId ?? "0";
                final detail = await plist.getDetailsByPlaceId(placeid);
                final geometry = detail.result.geometry!;
                final lat = geometry.location.lat;
                final lang = geometry.location.lng;
                dropLat = lat;
                dropLon = lang;
                var newlatlang = LatLng(lat, lang);
                list.add(Marker(
                  markerId: MarkerId('Destination'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: newlatlang,
                ));
                double miny = (pickupLat <= dropLat) ? pickupLat : dropLat;
                double minx = (pickupLon <= dropLon) ? pickupLon : dropLon;
                double maxy = (pickupLat <= dropLat) ? dropLat : pickupLat;
                double maxx = (pickupLon <= dropLon) ? dropLon : pickupLon;

                double southWestLatitude = miny;
                double southWestLongitude = minx;

                double northEastLatitude = maxy;
                double northEastLongitude = maxx;
                mapController?.animateCamera(
                  CameraUpdate.newLatLngBounds(
                    LatLngBounds(
                      northeast: LatLng(northEastLatitude, northEastLongitude),
                      southwest: LatLng(southWestLatitude, southWestLongitude),
                    ),
                    100.0,
                  ),
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                child: Container(
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width - 40,
                    child: ListTile(
                      title: Text(
                        dropLocationTxt,
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.search),
                      dense: true,
                    )),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Center(child: _buildBottomNavigationBar()),
        ),
      ]),
    );
  }

  Widget _buildBottomNavigationBar() => Material(
        color: Colors.transparent,
        shape: ContinuousRectangleBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        child: InkWell(
          onTap: () {
            Get.to(() => PickLocations());
          },
          splashColor: Colors.orange,
          child: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              'CONTINUE',
              style: GoogleFonts.overpass(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            decoration: DesignConfig.buttonShadowColor(
                ColorsRes.continueShoppingGradient2Color,
                37,
                Colors.deepOrangeAccent),
          ),
        ),
      );
}
