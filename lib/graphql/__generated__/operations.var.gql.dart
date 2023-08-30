// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pamride/graphql/__generated__/schema.schema.gql.dart' as _i2;
import 'package:pamride/graphql/__generated__/serializers.gql.dart' as _i1;

part 'operations.var.gql.g.dart';

abstract class GRegisterUserVars
    implements Built<GRegisterUserVars, GRegisterUserVarsBuilder> {
  GRegisterUserVars._();

  factory GRegisterUserVars([Function(GRegisterUserVarsBuilder b) updates]) =
      _$GRegisterUserVars;

  String get firstName;
  String get lastName;
  String get password;
  String get confirmPassword;
  String get phoneNumber;
  String get nationalId;
  String get email;
  String get role;
  String get userName;
  String get town;
  String get cName;
  String get cCode;
  String get cAbbrev;
  String get deviceToken;
  static Serializer<GRegisterUserVars> get serializer =>
      _$gRegisterUserVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRegisterUserVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRegisterUserVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRegisterUserVars.serializer,
        json,
      );
}

abstract class GUserLoginVars
    implements Built<GUserLoginVars, GUserLoginVarsBuilder> {
  GUserLoginVars._();

  factory GUserLoginVars([Function(GUserLoginVarsBuilder b) updates]) =
      _$GUserLoginVars;

  String get email;
  String get password;
  static Serializer<GUserLoginVars> get serializer =>
      _$gUserLoginVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLoginVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLoginVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLoginVars.serializer,
        json,
      );
}

abstract class GUpdateLicenceDocumentsVars
    implements
        Built<GUpdateLicenceDocumentsVars, GUpdateLicenceDocumentsVarsBuilder> {
  GUpdateLicenceDocumentsVars._();

  factory GUpdateLicenceDocumentsVars(
          [Function(GUpdateLicenceDocumentsVarsBuilder b) updates]) =
      _$GUpdateLicenceDocumentsVars;

  String get email;
  String get updatedBy;
  String get licenseFront;
  String get licenseRear;
  String get nationalIdFront;
  String get nationalIdBack;
  int get id;
  static Serializer<GUpdateLicenceDocumentsVars> get serializer =>
      _$gUpdateLicenceDocumentsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateLicenceDocumentsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateLicenceDocumentsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateLicenceDocumentsVars.serializer,
        json,
      );
}

abstract class GCreateARideVars
    implements Built<GCreateARideVars, GCreateARideVarsBuilder> {
  GCreateARideVars._();

  factory GCreateARideVars([Function(GCreateARideVarsBuilder b) updates]) =
      _$GCreateARideVars;

  String get placeOfStart;
  double get estimatePrice;
  String get name;
  String get destination;
  String get departureDate;
  String get estimateTime;
  String get estimateDistance;
  int get numberOfPeople;
  int get maxCarry;
  String get carId;
  String? get backCentre;
  String? get backRight;
  String? get backLeft;
  String? get frontLeft;
  String? get middleCentre;
  String? get middleLeft;
  String? get middleRight;
  String get departureTime;
  int? get rideIndex;
  static Serializer<GCreateARideVars> get serializer =>
      _$gCreateARideVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateARideVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateARideVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateARideVars.serializer,
        json,
      );
}

abstract class GTransactionVars
    implements Built<GTransactionVars, GTransactionVarsBuilder> {
  GTransactionVars._();

  factory GTransactionVars([Function(GTransactionVarsBuilder b) updates]) =
      _$GTransactionVars;

  String get phoneNumber;
  String get amount;
  String get callBackUrl;
  static Serializer<GTransactionVars> get serializer =>
      _$gTransactionVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTransactionVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTransactionVars.serializer,
        json,
      );
}

abstract class GSaveUserFileVars
    implements Built<GSaveUserFileVars, GSaveUserFileVarsBuilder> {
  GSaveUserFileVars._();

  factory GSaveUserFileVars([Function(GSaveUserFileVarsBuilder b) updates]) =
      _$GSaveUserFileVars;

  String get fileName;
  String get fileExtension;
  _i2.GUploadType get uploadType;
  String get data;
  static Serializer<GSaveUserFileVars> get serializer =>
      _$gSaveUserFileVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSaveUserFileVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSaveUserFileVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSaveUserFileVars.serializer,
        json,
      );
}

