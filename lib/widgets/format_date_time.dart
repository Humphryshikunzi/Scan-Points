import 'package:intl/intl.dart';

/// function to format the date of the trip
String formatDate(String day, String month, String year, String date) {
  String date_2 = "";

  if (day.length == 1) {
    day = "0" + day;
  }
  if (month.length == 1) {
    month = "0" + month;
  }

  date_2 = day + "-" + month + "-" + year;
  return date_2;
}

/// function to format the time of the trip
String formatTime(String hour, String minute, String time) {
  String time_2 = "";

  /// add a zero at the front of both hour and minute if they are one digit
  if (hour.length == 1) {
    hour = "0" + hour;
  }
  if (minute.length == 1) {
    minute = "0" + minute;
  }

  /// determine if the time choosen is either AM or PM
  if (int.parse(hour) < 12) {
    time_2 = hour + ':' + minute + ' AM';
  } else {
    time_2 = hour + ':' + minute + ' PM';
  }
  return time_2;
} 

String getFormatedDateTime(DateTime dateTimeInput) {  
  String transactionDate = DateFormat.yMMMd().format(dateTimeInput) +
      " " +
      DateFormat('hh:mm a').format(dateTimeInput);
  return transactionDate;
}

DateTime convertGDateTimeToDateTime(String gDateTimeString) {
  String trimmedString = '';
  trimmedString = gDateTimeString.substring(20, gDateTimeString.length - 3);
  DateTime dateTimeInput = DateTime.parse(trimmedString).toLocal();
  return dateTimeInput;
}

int getDurationInMinutes(String input) {
  List<String> parts = input.split(' ');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[2]);
  int totalMinutes = hours * 60 + minutes;
  return totalMinutes;
}

DateTime getDartDateFromCSharpDate(String cSharpDate) {
  cSharpDate =
      cSharpDate.replaceFirstMapped(RegExp(r"(\d{2}):(\d{2})$"), (match) {
    return "${match.group(1)}${match.group(2)}";
  });
  DateTime dateTime = DateTime.parse(cSharpDate).toLocal();

  // Output sample: 2023-06-09 17:50:39.998 +03:00

  return dateTime;
}

String dartDateToCSharpDate(DateTime dartDate) {
  // Format the datetime in the desired output format
  String outputDatetimeString =
      DateFormat('yyyy-MM-dd\'T\'HH:mm:00\'Z\'').format(dartDate);

  return outputDatetimeString;
}

String convertDurationToTime(String durationString) {
  if (!durationString.startsWith("PT")) {
    throw FormatException("Invalid duration format");
  }

  String hoursString = durationString.substring(2, durationString.indexOf("H"));
  int hours = int.parse(hoursString);

  int minutes = 0;
  if (durationString.contains("M")) {
    String minutesString = durationString.substring(
        durationString.indexOf("H") + 1, durationString.indexOf("M"));
    minutes = int.parse(minutesString);
  }

  DateTime time = DateTime(DateTime.now().year, 1, 1, hours, minutes);
  String formattedTime = DateFormat.jm().format(time);

  return formattedTime;
}
