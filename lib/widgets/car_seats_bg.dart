import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/constant.dart';
import '../controllers/account_controller.dart';
import '../graphql/__generated__/operations.data.gql.dart'; 

class CarSeatsBirdView extends StatelessWidget {
  final GGetRidesData_rides ride;
  const CarSeatsBirdView({Key? key, required this.ride}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountController _accountController = Get.find<AccountController>();
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: kCardGradient),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 600,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              'Available Car Seats',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: SizedBox(
                              width: 350,
                              height: 650,
                              child: Stack(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 650,
                                      child: Image.asset(
                                        'assets/images/bird_view_tesla.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 240,
                                    right: 95,
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Text(
                                        'Driver',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: ride.seat?.frontLeft == '',
                                    child: Positioned(
                                        top: 220,
                                        left: 95,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CustomRipple())),
                                  ),
                                  Visibility(
                                    visible: ride.seat?.middleRight == '',
                                    child: Positioned(
                                        top: 315,
                                        right: 95,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CustomRipple())),
                                  ),
                                  Visibility(
                                    visible: ride.seat?.middleLeft == '',
                                    child: Positioned(
                                        top: 315,
                                        left: 95,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CustomRipple())),
                                  ),
                                  Visibility(
                                    visible: ride.seat?.backRight == '',
                                    child: Positioned(
                                        bottom: 200,
                                        right: 95,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CustomRipple())),
                                  ),
                                  Visibility(
                                    visible: ride.seat?.backLeft == '',
                                    child: Positioned(
                                        bottom: 200,
                                        left: 95,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CustomRipple())),
                                  ),
                                  Visibility(
                                    visible: ride.seat?.backCentre == '',
                                    child: Positioned(
                                        bottom: 200,
                                        left: 0,
                                        right: 0,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CustomRipple())),
                                  ),
                                  Visibility(
                                    visible: ride.seat?.middleCentre == '',
                                    child: Positioned(
                                        top: 315,
                                        left: 0,
                                        right: 0,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CustomRipple())),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Sensor extends StatelessWidget {
  const Sensor({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  final double value;
  final double heigth = 120.0;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 50,
              height: heigth,
              color: kProgressBackGroundColor.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: heigth * value,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            colors: buttonGradient.colors)),
                  )
                ],
              ),
            )),
        SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}

class CustomRipple extends StatefulWidget {
  CustomRipple({Key? key}) : super(key: key);

  @override
  _CustomRippleState createState() => _CustomRippleState();
}

class _CustomRippleState extends State<CustomRipple>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation = Tween<double>(begin: 0.4, end: 0.8).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor, width: 8),
            shape: BoxShape.circle),
      ),
    );
  }
}