abstract class GSaveUserFileStringVars
    implements Built<GSaveUserFileStringVars, GSaveUserFileStringVarsBuilder> {
  GSaveUserFileStringVars._();

  factory GSaveUserFileStringVars(
          [Function(GSaveUserFileStringVarsBuilder b) updates]) =
      _$GSaveUserFileStringVars;

  String get fileName;
  String get fileExtension;
  _i2.GUploadType get uploadType;
  String get data;
  static Serializer<GSaveUserFileStringVars> get serializer =>
      _$gSaveUserFileStringVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSaveUserFileStringVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSaveUserFileStringVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSaveUserFileStringVars.serializer,
        json,
      );
}

abstract class GCreateCarVars
    implements Built<GCreateCarVars, GCreateCarVarsBuilder> {
  GCreateCarVars._();

  factory GCreateCarVars([Function(GCreateCarVarsBuilder b) updates]) =
      _$GCreateCarVars;

  String get id;
  String get imageUrl;
  bool get active;
  String get color;
  String get licensePlate;
  String get model;
  String get ownerId;
  static Serializer<GCreateCarVars> get serializer =>
      _$gCreateCarVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateCarVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateCarVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateCarVars.serializer,
        json,
      );
}

abstract class GAddChatVars
    implements Built<GAddChatVars, GAddChatVarsBuilder> {
  GAddChatVars._();

  factory GAddChatVars([Function(GAddChatVarsBuilder b) updates]) =
      _$GAddChatVars;

  String get id;
  String get deviceRegToken;
  String get from;
  String get to;
  String get topic;
  String get message;
  static Serializer<GAddChatVars> get serializer => _$gAddChatVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddChatVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddChatVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddChatVars.serializer,
        json,
      );
}

abstract class GChangeUserPasswordVars
    implements Built<GChangeUserPasswordVars, GChangeUserPasswordVarsBuilder> {
  GChangeUserPasswordVars._();

  factory GChangeUserPasswordVars(
          [Function(GChangeUserPasswordVarsBuilder b) updates]) =
      _$GChangeUserPasswordVars;

  String get password;
  String get confirmPassword;
  String get phoneNumber;
  static Serializer<GChangeUserPasswordVars> get serializer =>
      _$gChangeUserPasswordVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChangeUserPasswordVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GChangeUserPasswordVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChangeUserPasswordVars.serializer,
        json,
      );
}

abstract class GSendOTPVars
    implements Built<GSendOTPVars, GSendOTPVarsBuilder> {
  GSendOTPVars._();

  factory GSendOTPVars([Function(GSendOTPVarsBuilder b) updates]) =
      _$GSendOTPVars;

  String get phone;
  String get email;
  static Serializer<GSendOTPVars> get serializer => _$gSendOTPVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSendOTPVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSendOTPVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSendOTPVars.serializer,
        json,
      );
}

abstract class GLNMStatusVars
    implements Built<GLNMStatusVars, GLNMStatusVarsBuilder> {
  GLNMStatusVars._();

  factory GLNMStatusVars([Function(GLNMStatusVarsBuilder b) updates]) =
      _$GLNMStatusVars;

  String get requestId;
  static Serializer<GLNMStatusVars> get serializer =>
      _$gLNMStatusVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLNMStatusVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLNMStatusVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLNMStatusVars.serializer,
        json,
      );
}

abstract class GTransactB2CVars
    implements Built<GTransactB2CVars, GTransactB2CVarsBuilder> {
  GTransactB2CVars._();

  factory GTransactB2CVars([Function(GTransactB2CVarsBuilder b) updates]) =
      _$GTransactB2CVars;

  String get phoneNumber;
  String get amount;
  String get callbackUrl;
  String get occasion;
  String get remarks;
  String get queueTimeoutUrl;
  int get rideId;
  String get userId;
  static Serializer<GTransactB2CVars> get serializer =>
      _$gTransactB2CVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTransactB2CVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactB2CVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTransactB2CVars.serializer,
        json,
      );
}

