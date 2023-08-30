import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' hide Polyline;
import 'package:pamride/helpers/Constant.dart';
import 'package:pamride/helpers/Maps.dart';
import '../../helpers/ColorsRes.dart';
import '../../models/directions.dart';

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

class MapTrip extends StatefulWidget {
  final String origin;
  final String destination;
  final int routeIndex;

  MapTrip(
      {required this.destination,
      required this.origin,
      required this.routeIndex});
  @override
  _MapTripState createState() => _MapTripState();
}

class _MapTripState extends State<MapTrip> {
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
  String dropLocationTxt = "Enter destination";

  double pickupLat = 0.0;
  double dropLat = 0.0;
  double pickupLon = 0.0;
  double dropLon = 0.0;
  bool routeSelected = false;

  String totalDuration = '';
  String selectedDistance = '';

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    routeDistances.clear();
    init();
    super.initState();
    analytics.setCurrentScreen(screenName: "Map Trip");
  }

  init() async {
    setOrigin().then((value) => setDestination());
  }

  Future<bool> setOrigin() async {
    var data = await Geocoder2.getDataFromAddress(
        address: widget.origin, googleMapApiKey: Constant.googleMapsAPIKey);
    final lat = data.latitude;
    final lang = data.longitude;
    pickupLat = lat;
    pickupLon = lang;
    var newlatlang = LatLng(lat, lang);
    _addMarker(newlatlang, true);
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: newlatlang, zoom: 17),
      ),
    );
    return true;
  }

  setDestination() async {
    var data = await Geocoder2.getDataFromAddress(
        address: widget.destination,
        googleMapApiKey: Constant.googleMapsAPIKey);
    final lat = data.latitude;
    final lang = data.longitude;
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
          northeast: LatLng(northEastLatitude, northEastLongitude),
          southwest: LatLng(southWestLatitude, southWestLongitude),
        ),
        100.0,
      ),
    );
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
        centerTitle: true,
        title: Text(
          '${widget.origin.length > 13 ? widget.origin.substring(0, 13) + '...' : widget.origin} - ${widget.destination.length > 13 ? widget.destination.substring(0, 13) + '...' : widget.destination}',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 100.0,
        backgroundColor: ColorsRes.green,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
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
      _getDirections(_origin!.position, pos);
    }
  }

  void _getDirections(LatLng origin, LatLng destination) async {
    setState(() {
      _polylines.clear();
    });

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
      setState(() {
        _polylines.add(
          Polyline(
            polylineId: PolylineId(result.routes[widget.routeIndex].summary),
            points: Utils().decodeEncodedPolyline(
                result.routes[widget.routeIndex].overviewPolyline.points),
            color: colors[colorIndex],
            width: 4,
          ),
        );
      });
    }
  }
}
