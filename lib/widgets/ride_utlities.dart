import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

int customDuration(String input) {
  int duration = input.length * 2 + 5;
  return duration;
}

void downloadPassengerReceipt({
  String? passengerName,
  String? rideId,
  String? seatName,
  String? pickupLocation,
  String? destination,
  String? startDateTime,
  String? driverName,
  String? distance,
  String? plateNo,
  String? duration,
  String? amount,
  String? travelTime,
  String? paymentMethod,
  required double width,
}) async {
  final pdf = pw.Document();
  final ByteData bytes = await rootBundle.load('assets/images/logo.png');
  final Uint8List logoByteList = bytes.buffer.asUint8List();

  int seatPosition = SeatMap[seatName]!;
  final String receiptNumber = "$rideId-$seatPosition";

  // Add receipt content
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo
            pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Column(children: [
                  pw.Image(pw.MemoryImage(logoByteList),
                      fit: pw.BoxFit.fitHeight, width: 100, height: 100),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'https://pamride.com, +254 703114341',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ]),
                  pw.SizedBox(height: 5),
                  pw.Divider(),
                  pw.SizedBox(height: 5),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text('Passenger Travel Receipt: ',
                            style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(
                          width: 20,
                        ),
                        pw.Text('Receipt No: $receiptNumber',
                            style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            )),
                      ])
                ])),

            pw.Divider(),
            pw.Row(
              children: [
                pw.SizedBox(
                  width: width,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.SizedBox(height: 5),
                      pw.RichText(
                        text: pw.TextSpan(children: <pw.TextSpan>[
                          pw.TextSpan(
                              text: "Passenger Name: ",
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15)),
                        ]),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(children: <pw.TextSpan>[
                          pw.TextSpan(
                              text: "Ride ID: ",
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15)),
                        ]),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Seat: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Pickup Location: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Destination: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Travel Date: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Travel Start Time: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Distance: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Car Plate No: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Duration: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Amount: Ksh ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Payment Method: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Driver Name: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Print Date: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 5.0),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 5),
                    pw.RichText(
                      text: pw.TextSpan(children: <pw.TextSpan>[
                        pw.TextSpan(
                          text: passengerName,
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        )
                      ]),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(children: <pw.TextSpan>[
                        pw.TextSpan(
                          text: rideId,
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        )
                      ]),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: "$seatPosition, $seatName",
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: pickupLocation,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: destination,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: startDateTime,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: travelTime,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: distance,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: plateNo,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: duration,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: amount,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: paymentMethod,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: driverName,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: DateTime.now().toString().substring(0, 16),
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // ...
            pw.Divider(),

            pw.SizedBox(height: 5),

            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Text(
                'Thank you for using our service!',
                style: pw.TextStyle(
                  fontSize: 15,
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    ),
  );

  // Save the PDF to a file
  final output = await getTemporaryDirectory();
  final filePath = '${output.path}/$receiptNumber.pdf';
  final file = File(filePath);
  await file.writeAsBytes(await pdf.save());

  // Open the downloaded file
  OpenFile.open(filePath);
}

void downloadDriverReceipt(
    {String? driverName,
    String? rideId,
    String? pickupLocation,
    String? destination,
    String? distance,
    String? plateNo,
    String? duration,
    String? amount,
    String? travelTime,
    String? paymentMethod,
    required double width}) async {
  final pdf = pw.Document();
  final ByteData bytes = await rootBundle.load('assets/images/logo.png');
  final Uint8List logoByteList = bytes.buffer.asUint8List();
  final String receiptNumber = "$rideId-0";

  // Add receipt content
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo
            pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Column(children: [
                  pw.Image(pw.MemoryImage(logoByteList),
                      fit: pw.BoxFit.fitHeight, width: 100, height: 100),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'https://pamride.com, +254 703114341',
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ]),
                  pw.SizedBox(height: 5),
                  pw.Divider(),
                  pw.SizedBox(height: 5),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text('Driver Travel Receipt: ',
                            style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(
                          width: 20,
                        ),
                        pw.Text('Receipt No: $receiptNumber',
                            style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            )),
                      ])
                ])),

            pw.Divider(),

            pw.Row(
              children: [
                pw.SizedBox(
                  width: width,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.RichText(
                        text: pw.TextSpan(children: <pw.TextSpan>[
                          pw.TextSpan(
                              text: "Driver Name: ",
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15)),
                        ]),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(children: <pw.TextSpan>[
                          pw.TextSpan(
                              text: "Ride ID: ",
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15)),
                        ]),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Pickup Location: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Destination: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Travel Date & Time: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Distance: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Car Plate No: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Duration: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Amount: Ksh ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Payment Method: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: <pw.TextSpan>[
                            pw.TextSpan(
                              text: 'Print Date: ',
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 5.0),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(children: <pw.TextSpan>[
                        pw.TextSpan(
                          text: driverName,
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        )
                      ]),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(children: <pw.TextSpan>[
                        pw.TextSpan(
                          text: rideId,
                          style: pw.TextStyle(
                            fontSize: 15,
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        )
                      ]),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: pickupLocation,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: destination,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: travelTime,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: distance,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: plateNo,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: duration,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: amount,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: paymentMethod,
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: <pw.TextSpan>[
                          pw.TextSpan(
                            text: DateTime.now().toString().substring(0, 16),
                            style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            pw.SizedBox(height: 5),
            // ...
            pw.Divider(),

            pw.SizedBox(height: 5),

            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Text(
                'Thank you for using our service!',
                style: pw.TextStyle(
                  fontSize: 15,
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    ),
  );

  // Save the PDF to a file
  final output = await getTemporaryDirectory();
  final filePath = '${output.path}/$receiptNumber.pdf';
  final file = File(filePath);
  await file.writeAsBytes(await pdf.save());

  // Open the downloaded file
  OpenFile.open(filePath);
}

class RideStatus {
  static const String Active = 'Active';
  static const String PendingPayment = 'PendingPayment';
  static const String Completed = 'Completed';
  static const String Cancelled = 'Cancelled';
  static const String Suspended = 'Suspended';
  static const String NoShow = 'NoShow';
  static const String Delayed = 'Delayed';
  static const String Arrived = 'Arrived';
  static const String InProgress = 'InProgress';
  static const String Draft = 'Draft';
  static const String Approved = 'Approved';
  static const String Rejected = 'Rejected';
  static const String Paid = 'Paid';
}

Map<String, int> SeatMap = {
  'FrontLeft': 1,
  'MiddleLeft': 2,
  'MiddleCentre': 3,
  'MiddleRight': 4,
  'BackLeft': 5,
  'BackCentre': 6,
  'BackRight': 7,
};