abstract class GUpdateUserPhoneNumberVars
    implements
        Built<GUpdateUserPhoneNumberVars, GUpdateUserPhoneNumberVarsBuilder> {
  GUpdateUserPhoneNumberVars._();

  factory GUpdateUserPhoneNumberVars(
          [Function(GUpdateUserPhoneNumberVarsBuilder b) updates]) =
      _$GUpdateUserPhoneNumberVars;

  String get email;
  String get phoneNumber;
  static Serializer<GUpdateUserPhoneNumberVars> get serializer =>
      _$gUpdateUserPhoneNumberVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserPhoneNumberVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserPhoneNumberVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserPhoneNumberVars.serializer,
        json,
      );
}

abstract class GUpdateUserDetailsVars
    implements Built<GUpdateUserDetailsVars, GUpdateUserDetailsVarsBuilder> {
  GUpdateUserDetailsVars._();

  factory GUpdateUserDetailsVars(
          [Function(GUpdateUserDetailsVarsBuilder b) updates]) =
      _$GUpdateUserDetailsVars;

  String? get firstName;
  String? get lastName;
  String? get userName;
  String get email;
  String get aboutMe;
  String get phoneNumber;
  static Serializer<GUpdateUserDetailsVars> get serializer =>
      _$gUpdateUserDetailsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserDetailsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserDetailsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserDetailsVars.serializer,
        json,
      );
}

abstract class GUpdateCarDetailsVars
    implements Built<GUpdateCarDetailsVars, GUpdateCarDetailsVarsBuilder> {
  GUpdateCarDetailsVars._();

  factory GUpdateCarDetailsVars(
          [Function(GUpdateCarDetailsVarsBuilder b) updates]) =
      _$GUpdateCarDetailsVars;

  bool get active;
  String? get color;
  String? get imageUrl;
  String? get licensePlate;
  String? get model;
  String? get ownerId;
  static Serializer<GUpdateCarDetailsVars> get serializer =>
      _$gUpdateCarDetailsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateCarDetailsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateCarDetailsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateCarDetailsVars.serializer,
        json,
      );
}

abstract class GupdateFMCTokenVars
    implements Built<GupdateFMCTokenVars, GupdateFMCTokenVarsBuilder> {
  GupdateFMCTokenVars._();

  factory GupdateFMCTokenVars(
      [Function(GupdateFMCTokenVarsBuilder b) updates]) = _$GupdateFMCTokenVars;

  String get userId;
  String get fcmToken;
  static Serializer<GupdateFMCTokenVars> get serializer =>
      _$gupdateFMCTokenVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GupdateFMCTokenVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GupdateFMCTokenVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GupdateFMCTokenVars.serializer,
        json,
      );
}

abstract class GCheckIfUserIsDriverVars
    implements
        Built<GCheckIfUserIsDriverVars, GCheckIfUserIsDriverVarsBuilder> {
  GCheckIfUserIsDriverVars._();

  factory GCheckIfUserIsDriverVars(
          [Function(GCheckIfUserIsDriverVarsBuilder b) updates]) =
      _$GCheckIfUserIsDriverVars;

  String get driverRoleId;
  String get userId;
  static Serializer<GCheckIfUserIsDriverVars> get serializer =>
      _$gCheckIfUserIsDriverVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCheckIfUserIsDriverVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCheckIfUserIsDriverVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCheckIfUserIsDriverVars.serializer,
        json,
      );
}

abstract class GGetAllRolesVars
    implements Built<GGetAllRolesVars, GGetAllRolesVarsBuilder> {
  GGetAllRolesVars._();

  factory GGetAllRolesVars([Function(GGetAllRolesVarsBuilder b) updates]) =
      _$GGetAllRolesVars;

  static Serializer<GGetAllRolesVars> get serializer =>
      _$gGetAllRolesVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllRolesVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllRolesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllRolesVars.serializer,
        json,
      );
}

