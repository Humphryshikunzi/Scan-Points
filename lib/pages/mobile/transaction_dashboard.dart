import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/htttp_helper.dart';
import 'package:pamride/pages/mobile/ride_details_profile.dart';
import 'package:pamride/widgets/format_date_time.dart';
import 'package:pamride/widgets/horizontal_spacer.dart';
import 'package:pamride/widgets/ride_utlities.dart';
import 'package:pamride/widgets/user_utlities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/account_controller.dart';
import '../../helpers/DesignConfig.dart';
import '../../widgets/vertical_spacer.dart';

enum TransactionType { send, request }

class Transation {
  String rideId;
  String dateTime;
  double amount;
  String status;
  TransactionType transactionType;

  Transation(
      {required this.rideId,
      required this.dateTime,
      required this.amount,
      required this.status,
      required this.transactionType});
}

class TransactionDashboard extends StatefulWidget {
  TransactionDashboard({Key? key}) : super(key: key);

  @override
  State<TransactionDashboard> createState() => _TransactionDashboardState();
}

class _TransactionDashboardState extends State<TransactionDashboard> {
  /// variable to store the transactions in a list
  List<Transation> transactions = [];
  final AccountController _accountController = Get.find<AccountController>();

  String username = "";
  String userID = "";
  dynamic myRides;

  /// function to get the user name and ID
  void getUsername_ID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? usernamePrefs = sharedPreferences.getString("username");
    String? userIDPrefs = sharedPreferences.getString("accountId");
    setState(() {
      username = usernamePrefs.toString();
      userID = userIDPrefs.toString();
    });
  }

  /// function to format the currency
  String formatCurrency(double amount) {
    final NumberFormat numberFormat = NumberFormat("#,###,#00.00", "en_US");
    return numberFormat.format(amount);
  }

  double totalPay = 0.0;

  @override
  void initState() {
    getMyMoneyRides();
    getUsername_ID();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getMyMoneyRides() async {
    /// The graphql query for fetching the unpiad trips
    String userId = _accountController.accountId.toString();
    String currentDate = dartDateToCSharpDate(DateTime.now());

    String getMyMoney = '''
  query GetCompletedTrips() {
    rides(
      where: { 
        car: {ownerId: {eq: "$userId"}}
        arrivalTime: {lt: "$currentDate"}
      }
      order: {arrivalTime:DESC}
    ) {
      id
      name
      departureDate
      destination
      estimatedDistance
      numberOfPeople
      maximumCarryWeight
      placeofStart 
      duration
      totalPay
      compensatedFromPassengerCancel
      status
      car {
        licensePlate
        ownerId
        owner{
					profilePictureDataUrl
				}
      }
    }
  }
  ''';

    // Create a GraphQL client
    final GraphQLClient client =
        GraphQLClient(link: await getLinkAndToken(), cache: GraphQLCache());

    // Create the GraphQL query options
    final QueryOptions options = QueryOptions(document: gql(getMyMoney));

    // Send the GraphQL query
    final QueryResult result = await client.query(options);

    // Check for errors
    if (result.hasException) {
      return;
    }

    // Extract the desired information from the response
    final List<dynamic> rides = result.data?['rides'] as List<dynamic>;
    final List<dynamic> ridesFiltered = [];

    double rideTotalPay;
    String status = "";

    /// calculate the total pay
    for (int x = 0; x < rides.length; x++) {
      rideTotalPay = double.parse(rides[x]["totalPay"].toString());
      status = rides[x]["status"].toString();

      if (rideTotalPay > 0 && status != RideStatus.Paid) {
        totalPay += rideTotalPay;
        ridesFiltered.add(rides[x]);
      }
    }
    ;

    setState(() {
      myRides = ridesFiltered;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (myRides == null) {
      return Center(child: CircularProgressIndicator());
    }
    ;

    final rides = myRides;

    return Scaffold(
        extendBody: true,
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 262,
                    width: 375,
                    decoration:
                        BoxDecoration(color: ColorsRes.gradientOneColor),
                  ),
                  CustomPaint(
                    size: Size(375, 262),
                    painter: DrawTriangleShape(),
                  ),
                  Positioned(
                    top: 48,
                    width: 375,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                          Text(
                            "Payouts Dashboard",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Hi, " + username,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 152,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Pending Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    width: 375,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "KES " + formatCurrency(totalPay),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pending Payouts",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 400,
                  margin: EdgeInsets.only(left: 5, right: 10),
                  child: rides.length > 0
                      ?

                      /// build the transactions
                      ListView.builder(
                          itemCount: rides.length,
                          itemBuilder: (context, index) {
                            final ride = rides[index];

                            /// get the date and time and format it
                            final dateTime =
                                DateTime.parse(ride['departureDate']).toLocal();
                            final formattedDate =
                                DateFormat.yMd().add_jm().format(dateTime);

                            final rideId = ride["id"].toString();
                            final status = ride["status"].toString();
                            double rideTotalPay =
                                double.parse(ride["totalPay"].toString());

                            /// store the transactions in a transaction list
                            transactions = [
                              Transation(
                                  rideId: rideId,
                                  status: status,
                                  dateTime: formattedDate,
                                  amount: rideTotalPay,
                                  transactionType: TransactionType.request)
                            ];

                            return SizedBox(
                                height: 60,
                                child: GestureDetector(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      HorizontalSpacer(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Ride ID # " +
                                                transactions.first.rideId,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: const Color(0xFF1A1A1A),
                                            ),
                                          ),
                                          const VerticalSpacer(height: 1),
                                          Text(
                                            transactions.first.dateTime,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: const Color(0xFF1A1A1A)
                                                  .withOpacity(0.4),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        transactions.first.transactionType ==
                                                TransactionType.send
                                            ? "KES ${formatCurrency(transactions.first.amount)}"
                                            : "KES ${formatCurrency(transactions.first.amount)}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      transactions.first.status ==
                                              RideStatus.Active
                                          ? InkWell(
                                              onTap: () {
                                                HttpHelper()
                                                    .driverInitiateRideWithdrawal(
                                                        driverId:
                                                            _accountController
                                                                .accountId
                                                                .toString(),
                                                        rideId: ride['id']
                                                            .toString());
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          TransactionDashboard()),
                                                );
                                              },
                                              child: Center(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10,
                                                    top: 3,
                                                  ),
                                                  padding: EdgeInsets.all(2.0),
                                                  height: 40.0,
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.21,
                                                  decoration: DesignConfig
                                                      .buttonShadowColor(
                                                          ColorsRes.green,
                                                          10,
                                                          Colors.green),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Request\nPayout',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Colors.white),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: 75,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 3,
                                                  bottom: 3),
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        offset: Offset(0, 2),
                                                        blurRadius: 4,
                                                        spreadRadius: 1)
                                                  ]),
                                              child: Text(
                                                "Pending \nPayment",
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 13),
                                              ),
                                            ),
                                    ],
                                  ),
                                  onTap: () {
                                    Get.off(RideDetailProfile(
                                      rideId: rideId,
                                      isDriver: true,
                                      isPast: true,
                                    ));
                                  },
                                ));
                          },
                        )
                      : Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "You do not have pending transactions",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade400),
                                ),
                                Icon(
                                  Icons.currency_exchange,
                                  color: Colors.grey.shade400,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                        ))
            ],
          ),
        ));
  }
}

class DrawTriangleShape extends CustomPainter {
  Paint painter = Paint()
    ..color = ColorsRes.gradientTwoColor
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
