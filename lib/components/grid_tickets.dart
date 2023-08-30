import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/graphql/__generated__/operations.data.gql.dart';
import 'package:pamride/graphql/__generated__/operations.req.gql.dart';
import 'package:pamride/graphql/__generated__/operations.var.gql.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/ticketCard.dart';

class GridTickets extends StatefulWidget {
  @override
  _GridTicketsState createState() => _GridTicketsState();
}

class _GridTicketsState extends State<GridTickets> {
  ClientController _clientController = Get.find<ClientController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Operation(
        operationRequest: GGetRidesReq(),
        client: _clientController.client,
        builder: (BuildContext context,
            OperationResponse<GGetRidesData, GGetRidesVars>? response,
            Object? error) {
          // implement this if the data returned from the query is null
          if (response!.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            );
          }
          // implement this if the data gotten from the query is not null
          else {
             final ridesList = response.data!.rides;
                  List<GGetRidesData_rides> rides = [];
                  ridesList.forEach((p0) {
                    DateTime? departureDate =
                        convertGDateTimeToDateTime(p0.departureDate.toString()).toLocal(); 
                    if (departureDate.isAfter(DateTime.now())) {
                      rides.add(p0);
                    }
                  });
                // get the values from the query and assign them to  a variable called "rides"
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: rides.length,
              itemBuilder: (context, index) {
                return TicketCard(
                  price: rides[index].estimatePrice.toString(),
                  name: rides[index].name.toString(),
                  id: rides[index].id.toString(),
                  destination: rides[index].destination.toString(),
                  placeOfStart: rides[index].placeofStart.toString(),
                  totalTime: 0,
                  status: rides[index].status!,
                  estimatedDistance: rides[index].estimatedDistance.toString(),
                  estimatedTime: rides[index].duration.toString(),
                  departureDate: rides[index].departureDate.toString(),
                  departureTime: rides[index].departureTime.toString(),
                  profilePictureDataUrl: rides[index].users!.length > 0
                      ? rides[index].users![0].user?.profilePictureDataUrl ?? ''
                      : "https://st2.depositphotos.com/1518767/6553/i/600/depositphotos_65537227-stock-photo-handsome-chauffeur-smiling-at-camera.jpg",
                );
              },
            );
          }
        },
      ),
    );
  }
}
