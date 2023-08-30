import 'package:pamride/helpers/Constant.dart';

String getCarImageUrl(String carImage) {
  // for some reasons some url are full while others are just image names
  String carImageUrl =
      carImage.startsWith("http") ? carImage : Constant.carImageUrl + carImage;
  return carImageUrl;
}

String getProfileImageUrl(String profileImage) {
  return Constant.profileImageUrl + profileImage;
}
