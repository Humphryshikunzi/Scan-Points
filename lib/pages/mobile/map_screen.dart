import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' hide Polyline;
import 'package:google_maps_webservice/places.dart';
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/Maps.dart';
import 'package:pamride/pages/mobile/post_ride_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/ColorsRes.dart';
import '../../helpers/DesignConfig.dart';
import '../../models/directions.dart';
import 'package:geocode/geocode.dart';

List<MaterialColor> colors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.yellow,
  Colors.brown
];
List<String> routeDistances = [];
List<String> routeDurations = [];

class MapScreen extends StatefulWidget {
  /// modfication of the constructor to rececive a value (Location Clicked) from the Landing page
  final String originToCompare;
  final String destinationToCompare;
  final Map<String, String> myCars;

  MapScreen(
      {this.originToCompare = '',
      this.destinationToCompare = '',
      required this.myCars,
      Key? key})
      : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-1.0, 37.0),
    zoom: 10,
  );

  late GoogleMapController _googleMapController;
  Marker? _origin = null;
  Marker? _destination = null;
  Directions? _info;
  int selectedColorIndex = 0;
  String pickupLocationTxt = "Enter start location";
  String dropLocationTxt = "";
  double pickupLat = 0.0;
  double dropLat = 0.0;
  double pickupLon = 0.0;
  double dropLon = 0.0;
  bool routeSelected = false;
  int routeIndex = 0;
  String totalDuration = '';
  String selectedDistance = '';
  String? countryAbbrev = 'ke';

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getCountryAbbrev();
    dropLocationTxt = widget.destinationToCompare == ""
        ? "Enter destination"
        : "Click to search \"" + widget.destinationToCompare + "\"";
    routeDistances.clear();
    super.initState();
    analytics.setCurrentScreen(screenName: "Map Screen");
  }

  final Set<Polyline> _polylines = {};
  final directions = GoogleMapsDirections(apiKey: Constant.googleMapsAPIKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: ColorsRes.backgroundColor,
        centerTitle: false,
        title: const Text(
          'Trip Locations',
          style: TextStyle(color: Colors.black),
        ),
        actions: [],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            onTap: (LatLng location) async {
              final currentAddress = await GeoCode().reverseGeocoding(
                  latitude: location.latitude, longitude: location.longitude);
              if (pickupLocationTxt == "Enter start location") {
                setState(() {
                  pickupLocationTxt = currentAddress.streetAddress.toString();
                });
                pickupLat = location.latitude;
                pickupLon = location.longitude;
                var newlatlang = LatLng(location.latitude, location.longitude);
                _addMarker(newlatlang, true);
                _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: newlatlang, zoom: 17),
                  ),
                );
              } else {
                setState(() {
                  dropLocationTxt = currentAddress.streetAddress.toString();
                });
                dropLat = location.latitude;
                dropLon = location.longitude;
                var newlatlang = LatLng(dropLat, dropLon);
                _addMarker(newlatlang, false);
                double miny = (pickupLat <= dropLat) ? pickupLat : dropLat;
                double minx = (pickupLon <= dropLon) ? pickupLon : dropLon;
                double maxy = (pickupLat <= dropLat) ? dropLat : pickupLat;
                double maxx = (pickupLon <= dropLon) ? dropLon : pickupLon;

                double southWestLatitude = miny;
                double southWestLongitude = minx;

                double northEastLatitude = maxy;
                double northEastLongitude = maxx;
                _googleMapController.animateCamera(
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
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!
            },
            polylines: _polylines,
          ),
          if (_info != null)
            Positioned(
              bottom: 80.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  'Distance: ${_info!.totalDistance}, Apx Duration: ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 10,
            child: InkWell(
              onTap: () async {
                var place = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: Constant.googleMapsAPIKey,
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
                    apiKey: Constant.googleMapsAPIKey,
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
                  _addMarker(newlatlang, true);
                  _googleMapController.animateCamera(
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
                      )),
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
                    apiKey: Constant.googleMapsAPIKey,
                    mode: Mode.overlay,
                    types: [],
                    strictbounds: false,
                    components: [Component(Component.country, countryAbbrev!)],
                    onError: (err) {
                      // do something with the error
                    });

                if (place != null) {
                  setState(() {
                    dropLocationTxt = place.description.toString();
                  });

                  final plist = GoogleMapsPlaces(
                    apiKey: Constant.googleMapsAPIKey,
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
                  _addMarker(newlatlang, false);
                  double miny = (pickupLat <= dropLat) ? pickupLat : dropLat;
                  double minx = (pickupLon <= dropLon) ? pickupLon : dropLon;
                  double maxy = (pickupLat <= dropLat) ? dropLat : pickupLat;
                  double maxx = (pickupLon <= dropLon) ? dropLon : pickupLon;
                  double southWestLatitude = miny;
                  double southWestLongitude = minx;
                  double northEastLatitude = maxy;
                  double northEastLongitude = maxx;
                  _googleMapController.animateCamera(
                    CameraUpdate.newLatLngBounds(
                      LatLngBounds(
                        northeast:
                            LatLng(northEastLatitude, northEastLongitude),
                        southwest:
                            LatLng(southWestLatitude, southWestLongitude),
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
          Visibility(
            visible: routeDistances.isNotEmpty,
            child: Positioned(
              bottom: 100.0,
              left: 10.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: ColorsRes.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    Text(
                      'SELECT YOUR ROUTE:',
                      style: TextStyle(color: Colors.black, fontSize: 11.0),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: routeDistances.length,
                        itemBuilder: (c, i) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                routeSelected = true;
                                routeIndex = i;
                                selectedDistance = routeDistances[i];
                                totalDuration = routeDurations[i];
                                selectedColorIndex = i;
                                routeDistances.removeWhere((element) {
                                  return element != routeDistances.elementAt(i);
                                });
                                _polylines.removeWhere((element) =>
                                    element != _polylines.elementAt(i));
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              height: 20.0,
                              decoration: DesignConfig.buttonShadowColor(
                                  ColorsRes.continueShoppingGradient2Color,
                                  5,
                                  Colors.deepOrangeAccent),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    color: !routeSelected
                                        ? colors[i]
                                        : colors[selectedColorIndex],
                                  ),
                                  Text(
                                    routeDistances[i],
                                    style: TextStyle(fontSize: 11.0),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _addMarker(LatLng pos, bool origin) async {
    setState(() {
      routeSelected = false;
    });
    if (origin) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;
      });
    } else if (!origin) {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      //final directions = await DirectionsRepository().getDirections(origin: _origin!.position, destination: pos);
      //setState(() => _info = directions);
      _getDirections(_origin!.position, pos);
    }
  }

  void _getDirections(LatLng origin, LatLng destination) async {
    // Clear existing polylines
    setState(() {
      _polylines.clear();
    });

    // Get directions from the Google Maps Directions API
    final result = await directions.directionsWithLocation(
      Location(lat: origin.latitude, lng: origin.longitude),
      Location(lat: destination.latitude, lng: destination.longitude),
      alternatives: true,
      travelMode: TravelMode.driving,
      transitRoutingPreference: TransitRoutingPreferences.fewerTransfers,
    );
    // If the API returned a valid result
    if (result.isOkay) {
      int colorIndex = 0;
      routeDistances = [];
      routeDurations = [];

      // Add a polyline for each route to the map
      result.routes.forEach((route) {
        setState(() {
          _polylines.add(
            Polyline(
              polylineId: PolylineId(route.summary),
              points:
                  Utils().decodeEncodedPolyline(route.overviewPolyline.points),
              color: colors[colorIndex],
              width: 4,
            ),
          );
          if ((route.legs).isNotEmpty) {
            final leg = route.legs[0];
            routeDistances.add(leg.distance.text);
            routeDurations.add(leg.duration.text);
          } else {
            routeDistances.add("N/A");
            routeDurations.add("N/A");
          }
          colorIndex++;
        });
      });
    }
  }

  Future<void> getCountryAbbrev() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      countryAbbrev = _prefs.getString("cAbbrev")!;
    });
  }

  Widget _buildBottomNavigationBar() => Material(
        color: Colors.transparent,
        shape: ContinuousRectangleBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        child: InkWell(
          onTap: () {
            routeSelected
                ? Get.to(() => PostRideForm(
                      origin: pickupLocationTxt,
                      distance: selectedDistance,
                      destination: dropLocationTxt,
                      duration: totalDuration,
                      routeIndex: routeIndex,
                      myCars: widget.myCars,
                    ))
                : Text("");
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
                decoration:
                    !routeSelected ? TextDecoration.none : TextDecoration.none,
                color: !routeSelected ? Colors.white60 : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            decoration: DesignConfig.buttonShadowColor(
                !routeSelected
                    ? Colors.grey
                    : ColorsRes.continueShoppingGradient2Color,
                37,
                !routeSelected ? Colors.grey : Colors.deepOrangeAccent),
          ),
        ),
      );
}
