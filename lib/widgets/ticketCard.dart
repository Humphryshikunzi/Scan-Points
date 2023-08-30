import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';  
import 'package:pamride/components/constant.dart';
import 'package:super_banners/super_banners.dart'; 
import '../helpers/ColorsRes.dart';

class TicketCard extends StatefulWidget {
  final String price;
  final String destination;
  final String placeOfStart;
  final String name;
  final String id;
  final bool? stops;
  final double totalTime;
  final String status;
  final String estimatedTime;
  final String estimatedDistance;
  final String departureDate;
  final String profilePictureDataUrl;
  final String departureTime;

  TicketCard(
      {required this.price,
      required this.name,
      required this.id,
      required this.destination,
      required this.placeOfStart,
      this.stops,
      required this.totalTime,
      required this.status,
      required this.estimatedDistance,
      required this.estimatedTime,
      required this.departureDate,
      required this.departureTime,
      required this.profilePictureDataUrl});

  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> { 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
      child: Card(
        elevation: 5.0,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, bottom: 20),
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _iconDestination(),
                          _originAndDestionation(),
                          _originAndDestionationIcon(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CornerBanner(
                  bannerPosition: CornerBannerPosition.topRight,
                  bannerColor: ColorsRes.orangeColor,
                  child: Text(
                    "KES ${widget.price}",
                    style: GoogleFonts.overpass(
                        color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _originAndDestionationIcon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.placeOfStart.substring(0, 3).toUpperCase(),
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 15),
        Icon(Icons.arrow_downward, color: Colors.green, size: 30),
        SizedBox(height: 15),
        Text(widget.destination.substring(0, 3).toUpperCase(),
            style: TextStyle(fontSize: 25)),
      ],
    );
  }

  Widget _originAndDestionation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        /// origin displaying section
        RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "Origin \n",
                style: TextStyle(color: Colors.blue, fontSize: 14)),
            TextSpan(
              text: widget.placeOfStart.length >= 15
                  ? widget.placeOfStart.substring(0, 15) + '...'
                  : widget.placeOfStart,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            )
          ]),
        ),
        SizedBox(
          height: 10,
        ),

        /// estimated distance dsiplaying section
        Row(
          children: [
            RichText(
              text: TextSpan(
                  text: "Distance: ",
                  style: TextStyle(color: Color(0xFFFb7b7c5), fontSize: 14)),
            ),
            RichText(
              text: TextSpan(
                  text: widget.estimatedDistance,
                  style: TextStyle(color: Colors.black, fontSize: 14)),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),

        /// estimated time dsiplaying section
        Row(
          children: [
            RichText(
              text: TextSpan(
                  text: "Duration: ",
                  style: TextStyle(color: Color(0xFFFb7b7c5), fontSize: 14)),
            ),
            RichText(
              text: TextSpan(
                  text: (widget.estimatedTime).toString(),
                  style: TextStyle(color: Colors.black, fontSize: 14)),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),

        /// departure date time displaying section
        Column(
          children: [
            RichText(
              text: TextSpan(
                  text: "Departure Date/Time: ",
                  style: TextStyle(color: Color(0xFFFb7b7c5), fontSize: 14)),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: widget.departureDate,
                  style: TextStyle(color: Colors.black, fontSize: 14)),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),

        /// profile picture displaying section
        Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.profilePictureDataUrl),
            )),
        SizedBox(
          height: 10,
        ),

        /// destination displaying section
        RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "Destination \n",
                style: TextStyle(color: Colors.red, fontSize: 14)),
            TextSpan(
              text: widget.destination.length >= 15
                  ? widget.destination.substring(0, 15) + '...'
                  : widget.destination,
              style: TextStyle(fontSize: 17, color: Colors.black),
            )
          ]),
        ),
      ],
    );
  }

  Widget _iconDestination() {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(Icons.car_rental, color: Colors.blue, size: 30),
          Icon(Icons.fiber_manual_record, color: Colors.green, size: 12),
          Icon(Icons.fiber_manual_record, color: Colors.green, size: 12),
          Icon(Icons.fiber_manual_record, color: Colors.green, size: 12),
          Icon(Icons.fiber_manual_record, color: primaryColor, size: 12),
          Icon(Icons.fiber_manual_record, color: primaryColor, size: 12),
          Icon(Icons.fiber_manual_record, color: primaryColor, size: 12),
          Icon(Icons.location_on, color: Colors.red, size: 30),
        ],
      ),
    );
  }
}
