import 'dart:async';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/controllers/client_controller.dart';
import 'package:pamride/pages/mobile/ride_details.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/ride_utlities.dart';
import 'package:pamride/widgets/rides_paginate.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:super_banners/super_banners.dart';
import '../components/constant.dart';
import '../graphql/__generated__/operations.data.gql.dart';
import '../graphql/__generated__/operations.req.gql.dart';
import '../graphql/__generated__/operations.var.gql.dart';
import '../helpers/ColorsRes.dart';
import 'images.dart';

class LandingGrid extends StatefulWidget {
  const LandingGrid({Key? key}) : super(key: key);

  @override
  State<LandingGrid> createState() => _LandingGridState();
}

class _LandingGridState extends State<LandingGrid> {
  ClientController _clientController = Get.find<ClientController>();
  AccountController _accountController = Get.find<AccountController>();
  int? from;
  int? nextFrom;
  int? to;
  int count = 30;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RidesPaginate(),
      child: Operation(
        operationRequest: GGetLatestRidesReq((b) => b..vars.count = 1),
        client: _clientController.client,
        builder: (BuildContext context,
            OperationResponse<GGetLatestRidesData, GGetLatestRidesVars>?
                response,
            Object? error) {
          if (response!.data == null) {
            return Container(
              height: 30,
              width: 150,
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Lottie.asset('assets/assets/loading-animation.json'),
                  Text(
                    'Loading...',
                    style:
                        black16BoldTextStyle.copyWith(color: Colors.blueAccent),
                  ),
                ],
              ),
            );
          } else {
            if (response.data!.latestRides.isNotEmpty) {
              to = response.data!.latestRides.first.id + 1;
              from = (to! > count) ? (to! - count) : 0;
              if (from! < 0) {
                from = 1;
              }
            }

            return Operation(
              operationRequest: GGetRidesReq((b) => b
                ..vars.from = from
                ..vars.to = to
                ..vars.destinationFilter = ''
                ..vars.placeOfStartFilter = ''),
              client: _clientController.client,
              builder: (BuildContext context,
                  OperationResponse<GGetRidesData, GGetRidesVars>? response,
                  Object? error) {
                if (response!.data == null || response.loading) {
                  return Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.only(top: 30),
                    child: Lottie.asset('assets/assets/loading-animation.json'),
                  );
                } else {
                  final ridesList = response.data!.rides;
                  List<GGetRidesData_rides> rides = [];
                  ridesList.forEach((p0) {
                    DateTime currentDateTime = DateTime.now().toUtc();
                    int depTimeDiff = DateTime.parse(p0.departureDate.value).toLocal()
                        .difference(currentDateTime)
                        .inMinutes;
                    if (depTimeDiff > 0) {
                      rides.add(p0);
                    }
                  });

                  return GridView.custom(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(3, 2),
                        QuiltedGridTile(2, 2),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < rides.length) {
                          CustomGridStyle gridStyle = CustomGridStyle(
                              MarginTop: 4,
                              MarginBottom: 4,
                              MarginLeft: 4,
                              MarginRight: 4);

                          if ((index == 0) || (index == 1)) {
                            gridStyle.MarginTop = 0;
                          }

                          return GridRide(
                              ride: rides[index],
                              price: rides[index].estimatePrice.toString(),
                              name: rides[index].name.toString(),
                              rideId: rides[index].id.toString(),
                              destination: rides[index].destination.toString(),
                              origin: rides[index].placeofStart.toString(),
                              totalTime: 0,
                              status: rides[index].status!,
                              carImage: rides[index].car?.imageUrl ?? "",
                              length: rides.length,
                              customGridStyle: gridStyle);
                        } else {
                          Future.delayed(const Duration(seconds: 3), () {
                            _accountController.loadingGrid.value = false;
                          });
                          return Consumer<RidesPaginate>(
                            builder: (context, ridesPaginate, _) {
                              return InkWell(
                                onTap: () {
                                  // get the count for pagination or else set it to 20
                                  // increase the paginated count
                                  Provider.of<RidesPaginate>(context,
                                          listen: false)
                                      .incrementVariable();
                                  count = ridesPaginate.ridesCount;
                                  setState(() {
                                    _accountController.loadingGrid.value = true;
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: Colors.black, width: 0.5),
                                        ),
                                        child: Obx(() {
                                          return Visibility(
                                            visible: !_accountController
                                                .loadingGrid.value,
                                            replacement: Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add_circle_outline,
                                                  color: ColorsRes.orangeColor,
                                                ),
                                                SizedBox(height: 8.0),
                                                Text(
                                                  from == 0
                                                      ? "No More Rides"
                                                      : "LOAD MORE",
                                                  style: GoogleFonts.rubik(
                                                      color:
                                                          ColorsRes.orangeColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      childCount: rides.length + 1,
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  Widget GridRide(
      {required String price,
      required String name,
      required String rideId,
      required String destination,
      required String origin,
      required int totalTime,
      required String status,
      required String carImage,
      required GGetRidesData_rides ride,
      required int length,
      required CustomGridStyle customGridStyle}) {
    return InkWell(
      onTap: () {
        _accountController.rideId = rideId.obs;
        _accountController.cartAmount = price.obs;
        Get.to(
          () => RideDetail(
            ride: ride,
            departureDate: DateTime.parse(ride.departureDate.value.toString()).toLocal(),
          ),
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.only(
                  top: customGridStyle.MarginTop!,
                  bottom: customGridStyle.MarginBottom!,
                  left: customGridStyle.MarginLeft!,
                  right: customGridStyle.MarginRight!),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(getCarImageUrl(carImage)),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: ColorsRes.backgroundColor,
                        gradient: RadialGradient(
                          radius: 4,
                          colors: [
                            Colors.white.withOpacity(1),
                            ColorsRes.backgroundColor,
                          ],
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      height: 20,
                      child: ScrollLoopAutoScroll(
                        scrollDirection: Axis.horizontal,
                        delayAfterScrollInput: Duration(seconds: 4),
                        duration: Duration(
                            seconds: customDuration(origin + destination)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'From: ',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.overpass(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              origin.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.overpass(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "--",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              'To: ',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.overpass(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              destination.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.overpass(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 7,
            left: 7,
            child: CornerBanner(
              bannerColor: ColorsRes.orangeColor,
              child: Text(
                "KES $price",
                style: GoogleFonts.overpass(
                    color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGridStyle {
  double? MarginTop;
  double? MarginBottom;
  double? MarginLeft;
  double? MarginRight;
  double? MarginAll;

  CustomGridStyle(
      {this.MarginTop,
      this.MarginBottom,
      this.MarginLeft,
      this.MarginRight,
      this.MarginAll});
}