abstract class GGetDriverTripsVars
    implements Built<GGetDriverTripsVars, GGetDriverTripsVarsBuilder> {
  GGetDriverTripsVars._();

  factory GGetDriverTripsVars(
      [Function(GGetDriverTripsVarsBuilder b) updates]) = _$GGetDriverTripsVars;

  String? get UserId;
  String? get status;
  static Serializer<GGetDriverTripsVars> get serializer =>
      _$gGetDriverTripsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDriverTripsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDriverTripsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDriverTripsVars.serializer,
        json,
      );
}

abstract class GGetPaidTripsVars
    implements Built<GGetPaidTripsVars, GGetPaidTripsVarsBuilder> {
  GGetPaidTripsVars._();

  factory GGetPaidTripsVars([Function(GGetPaidTripsVarsBuilder b) updates]) =
      _$GGetPaidTripsVars;

  String? get status;
  static Serializer<GGetPaidTripsVars> get serializer =>
      _$gGetPaidTripsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPaidTripsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPaidTripsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPaidTripsVars.serializer,
        json,
      );
}

abstract class GGetUserByUserNameVars
    implements Built<GGetUserByUserNameVars, GGetUserByUserNameVarsBuilder> {
  GGetUserByUserNameVars._();

  factory GGetUserByUserNameVars(
          [Function(GGetUserByUserNameVarsBuilder b) updates]) =
      _$GGetUserByUserNameVars;

  String? get userName;
  static Serializer<GGetUserByUserNameVars> get serializer =>
      _$gGetUserByUserNameVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByUserNameVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByUserNameVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByUserNameVars.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesVars
    implements
        Built<GFilterToAndFromRidesVars, GFilterToAndFromRidesVarsBuilder> {
  GFilterToAndFromRidesVars._();

  factory GFilterToAndFromRidesVars(
          [Function(GFilterToAndFromRidesVarsBuilder b) updates]) =
      _$GFilterToAndFromRidesVars;

  String? get searchText;
  static Serializer<GFilterToAndFromRidesVars> get serializer =>
      _$gFilterToAndFromRidesVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFilterToAndFromRidesVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFilterToAndFromRidesVars.serializer,
        json,
      );
}

abstract class GGetUserCarsVars
    implements Built<GGetUserCarsVars, GGetUserCarsVarsBuilder> {
  GGetUserCarsVars._();

  factory GGetUserCarsVars([Function(GGetUserCarsVarsBuilder b) updates]) =
      _$GGetUserCarsVars;

  String get email;
  static Serializer<GGetUserCarsVars> get serializer =>
      _$gGetUserCarsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserCarsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserCarsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserCarsVars.serializer,
        json,
      );
}

abstract class GGetUserWithFilterVars
    implements Built<GGetUserWithFilterVars, GGetUserWithFilterVarsBuilder> {
  GGetUserWithFilterVars._();

  factory GGetUserWithFilterVars(
          [Function(GGetUserWithFilterVarsBuilder b) updates]) =
      _$GGetUserWithFilterVars;

  String get userName;
  static Serializer<GGetUserWithFilterVars> get serializer =>
      _$gGetUserWithFilterVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterVars.serializer,
        json,
      );
}

