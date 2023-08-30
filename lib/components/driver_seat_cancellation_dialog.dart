// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DriverSeatCancellation extends StatelessWidget {
//   const DriverSeatCancellation({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 20),
//             Stack(
//               children: [
//                 Positioned.fill(
//                   child: RotatedBox(
//                     quarterTurns: 2,
//                     child: Image.asset('assets/images/car_top.png'),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(30.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           /// back left seat
//                           GestureDetector(
//                             onTap: () {
//                               if (_backLeft == 'NA') {
//                                 Get.snackbar('Information', 'The seat is not available for booking',
//                                     colorText: Colors.white,
//                                     backgroundColor: Colors.brown,
//                                     snackPosition: SnackPosition.TOP);
//                               } else {
//                                 print("Available for booking");
//                                 setState(() {
//                                   if (_backLeft != null) {
//                                     _backLeft = null;
//                                   } else {
//                                     _backLeft = '';
//                                   }
//                                 });
//                               }
//                             },
//                             child: Container(
//                               height: 60,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color:
//                                     _backLeft == null ? Colors.grey.withOpacity(0.5) : Colors.green,
//                                 borderRadius:
//                                     BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(Icons.airline_seat_recline_extra_outlined,
//                                         color: Colors.white),
//                                   ),
//                                   Text(
//                                     'Back Left',
//                                     style: TextStyle(fontSize: 11, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.0,
//                           ),
//
//                           /// back center seat
//                           GestureDetector(
//                             onTap: () {
//                               if (_BackCentre == 'NA') {
//                                 Get.snackbar('Information', 'The seat is not available for booking',
//                                     colorText: Colors.white,
//                                     backgroundColor: Colors.brown,
//                                     snackPosition: SnackPosition.TOP);
//                               } else {
//                                 setState(() {
//                                   if (_BackCentre != null) {
//                                     _BackCentre = null;
//                                   } else {
//                                     _BackCentre = '';
//                                   }
//                                 });
//                               }
//                             },
//                             child: Container(
//                               height: 60,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: _BackCentre == null
//                                     ? Colors.grey.withOpacity(0.5)
//                                     : Colors.green,
//                                 borderRadius:
//                                     BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(Icons.airline_seat_recline_extra_outlined,
//                                         color: Colors.white),
//                                   ),
//                                   Text(
//                                     'Back Center',
//                                     style: TextStyle(fontSize: 11, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.0,
//                           ),
//
//                           /// back right seat
//                           GestureDetector(
//                             onTap: () {
//                               if (_backRight == 'NA') {
//                                 Get.snackbar('Information', 'The seat is not available for booking',
//                                     colorText: Colors.white,
//                                     backgroundColor: Colors.brown,
//                                     snackPosition: SnackPosition.TOP);
//                               } else {
//                                 setState(() {
//                                   if (_backRight != null) {
//                                     _backRight = null;
//                                   } else {
//                                     _backRight = '';
//                                   }
//                                 });
//                               }
//                             },
//                             child: Container(
//                               height: 60,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: _backRight == null
//                                     ? Colors.grey.withOpacity(0.5)
//                                     : Colors.green,
//                                 borderRadius:
//                                     BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(Icons.airline_seat_recline_extra_outlined,
//                                         color: Colors.white),
//                                   ),
//                                   Text(
//                                     'Back Right',
//                                     style: TextStyle(fontSize: 11, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Visibility(
//                         visible: _selected_car == '7 Seater',
//                         child: Column(
//                           /// middle left seat
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 if (_middleLeft == 'NA') {
//                                   Get.snackbar(
//                                       'Information', 'The seat is not available for booking',
//                                       colorText: Colors.white,
//                                       backgroundColor: Colors.brown,
//                                       snackPosition: SnackPosition.TOP);
//                                 } else {
//                                   setState(() {
//                                     if (_middleLeft != null) {
//                                       _middleLeft = null;
//                                     } else {
//                                       _middleLeft = '';
//                                     }
//                                   });
//                                 }
//                               },
//                               child: Container(
//                                 height: 60,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: _middleLeft == null
//                                       ? Colors.grey.withOpacity(0.5)
//                                       : Colors.green,
//                                   borderRadius: BorderRadius.circular(
//                                       MediaQuery.of(context).size.width * 0.02),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Icon(Icons.airline_seat_recline_extra_outlined,
//                                           color: Colors.white),
//                                     ),
//                                     Text(
//                                       'Middle Left',
//                                       style: TextStyle(fontSize: 11, color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 5.0,
//                             ),
//
//                             /// middle center seat
//                             GestureDetector(
//                               onTap: () {
//                                 if (_MiddleCentre == 'NA') {
//                                   Get.snackbar(
//                                       'Information', 'The seat is not available for booking',
//                                       colorText: Colors.white,
//                                       backgroundColor: Colors.brown,
//                                       snackPosition: SnackPosition.TOP);
//                                 } else {
//                                   setState(() {
//                                     if (_MiddleCentre != null) {
//                                       _MiddleCentre = null;
//                                     } else {
//                                       _MiddleCentre = '';
//                                     }
//                                   });
//                                 }
//                               },
//                               child: Container(
//                                 height: 60,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: _MiddleCentre == null
//                                       ? Colors.grey.withOpacity(0.5)
//                                       : Colors.green,
//                                   borderRadius: BorderRadius.circular(
//                                       MediaQuery.of(context).size.width * 0.02),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Icon(Icons.airline_seat_recline_extra_outlined,
//                                           color: Colors.white),
//                                     ),
//                                     Text(
//                                       'Middle Center',
//                                       style: TextStyle(fontSize: 11, color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 5.0,
//                             ),
//
//                             /// middle right seat
//                             GestureDetector(
//                               onTap: () {
//                                 if (_middleRight == 'NA') {
//                                   Get.snackbar(
//                                       'Information', 'The seat is not available for booking',
//                                       colorText: Colors.white,
//                                       backgroundColor: Colors.brown,
//                                       snackPosition: SnackPosition.TOP);
//                                 } else {
//                                   setState(() {
//                                     if (_middleRight != null) {
//                                       _middleRight = null;
//                                     } else {
//                                       _middleRight = '';
//                                     }
//                                   });
//                                 }
//                               },
//                               child: Container(
//                                 height: 60,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: _middleRight == null
//                                       ? Colors.grey.withOpacity(0.5)
//                                       : Colors.green,
//                                   borderRadius: BorderRadius.circular(
//                                       MediaQuery.of(context).size.width * 0.02),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Icon(Icons.airline_seat_recline_extra_outlined,
//                                           color: Colors.white),
//                                     ),
//                                     Text(
//                                       'Middle Right',
//                                       style: TextStyle(fontSize: 11, color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           /// front left seat
//                           GestureDetector(
//                             onTap: () {
//                               if (_frontLeft == 'NA') {
//                                 Get.snackbar('Information', 'The seat is not available for booking',
//                                     colorText: Colors.white,
//                                     backgroundColor: Colors.brown,
//                                     snackPosition: SnackPosition.TOP);
//                               } else {
//                                 setState(() {
//                                   if (_frontLeft != null) {
//                                     _frontLeft = null;
//                                   } else {
//                                     _frontLeft = '';
//                                   }
//                                 });
//                               }
//                             },
//                             child: Container(
//                               height: 70,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: _frontLeft == null
//                                     ? Colors.grey.withOpacity(0.5)
//                                     : Colors.green,
//                                 borderRadius:
//                                     BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(Icons.airline_seat_recline_extra_outlined,
//                                         color: Colors.white),
//                                   ),
//                                   Text(
//                                     'Front',
//                                     style: TextStyle(fontSize: 11, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 50.0,
//                           ),
//
//                           /// driver seat
//                           Container(
//                             height: 70,
//                             width: 80,
//                             decoration: BoxDecoration(
//                               color: Colors.orange.withOpacity(0.7),
//                               borderRadius:
//                                   BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   RotatedBox(
//                                     quarterTurns: 1,
//                                     child: SvgPicture.asset(
//                                       "assets/images/steering-wheel.svg",
//                                       width: MediaQuery.of(context).size.width * 0.3,
//                                       height: 35,
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     'Driver',
//                                     style: TextStyle(fontSize: 11, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