abstract class GGetUserByIdVars
    implements Built<GGetUserByIdVars, GGetUserByIdVarsBuilder> {
  GGetUserByIdVars._();

  factory GGetUserByIdVars([Function(GGetUserByIdVarsBuilder b) updates]) =
      _$GGetUserByIdVars;

  String get id;
  static Serializer<GGetUserByIdVars> get serializer =>
      _$gGetUserByIdVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByIdVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByIdVars.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsVars
    implements
        Built<GGetOnGoingUserBookingsVars, GGetOnGoingUserBookingsVarsBuilder> {
  GGetOnGoingUserBookingsVars._();

  factory GGetOnGoingUserBookingsVars(
          [Function(GGetOnGoingUserBookingsVarsBuilder b) updates]) =
      _$GGetOnGoingUserBookingsVars;

  String get userId;
  static Serializer<GGetOnGoingUserBookingsVars> get serializer =>
      _$gGetOnGoingUserBookingsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsVars.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsVars
    implements
        Built<GGetPastUserBookingsVars, GGetPastUserBookingsVarsBuilder> {
  GGetPastUserBookingsVars._();

  factory GGetPastUserBookingsVars(
          [Function(GGetPastUserBookingsVarsBuilder b) updates]) =
      _$GGetPastUserBookingsVars;

  String get userId;
  static Serializer<GGetPastUserBookingsVars> get serializer =>
      _$gGetPastUserBookingsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsVars.serializer,
        json,
      );
}

abstract class GGetRidesVars
    implements Built<GGetRidesVars, GGetRidesVarsBuilder> {
  GGetRidesVars._();

  factory GGetRidesVars([Function(GGetRidesVarsBuilder b) updates]) =
      _$GGetRidesVars;

  int? get from;
  int? get to;
  String? get placeOfStartFilter;
  String? get destinationFilter;
  static Serializer<GGetRidesVars> get serializer => _$gGetRidesVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesVars.serializer,
        json,
      );
}

abstract class GGetLatestRidesVars
    implements Built<GGetLatestRidesVars, GGetLatestRidesVarsBuilder> {
  GGetLatestRidesVars._();

  factory GGetLatestRidesVars(
      [Function(GGetLatestRidesVarsBuilder b) updates]) = _$GGetLatestRidesVars;

  int get count;
  static Serializer<GGetLatestRidesVars> get serializer =>
      _$gGetLatestRidesVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesVars.serializer,
        json,
      );
}

abstract class GGetRideInfoVars
    implements Built<GGetRideInfoVars, GGetRideInfoVarsBuilder> {
  GGetRideInfoVars._();

  factory GGetRideInfoVars([Function(GGetRideInfoVarsBuilder b) updates]) =
      _$GGetRideInfoVars;

  int? get rideId;
  static Serializer<GGetRideInfoVars> get serializer =>
      _$gGetRideInfoVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoVars.serializer,
        json,
      );
}

abstract class GGetRideVars
    implements Built<GGetRideVars, GGetRideVarsBuilder> {
  GGetRideVars._();

  factory GGetRideVars([Function(GGetRideVarsBuilder b) updates]) =
      _$GGetRideVars;

  int? get rideId;
  static Serializer<GGetRideVars> get serializer => _$gGetRideVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideVars.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterVars
    implements Built<GGetRidesWithFilterVars, GGetRidesWithFilterVarsBuilder> {
  GGetRidesWithFilterVars._();

  factory GGetRidesWithFilterVars(
          [Function(GGetRidesWithFilterVarsBuilder b) updates]) =
      _$GGetRidesWithFilterVars;

  int? get from;
  int? get to;
  static Serializer<GGetRidesWithFilterVars> get serializer =>
      _$gGetRidesWithFilterVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterVars.serializer,
        json,
      );
}

abstract class GGetDestinationRidesVars
    implements
        Built<GGetDestinationRidesVars, GGetDestinationRidesVarsBuilder> {
  GGetDestinationRidesVars._();

  factory GGetDestinationRidesVars(
          [Function(GGetDestinationRidesVarsBuilder b) updates]) =
      _$GGetDestinationRidesVars;

  String get placeOfStart;
  String get destination;
  static Serializer<GGetDestinationRidesVars> get serializer =>
      _$gGetDestinationRidesVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesVars.serializer,
        json,
      );
}

abstract class GOnGetMessageVars
    implements Built<GOnGetMessageVars, GOnGetMessageVarsBuilder> {
  GOnGetMessageVars._();

  factory GOnGetMessageVars([Function(GOnGetMessageVarsBuilder b) updates]) =
      _$GOnGetMessageVars;

  static Serializer<GOnGetMessageVars> get serializer =>
      _$gOnGetMessageVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOnGetMessageVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOnGetMessageVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOnGetMessageVars.serializer,
        json,
      );
}
