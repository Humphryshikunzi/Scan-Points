// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pamride/graphql/__generated__/schema.schema.gql.dart' as _i2;
import 'package:pamride/graphql/__generated__/serializers.gql.dart' as _i1;

part 'operations.data.gql.g.dart';

abstract class GRegisterUserData
    implements Built<GRegisterUserData, GRegisterUserDataBuilder> {
  GRegisterUserData._();

  factory GRegisterUserData([Function(GRegisterUserDataBuilder b) updates]) =
      _$GRegisterUserData;

  static void _initializeBuilder(GRegisterUserDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GRegisterUserData_registerUser get registerUser;
  static Serializer<GRegisterUserData> get serializer =>
      _$gRegisterUserDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRegisterUserData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRegisterUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRegisterUserData.serializer,
        json,
      );
}

abstract class GRegisterUserData_registerUser
    implements
        Built<GRegisterUserData_registerUser,
            GRegisterUserData_registerUserBuilder> {
  GRegisterUserData_registerUser._();

  factory GRegisterUserData_registerUser(
          [Function(GRegisterUserData_registerUserBuilder b) updates]) =
      _$GRegisterUserData_registerUser;

  static void _initializeBuilder(GRegisterUserData_registerUserBuilder b) =>
      b..G__typename = 'AppResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String> get messages;
  bool get succeeded;
  static Serializer<GRegisterUserData_registerUser> get serializer =>
      _$gRegisterUserDataRegisterUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRegisterUserData_registerUser.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRegisterUserData_registerUser? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRegisterUserData_registerUser.serializer,
        json,
      );
}

abstract class GUserLoginData
    implements Built<GUserLoginData, GUserLoginDataBuilder> {
  GUserLoginData._();

  factory GUserLoginData([Function(GUserLoginDataBuilder b) updates]) =
      _$GUserLoginData;

  static void _initializeBuilder(GUserLoginDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserLoginData_login get login;
  static Serializer<GUserLoginData> get serializer =>
      _$gUserLoginDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLoginData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLoginData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLoginData.serializer,
        json,
      );
}

abstract class GUserLoginData_login
    implements Built<GUserLoginData_login, GUserLoginData_loginBuilder> {
  GUserLoginData_login._();

  factory GUserLoginData_login(
          [Function(GUserLoginData_loginBuilder b) updates]) =
      _$GUserLoginData_login;

  static void _initializeBuilder(GUserLoginData_loginBuilder b) =>
      b..G__typename = 'AppResultOfTokenResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get succeeded;
  GUserLoginData_login_data get data;
  BuiltList<String> get messages;
  static Serializer<GUserLoginData_login> get serializer =>
      _$gUserLoginDataLoginSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLoginData_login.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLoginData_login? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLoginData_login.serializer,
        json,
      );
}

abstract class GUserLoginData_login_data
    implements
        Built<GUserLoginData_login_data, GUserLoginData_login_dataBuilder> {
  GUserLoginData_login_data._();

  factory GUserLoginData_login_data(
          [Function(GUserLoginData_login_dataBuilder b) updates]) =
      _$GUserLoginData_login_data;

  static void _initializeBuilder(GUserLoginData_login_dataBuilder b) =>
      b..G__typename = 'TokenResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i2.GDateTime? get refreshTokenExpiryTime;
  String get token;
  String get userName;
  String get userImageURL;
  static Serializer<GUserLoginData_login_data> get serializer =>
      _$gUserLoginDataLoginDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLoginData_login_data.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLoginData_login_data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLoginData_login_data.serializer,
        json,
      );
}

abstract class GUpdateLicenceDocumentsData
    implements
        Built<GUpdateLicenceDocumentsData, GUpdateLicenceDocumentsDataBuilder> {
  GUpdateLicenceDocumentsData._();

  factory GUpdateLicenceDocumentsData(
          [Function(GUpdateLicenceDocumentsDataBuilder b) updates]) =
      _$GUpdateLicenceDocumentsData;

  static void _initializeBuilder(GUpdateLicenceDocumentsDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateLicenceDocumentsData_updateUserDocuments get updateUserDocuments;
  static Serializer<GUpdateLicenceDocumentsData> get serializer =>
      _$gUpdateLicenceDocumentsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateLicenceDocumentsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateLicenceDocumentsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateLicenceDocumentsData.serializer,
        json,
      );
}

abstract class GUpdateLicenceDocumentsData_updateUserDocuments
    implements
        Built<GUpdateLicenceDocumentsData_updateUserDocuments,
            GUpdateLicenceDocumentsData_updateUserDocumentsBuilder> {
  GUpdateLicenceDocumentsData_updateUserDocuments._();

  factory GUpdateLicenceDocumentsData_updateUserDocuments(
      [Function(GUpdateLicenceDocumentsData_updateUserDocumentsBuilder b)
          updates]) = _$GUpdateLicenceDocumentsData_updateUserDocuments;

  static void _initializeBuilder(
          GUpdateLicenceDocumentsData_updateUserDocumentsBuilder b) =>
      b..G__typename = 'AppResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get succeeded;
  BuiltList<String> get messages;
  static Serializer<GUpdateLicenceDocumentsData_updateUserDocuments>
      get serializer =>
          _$gUpdateLicenceDocumentsDataUpdateUserDocumentsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateLicenceDocumentsData_updateUserDocuments.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateLicenceDocumentsData_updateUserDocuments? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateLicenceDocumentsData_updateUserDocuments.serializer,
        json,
      );
}

abstract class GCreateARideData
    implements Built<GCreateARideData, GCreateARideDataBuilder> {
  GCreateARideData._();

  factory GCreateARideData([Function(GCreateARideDataBuilder b) updates]) =
      _$GCreateARideData;

  static void _initializeBuilder(GCreateARideDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateARideData_createARide get createARide;
  static Serializer<GCreateARideData> get serializer =>
      _$gCreateARideDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateARideData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateARideData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateARideData.serializer,
        json,
      );
}

abstract class GCreateARideData_createARide
    implements
        Built<GCreateARideData_createARide,
            GCreateARideData_createARideBuilder> {
  GCreateARideData_createARide._();

  factory GCreateARideData_createARide(
          [Function(GCreateARideData_createARideBuilder b) updates]) =
      _$GCreateARideData_createARide;

  static void _initializeBuilder(GCreateARideData_createARideBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get destination;
  String? get placeofStart;
  String? get status;
  String? get name;
  int? get routeIndex;
  BuiltList<GCreateARideData_createARide_users>? get users;
  static Serializer<GCreateARideData_createARide> get serializer =>
      _$gCreateARideDataCreateARideSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateARideData_createARide.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateARideData_createARide? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateARideData_createARide.serializer,
        json,
      );
}

abstract class GCreateARideData_createARide_users
    implements
        Built<GCreateARideData_createARide_users,
            GCreateARideData_createARide_usersBuilder> {
  GCreateARideData_createARide_users._();

  factory GCreateARideData_createARide_users(
          [Function(GCreateARideData_createARide_usersBuilder b) updates]) =
      _$GCreateARideData_createARide_users;

  static void _initializeBuilder(GCreateARideData_createARide_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get userId;
  static Serializer<GCreateARideData_createARide_users> get serializer =>
      _$gCreateARideDataCreateARideUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateARideData_createARide_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateARideData_createARide_users? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateARideData_createARide_users.serializer,
        json,
      );
}

abstract class GTransactionData
    implements Built<GTransactionData, GTransactionDataBuilder> {
  GTransactionData._();

  factory GTransactionData([Function(GTransactionDataBuilder b) updates]) =
      _$GTransactionData;

  static void _initializeBuilder(GTransactionDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTransactionData_transact get transact;
  static Serializer<GTransactionData> get serializer =>
      _$gTransactionDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTransactionData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactionData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTransactionData.serializer,
        json,
      );
}

abstract class GTransactionData_transact
    implements
        Built<GTransactionData_transact, GTransactionData_transactBuilder> {
  GTransactionData_transact._();

  factory GTransactionData_transact(
          [Function(GTransactionData_transactBuilder b) updates]) =
      _$GTransactionData_transact;

  static void _initializeBuilder(GTransactionData_transactBuilder b) =>
      b..G__typename = 'LipaNaMpesaResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get responseCode;
  String? get checkoutRequestID;
  String? get merchantRequestID;
  String? get responseDescription;
  static Serializer<GTransactionData_transact> get serializer =>
      _$gTransactionDataTransactSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTransactionData_transact.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactionData_transact? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTransactionData_transact.serializer,
        json,
      );
}

abstract class GSaveUserFileData
    implements Built<GSaveUserFileData, GSaveUserFileDataBuilder> {
  GSaveUserFileData._();

  factory GSaveUserFileData([Function(GSaveUserFileDataBuilder b) updates]) =
      _$GSaveUserFileData;

  static void _initializeBuilder(GSaveUserFileDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get saveFlUploadeFile;
  static Serializer<GSaveUserFileData> get serializer =>
      _$gSaveUserFileDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSaveUserFileData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSaveUserFileData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSaveUserFileData.serializer,
        json,
      );
}

abstract class GSaveUserFileStringData
    implements Built<GSaveUserFileStringData, GSaveUserFileStringDataBuilder> {
  GSaveUserFileStringData._();

  factory GSaveUserFileStringData(
          [Function(GSaveUserFileStringDataBuilder b) updates]) =
      _$GSaveUserFileStringData;

  static void _initializeBuilder(GSaveUserFileStringDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get saveFlUploadeFile;
  static Serializer<GSaveUserFileStringData> get serializer =>
      _$gSaveUserFileStringDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSaveUserFileStringData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSaveUserFileStringData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSaveUserFileStringData.serializer,
        json,
      );
}

abstract class GCreateCarData
    implements Built<GCreateCarData, GCreateCarDataBuilder> {
  GCreateCarData._();

  factory GCreateCarData([Function(GCreateCarDataBuilder b) updates]) =
      _$GCreateCarData;

  static void _initializeBuilder(GCreateCarDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateCarData_createCar get createCar;
  static Serializer<GCreateCarData> get serializer =>
      _$gCreateCarDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateCarData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateCarData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateCarData.serializer,
        json,
      );
}

abstract class GCreateCarData_createCar
    implements
        Built<GCreateCarData_createCar, GCreateCarData_createCarBuilder> {
  GCreateCarData_createCar._();

  factory GCreateCarData_createCar(
          [Function(GCreateCarData_createCarBuilder b) updates]) =
      _$GCreateCarData_createCar;

  static void _initializeBuilder(GCreateCarData_createCarBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get id;
  String get color;
  String get model;
  String get imageUrl;
  bool get active;
  String get ownerId;
  static Serializer<GCreateCarData_createCar> get serializer =>
      _$gCreateCarDataCreateCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateCarData_createCar.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateCarData_createCar? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateCarData_createCar.serializer,
        json,
      );
}

abstract class GAddChatData
    implements Built<GAddChatData, GAddChatDataBuilder> {
  GAddChatData._();

  factory GAddChatData([Function(GAddChatDataBuilder b) updates]) =
      _$GAddChatData;

  static void _initializeBuilder(GAddChatDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAddChatData_addChart get addChart;
  static Serializer<GAddChatData> get serializer => _$gAddChatDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddChatData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddChatData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddChatData.serializer,
        json,
      );
}

abstract class GAddChatData_addChart
    implements Built<GAddChatData_addChart, GAddChatData_addChartBuilder> {
  GAddChatData_addChart._();

  factory GAddChatData_addChart(
          [Function(GAddChatData_addChartBuilder b) updates]) =
      _$GAddChatData_addChart;

  static void _initializeBuilder(GAddChatData_addChartBuilder b) =>
      b..G__typename = 'ChartDto';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get to;
  String get from;
  String get message;
  String get topic;
  String get dateSend;
  String? get deviceRegToken;
  static Serializer<GAddChatData_addChart> get serializer =>
      _$gAddChatDataAddChartSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddChatData_addChart.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddChatData_addChart? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddChatData_addChart.serializer,
        json,
      );
}

abstract class GChangeUserPasswordData
    implements Built<GChangeUserPasswordData, GChangeUserPasswordDataBuilder> {
  GChangeUserPasswordData._();

  factory GChangeUserPasswordData(
          [Function(GChangeUserPasswordDataBuilder b) updates]) =
      _$GChangeUserPasswordData;

  static void _initializeBuilder(GChangeUserPasswordDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GChangeUserPasswordData_passwordResetRequestByPhone
      get passwordResetRequestByPhone;
  static Serializer<GChangeUserPasswordData> get serializer =>
      _$gChangeUserPasswordDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChangeUserPasswordData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GChangeUserPasswordData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChangeUserPasswordData.serializer,
        json,
      );
}

abstract class GChangeUserPasswordData_passwordResetRequestByPhone
    implements
        Built<GChangeUserPasswordData_passwordResetRequestByPhone,
            GChangeUserPasswordData_passwordResetRequestByPhoneBuilder> {
  GChangeUserPasswordData_passwordResetRequestByPhone._();

  factory GChangeUserPasswordData_passwordResetRequestByPhone(
      [Function(GChangeUserPasswordData_passwordResetRequestByPhoneBuilder b)
          updates]) = _$GChangeUserPasswordData_passwordResetRequestByPhone;

  static void _initializeBuilder(
          GChangeUserPasswordData_passwordResetRequestByPhoneBuilder b) =>
      b..G__typename = 'IResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String> get messages;
  bool get succeeded;
  static Serializer<GChangeUserPasswordData_passwordResetRequestByPhone>
      get serializer =>
          _$gChangeUserPasswordDataPasswordResetRequestByPhoneSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChangeUserPasswordData_passwordResetRequestByPhone.serializer,
        this,
      ) as Map<String, dynamic>);
  static GChangeUserPasswordData_passwordResetRequestByPhone? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChangeUserPasswordData_passwordResetRequestByPhone.serializer,
        json,
      );
}

abstract class GSendOTPData
    implements Built<GSendOTPData, GSendOTPDataBuilder> {
  GSendOTPData._();

  factory GSendOTPData([Function(GSendOTPDataBuilder b) updates]) =
      _$GSendOTPData;

  static void _initializeBuilder(GSendOTPDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get verificationCode;
  static Serializer<GSendOTPData> get serializer => _$gSendOTPDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSendOTPData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSendOTPData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSendOTPData.serializer,
        json,
      );
}

abstract class GLNMStatusData
    implements Built<GLNMStatusData, GLNMStatusDataBuilder> {
  GLNMStatusData._();

  factory GLNMStatusData([Function(GLNMStatusDataBuilder b) updates]) =
      _$GLNMStatusData;

  static void _initializeBuilder(GLNMStatusDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLNMStatusData_lNMPesaStatus get lNMPesaStatus;
  static Serializer<GLNMStatusData> get serializer =>
      _$gLNMStatusDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLNMStatusData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLNMStatusData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLNMStatusData.serializer,
        json,
      );
}

abstract class GLNMStatusData_lNMPesaStatus
    implements
        Built<GLNMStatusData_lNMPesaStatus,
            GLNMStatusData_lNMPesaStatusBuilder> {
  GLNMStatusData_lNMPesaStatus._();

  factory GLNMStatusData_lNMPesaStatus(
          [Function(GLNMStatusData_lNMPesaStatusBuilder b) updates]) =
      _$GLNMStatusData_lNMPesaStatus;

  static void _initializeBuilder(GLNMStatusData_lNMPesaStatusBuilder b) =>
      b..G__typename = 'LipaNaMpesaOnlineStatusResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get responseCode;
  String? get responseDescription;
  String? get merchantRequestID;
  String? get checkoutRequestID;
  String? get resultCode;
  String? get resultDesc;
  static Serializer<GLNMStatusData_lNMPesaStatus> get serializer =>
      _$gLNMStatusDataLNMPesaStatusSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLNMStatusData_lNMPesaStatus.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLNMStatusData_lNMPesaStatus? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLNMStatusData_lNMPesaStatus.serializer,
        json,
      );
}

abstract class GTransactB2CData
    implements Built<GTransactB2CData, GTransactB2CDataBuilder> {
  GTransactB2CData._();

  factory GTransactB2CData([Function(GTransactB2CDataBuilder b) updates]) =
      _$GTransactB2CData;

  static void _initializeBuilder(GTransactB2CDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTransactB2CData_transactB2C get transactB2C;
  static Serializer<GTransactB2CData> get serializer =>
      _$gTransactB2CDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTransactB2CData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactB2CData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTransactB2CData.serializer,
        json,
      );
}

abstract class GTransactB2CData_transactB2C
    implements
        Built<GTransactB2CData_transactB2C,
            GTransactB2CData_transactB2CBuilder> {
  GTransactB2CData_transactB2C._();

  factory GTransactB2CData_transactB2C(
          [Function(GTransactB2CData_transactB2CBuilder b) updates]) =
      _$GTransactB2CData_transactB2C;

  static void _initializeBuilder(GTransactB2CData_transactB2CBuilder b) =>
      b..G__typename = 'B2CResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get conversationID;
  String? get originatorConversationID;
  String? get responseCode;
  String? get responseDescription;
  static Serializer<GTransactB2CData_transactB2C> get serializer =>
      _$gTransactB2CDataTransactB2CSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTransactB2CData_transactB2C.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactB2CData_transactB2C? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTransactB2CData_transactB2C.serializer,
        json,
      );
}

abstract class GUpdateUserPhoneNumberData
    implements
        Built<GUpdateUserPhoneNumberData, GUpdateUserPhoneNumberDataBuilder> {
  GUpdateUserPhoneNumberData._();

  factory GUpdateUserPhoneNumberData(
          [Function(GUpdateUserPhoneNumberDataBuilder b) updates]) =
      _$GUpdateUserPhoneNumberData;

  static void _initializeBuilder(GUpdateUserPhoneNumberDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateUserPhoneNumberData_updateUserPhoneNumber get updateUserPhoneNumber;
  static Serializer<GUpdateUserPhoneNumberData> get serializer =>
      _$gUpdateUserPhoneNumberDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserPhoneNumberData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserPhoneNumberData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserPhoneNumberData.serializer,
        json,
      );
}

abstract class GUpdateUserPhoneNumberData_updateUserPhoneNumber
    implements
        Built<GUpdateUserPhoneNumberData_updateUserPhoneNumber,
            GUpdateUserPhoneNumberData_updateUserPhoneNumberBuilder> {
  GUpdateUserPhoneNumberData_updateUserPhoneNumber._();

  factory GUpdateUserPhoneNumberData_updateUserPhoneNumber(
      [Function(GUpdateUserPhoneNumberData_updateUserPhoneNumberBuilder b)
          updates]) = _$GUpdateUserPhoneNumberData_updateUserPhoneNumber;

  static void _initializeBuilder(
          GUpdateUserPhoneNumberData_updateUserPhoneNumberBuilder b) =>
      b..G__typename = 'AppResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String> get messages;
  bool get succeeded;
  static Serializer<GUpdateUserPhoneNumberData_updateUserPhoneNumber>
      get serializer =>
          _$gUpdateUserPhoneNumberDataUpdateUserPhoneNumberSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserPhoneNumberData_updateUserPhoneNumber.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserPhoneNumberData_updateUserPhoneNumber? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserPhoneNumberData_updateUserPhoneNumber.serializer,
        json,
      );
}

abstract class GUpdateUserDetailsData
    implements Built<GUpdateUserDetailsData, GUpdateUserDetailsDataBuilder> {
  GUpdateUserDetailsData._();

  factory GUpdateUserDetailsData(
          [Function(GUpdateUserDetailsDataBuilder b) updates]) =
      _$GUpdateUserDetailsData;

  static void _initializeBuilder(GUpdateUserDetailsDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateUserDetailsData_updateUser get updateUser;
  static Serializer<GUpdateUserDetailsData> get serializer =>
      _$gUpdateUserDetailsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserDetailsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserDetailsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserDetailsData.serializer,
        json,
      );
}

abstract class GUpdateUserDetailsData_updateUser
    implements
        Built<GUpdateUserDetailsData_updateUser,
            GUpdateUserDetailsData_updateUserBuilder> {
  GUpdateUserDetailsData_updateUser._();

  factory GUpdateUserDetailsData_updateUser(
          [Function(GUpdateUserDetailsData_updateUserBuilder b) updates]) =
      _$GUpdateUserDetailsData_updateUser;

  static void _initializeBuilder(GUpdateUserDetailsData_updateUserBuilder b) =>
      b..G__typename = 'AppResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String> get messages;
  bool get succeeded;
  static Serializer<GUpdateUserDetailsData_updateUser> get serializer =>
      _$gUpdateUserDetailsDataUpdateUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserDetailsData_updateUser.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserDetailsData_updateUser? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserDetailsData_updateUser.serializer,
        json,
      );
}

abstract class GUpdateCarDetailsData
    implements Built<GUpdateCarDetailsData, GUpdateCarDetailsDataBuilder> {
  GUpdateCarDetailsData._();

  factory GUpdateCarDetailsData(
          [Function(GUpdateCarDetailsDataBuilder b) updates]) =
      _$GUpdateCarDetailsData;

  static void _initializeBuilder(GUpdateCarDetailsDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateCarDetailsData_updateCar get updateCar;
  static Serializer<GUpdateCarDetailsData> get serializer =>
      _$gUpdateCarDetailsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateCarDetailsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateCarDetailsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateCarDetailsData.serializer,
        json,
      );
}

abstract class GUpdateCarDetailsData_updateCar
    implements
        Built<GUpdateCarDetailsData_updateCar,
            GUpdateCarDetailsData_updateCarBuilder> {
  GUpdateCarDetailsData_updateCar._();

  factory GUpdateCarDetailsData_updateCar(
          [Function(GUpdateCarDetailsData_updateCarBuilder b) updates]) =
      _$GUpdateCarDetailsData_updateCar;

  static void _initializeBuilder(GUpdateCarDetailsData_updateCarBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get active;
  String get color;
  String get id;
  String get imageUrl;
  String get licensePlate;
  String get model;
  static Serializer<GUpdateCarDetailsData_updateCar> get serializer =>
      _$gUpdateCarDetailsDataUpdateCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateCarDetailsData_updateCar.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateCarDetailsData_updateCar? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateCarDetailsData_updateCar.serializer,
        json,
      );
}

abstract class GupdateFMCTokenData
    implements Built<GupdateFMCTokenData, GupdateFMCTokenDataBuilder> {
  GupdateFMCTokenData._();

  factory GupdateFMCTokenData(
      [Function(GupdateFMCTokenDataBuilder b) updates]) = _$GupdateFMCTokenData;

  static void _initializeBuilder(GupdateFMCTokenDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GupdateFMCTokenData_updateFMCToken get updateFMCToken;
  static Serializer<GupdateFMCTokenData> get serializer =>
      _$gupdateFMCTokenDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GupdateFMCTokenData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GupdateFMCTokenData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GupdateFMCTokenData.serializer,
        json,
      );
}

abstract class GupdateFMCTokenData_updateFMCToken
    implements
        Built<GupdateFMCTokenData_updateFMCToken,
            GupdateFMCTokenData_updateFMCTokenBuilder> {
  GupdateFMCTokenData_updateFMCToken._();

  factory GupdateFMCTokenData_updateFMCToken(
          [Function(GupdateFMCTokenData_updateFMCTokenBuilder b) updates]) =
      _$GupdateFMCTokenData_updateFMCToken;

  static void _initializeBuilder(GupdateFMCTokenData_updateFMCTokenBuilder b) =>
      b..G__typename = 'AppResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String> get messages;
  bool get succeeded;
  static Serializer<GupdateFMCTokenData_updateFMCToken> get serializer =>
      _$gupdateFMCTokenDataUpdateFMCTokenSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GupdateFMCTokenData_updateFMCToken.serializer,
        this,
      ) as Map<String, dynamic>);
  static GupdateFMCTokenData_updateFMCToken? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GupdateFMCTokenData_updateFMCToken.serializer,
        json,
      );
}

abstract class GCheckIfUserIsDriverData
    implements
        Built<GCheckIfUserIsDriverData, GCheckIfUserIsDriverDataBuilder> {
  GCheckIfUserIsDriverData._();

  factory GCheckIfUserIsDriverData(
          [Function(GCheckIfUserIsDriverDataBuilder b) updates]) =
      _$GCheckIfUserIsDriverData;

  static void _initializeBuilder(GCheckIfUserIsDriverDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GCheckIfUserIsDriverData_usersInRole> get usersInRole;
  static Serializer<GCheckIfUserIsDriverData> get serializer =>
      _$gCheckIfUserIsDriverDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCheckIfUserIsDriverData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCheckIfUserIsDriverData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCheckIfUserIsDriverData.serializer,
        json,
      );
}

abstract class GCheckIfUserIsDriverData_usersInRole
    implements
        Built<GCheckIfUserIsDriverData_usersInRole,
            GCheckIfUserIsDriverData_usersInRoleBuilder> {
  GCheckIfUserIsDriverData_usersInRole._();

  factory GCheckIfUserIsDriverData_usersInRole(
          [Function(GCheckIfUserIsDriverData_usersInRoleBuilder b) updates]) =
      _$GCheckIfUserIsDriverData_usersInRole;

  static void _initializeBuilder(
          GCheckIfUserIsDriverData_usersInRoleBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get email;
  static Serializer<GCheckIfUserIsDriverData_usersInRole> get serializer =>
      _$gCheckIfUserIsDriverDataUsersInRoleSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCheckIfUserIsDriverData_usersInRole.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCheckIfUserIsDriverData_usersInRole? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCheckIfUserIsDriverData_usersInRole.serializer,
        json,
      );
}

abstract class GGetAllRolesData
    implements Built<GGetAllRolesData, GGetAllRolesDataBuilder> {
  GGetAllRolesData._();

  factory GGetAllRolesData([Function(GGetAllRolesDataBuilder b) updates]) =
      _$GGetAllRolesData;

  static void _initializeBuilder(GGetAllRolesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetAllRolesData_roles get roles;
  static Serializer<GGetAllRolesData> get serializer =>
      _$gGetAllRolesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllRolesData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllRolesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllRolesData.serializer,
        json,
      );
}

abstract class GGetAllRolesData_roles
    implements Built<GGetAllRolesData_roles, GGetAllRolesData_rolesBuilder> {
  GGetAllRolesData_roles._();

  factory GGetAllRolesData_roles(
          [Function(GGetAllRolesData_rolesBuilder b) updates]) =
      _$GGetAllRolesData_roles;

  static void _initializeBuilder(GGetAllRolesData_rolesBuilder b) =>
      b..G__typename = 'AppResultOfListOfRoleResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetAllRolesData_roles_data> get data;
  static Serializer<GGetAllRolesData_roles> get serializer =>
      _$gGetAllRolesDataRolesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllRolesData_roles.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllRolesData_roles? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllRolesData_roles.serializer,
        json,
      );
}

abstract class GGetAllRolesData_roles_data
    implements
        Built<GGetAllRolesData_roles_data, GGetAllRolesData_roles_dataBuilder> {
  GGetAllRolesData_roles_data._();

  factory GGetAllRolesData_roles_data(
          [Function(GGetAllRolesData_roles_dataBuilder b) updates]) =
      _$GGetAllRolesData_roles_data;

  static void _initializeBuilder(GGetAllRolesData_roles_dataBuilder b) =>
      b..G__typename = 'RoleResponse';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String get description;
  static Serializer<GGetAllRolesData_roles_data> get serializer =>
      _$gGetAllRolesDataRolesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllRolesData_roles_data.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllRolesData_roles_data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllRolesData_roles_data.serializer,
        json,
      );
}

abstract class GGetDriverTripsData
    implements Built<GGetDriverTripsData, GGetDriverTripsDataBuilder> {
  GGetDriverTripsData._();

  factory GGetDriverTripsData(
      [Function(GGetDriverTripsDataBuilder b) updates]) = _$GGetDriverTripsData;

  static void _initializeBuilder(GGetDriverTripsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetDriverTripsData_rides> get rides;
  static Serializer<GGetDriverTripsData> get serializer =>
      _$gGetDriverTripsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDriverTripsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDriverTripsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDriverTripsData.serializer,
        json,
      );
}

abstract class GGetDriverTripsData_rides
    implements
        Built<GGetDriverTripsData_rides, GGetDriverTripsData_ridesBuilder> {
  GGetDriverTripsData_rides._();

  factory GGetDriverTripsData_rides(
          [Function(GGetDriverTripsData_ridesBuilder b) updates]) =
      _$GGetDriverTripsData_rides;

  static void _initializeBuilder(GGetDriverTripsData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  String? get destination;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get duration;
  double get totalPay;
  String? get status;
  GGetDriverTripsData_rides_car? get car;
  static Serializer<GGetDriverTripsData_rides> get serializer =>
      _$gGetDriverTripsDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDriverTripsData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDriverTripsData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDriverTripsData_rides.serializer,
        json,
      );
}

abstract class GGetDriverTripsData_rides_car
    implements
        Built<GGetDriverTripsData_rides_car,
            GGetDriverTripsData_rides_carBuilder> {
  GGetDriverTripsData_rides_car._();

  factory GGetDriverTripsData_rides_car(
          [Function(GGetDriverTripsData_rides_carBuilder b) updates]) =
      _$GGetDriverTripsData_rides_car;

  static void _initializeBuilder(GGetDriverTripsData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  static Serializer<GGetDriverTripsData_rides_car> get serializer =>
      _$gGetDriverTripsDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDriverTripsData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDriverTripsData_rides_car? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDriverTripsData_rides_car.serializer,
        json,
      );
}

abstract class GGetPaidTripsData
    implements Built<GGetPaidTripsData, GGetPaidTripsDataBuilder> {
  GGetPaidTripsData._();

  factory GGetPaidTripsData([Function(GGetPaidTripsDataBuilder b) updates]) =
      _$GGetPaidTripsData;

  static void _initializeBuilder(GGetPaidTripsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetPaidTripsData_rides> get rides;
  static Serializer<GGetPaidTripsData> get serializer =>
      _$gGetPaidTripsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPaidTripsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPaidTripsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPaidTripsData.serializer,
        json,
      );
}

abstract class GGetPaidTripsData_rides
    implements Built<GGetPaidTripsData_rides, GGetPaidTripsData_ridesBuilder> {
  GGetPaidTripsData_rides._();

  factory GGetPaidTripsData_rides(
          [Function(GGetPaidTripsData_ridesBuilder b) updates]) =
      _$GGetPaidTripsData_rides;

  static void _initializeBuilder(GGetPaidTripsData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  String? get destination;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get duration;
  String? get status;
  double get totalPay;
  GGetPaidTripsData_rides_car? get car;
  static Serializer<GGetPaidTripsData_rides> get serializer =>
      _$gGetPaidTripsDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPaidTripsData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPaidTripsData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPaidTripsData_rides.serializer,
        json,
      );
}

abstract class GGetPaidTripsData_rides_car
    implements
        Built<GGetPaidTripsData_rides_car, GGetPaidTripsData_rides_carBuilder> {
  GGetPaidTripsData_rides_car._();

  factory GGetPaidTripsData_rides_car(
          [Function(GGetPaidTripsData_rides_carBuilder b) updates]) =
      _$GGetPaidTripsData_rides_car;

  static void _initializeBuilder(GGetPaidTripsData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  static Serializer<GGetPaidTripsData_rides_car> get serializer =>
      _$gGetPaidTripsDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPaidTripsData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPaidTripsData_rides_car? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPaidTripsData_rides_car.serializer,
        json,
      );
}

abstract class GGetUserByUserNameData
    implements Built<GGetUserByUserNameData, GGetUserByUserNameDataBuilder> {
  GGetUserByUserNameData._();

  factory GGetUserByUserNameData(
          [Function(GGetUserByUserNameDataBuilder b) updates]) =
      _$GGetUserByUserNameData;

  static void _initializeBuilder(GGetUserByUserNameDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserByUserNameData_users> get users;
  static Serializer<GGetUserByUserNameData> get serializer =>
      _$gGetUserByUserNameDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByUserNameData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByUserNameData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByUserNameData.serializer,
        json,
      );
}

abstract class GGetUserByUserNameData_users
    implements
        Built<GGetUserByUserNameData_users,
            GGetUserByUserNameData_usersBuilder> {
  GGetUserByUserNameData_users._();

  factory GGetUserByUserNameData_users(
          [Function(GGetUserByUserNameData_usersBuilder b) updates]) =
      _$GGetUserByUserNameData_users;

  static void _initializeBuilder(GGetUserByUserNameData_usersBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get email;
  String get lastName;
  String? get firstName;
  String? get id;
  bool get isActive;
  String get nationalId;
  String? get phoneNumber;
  String? get userName;
  GGetUserByUserNameData_users_identificationDocument?
      get identificationDocument;
  BuiltList<GGetUserByUserNameData_users_ownedCars> get ownedCars;
  static Serializer<GGetUserByUserNameData_users> get serializer =>
      _$gGetUserByUserNameDataUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByUserNameData_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByUserNameData_users? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByUserNameData_users.serializer,
        json,
      );
}

abstract class GGetUserByUserNameData_users_identificationDocument
    implements
        Built<GGetUserByUserNameData_users_identificationDocument,
            GGetUserByUserNameData_users_identificationDocumentBuilder> {
  GGetUserByUserNameData_users_identificationDocument._();

  factory GGetUserByUserNameData_users_identificationDocument(
      [Function(GGetUserByUserNameData_users_identificationDocumentBuilder b)
          updates]) = _$GGetUserByUserNameData_users_identificationDocument;

  static void _initializeBuilder(
          GGetUserByUserNameData_users_identificationDocumentBuilder b) =>
      b..G__typename = 'IdentificationDocument';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get nationalIdFront;
  String? get nationalIdRear;
  String? get drivingLicenceRear;
  String? get drivingLicenceFront;
  static Serializer<GGetUserByUserNameData_users_identificationDocument>
      get serializer =>
          _$gGetUserByUserNameDataUsersIdentificationDocumentSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByUserNameData_users_identificationDocument.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByUserNameData_users_identificationDocument? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByUserNameData_users_identificationDocument.serializer,
        json,
      );
}

abstract class GGetUserByUserNameData_users_ownedCars
    implements
        Built<GGetUserByUserNameData_users_ownedCars,
            GGetUserByUserNameData_users_ownedCarsBuilder> {
  GGetUserByUserNameData_users_ownedCars._();

  factory GGetUserByUserNameData_users_ownedCars(
          [Function(GGetUserByUserNameData_users_ownedCarsBuilder b) updates]) =
      _$GGetUserByUserNameData_users_ownedCars;

  static void _initializeBuilder(
          GGetUserByUserNameData_users_ownedCarsBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get active;
  String get color;
  String get licensePlate;
  String get model;
  static Serializer<GGetUserByUserNameData_users_ownedCars> get serializer =>
      _$gGetUserByUserNameDataUsersOwnedCarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByUserNameData_users_ownedCars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByUserNameData_users_ownedCars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByUserNameData_users_ownedCars.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesData
    implements
        Built<GFilterToAndFromRidesData, GFilterToAndFromRidesDataBuilder> {
  GFilterToAndFromRidesData._();

  factory GFilterToAndFromRidesData(
          [Function(GFilterToAndFromRidesDataBuilder b) updates]) =
      _$GFilterToAndFromRidesData;

  static void _initializeBuilder(GFilterToAndFromRidesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFilterToAndFromRidesData_rides> get rides;
  static Serializer<GFilterToAndFromRidesData> get serializer =>
      _$gFilterToAndFromRidesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFilterToAndFromRidesData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFilterToAndFromRidesData.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesData_rides
    implements
        Built<GFilterToAndFromRidesData_rides,
            GFilterToAndFromRidesData_ridesBuilder> {
  GFilterToAndFromRidesData_rides._();

  factory GFilterToAndFromRidesData_rides(
          [Function(GFilterToAndFromRidesData_ridesBuilder b) updates]) =
      _$GFilterToAndFromRidesData_rides;

  static void _initializeBuilder(GFilterToAndFromRidesData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  String? get destination;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get duration;
  _i2.GTimeSpan? get departureTime;
  String? get exactPickupLocation;
  String? get status;
  GFilterToAndFromRidesData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  GFilterToAndFromRidesData_rides_car? get car;
  BuiltList<GFilterToAndFromRidesData_rides_users>? get users;
  static Serializer<GFilterToAndFromRidesData_rides> get serializer =>
      _$gFilterToAndFromRidesDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFilterToAndFromRidesData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFilterToAndFromRidesData_rides.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesData_rides_seat
    implements
        Built<GFilterToAndFromRidesData_rides_seat,
            GFilterToAndFromRidesData_rides_seatBuilder> {
  GFilterToAndFromRidesData_rides_seat._();

  factory GFilterToAndFromRidesData_rides_seat(
          [Function(GFilterToAndFromRidesData_rides_seatBuilder b) updates]) =
      _$GFilterToAndFromRidesData_rides_seat;

  static void _initializeBuilder(
          GFilterToAndFromRidesData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GFilterToAndFromRidesData_rides_seat> get serializer =>
      _$gFilterToAndFromRidesDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFilterToAndFromRidesData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesData_rides_seat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFilterToAndFromRidesData_rides_seat.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesData_rides_car
    implements
        Built<GFilterToAndFromRidesData_rides_car,
            GFilterToAndFromRidesData_rides_carBuilder> {
  GFilterToAndFromRidesData_rides_car._();

  factory GFilterToAndFromRidesData_rides_car(
          [Function(GFilterToAndFromRidesData_rides_carBuilder b) updates]) =
      _$GFilterToAndFromRidesData_rides_car;

  static void _initializeBuilder(
          GFilterToAndFromRidesData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get imageUrl;
  static Serializer<GFilterToAndFromRidesData_rides_car> get serializer =>
      _$gFilterToAndFromRidesDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFilterToAndFromRidesData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesData_rides_car? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFilterToAndFromRidesData_rides_car.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesData_rides_users
    implements
        Built<GFilterToAndFromRidesData_rides_users,
            GFilterToAndFromRidesData_rides_usersBuilder> {
  GFilterToAndFromRidesData_rides_users._();

  factory GFilterToAndFromRidesData_rides_users(
          [Function(GFilterToAndFromRidesData_rides_usersBuilder b) updates]) =
      _$GFilterToAndFromRidesData_rides_users;

  static void _initializeBuilder(
          GFilterToAndFromRidesData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFilterToAndFromRidesData_rides_users_user? get user;
  static Serializer<GFilterToAndFromRidesData_rides_users> get serializer =>
      _$gFilterToAndFromRidesDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFilterToAndFromRidesData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesData_rides_users? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFilterToAndFromRidesData_rides_users.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesData_rides_users_user
    implements
        Built<GFilterToAndFromRidesData_rides_users_user,
            GFilterToAndFromRidesData_rides_users_userBuilder> {
  GFilterToAndFromRidesData_rides_users_user._();

  factory GFilterToAndFromRidesData_rides_users_user(
      [Function(GFilterToAndFromRidesData_rides_users_userBuilder b)
          updates]) = _$GFilterToAndFromRidesData_rides_users_user;

  static void _initializeBuilder(
          GFilterToAndFromRidesData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GFilterToAndFromRidesData_rides_users_user>
      get serializer => _$gFilterToAndFromRidesDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFilterToAndFromRidesData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesData_rides_users_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFilterToAndFromRidesData_rides_users_user.serializer,
        json,
      );
}

abstract class GGetUserCarsData
    implements Built<GGetUserCarsData, GGetUserCarsDataBuilder> {
  GGetUserCarsData._();

  factory GGetUserCarsData([Function(GGetUserCarsDataBuilder b) updates]) =
      _$GGetUserCarsData;

  static void _initializeBuilder(GGetUserCarsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserCarsData_users> get users;
  static Serializer<GGetUserCarsData> get serializer =>
      _$gGetUserCarsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserCarsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserCarsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserCarsData.serializer,
        json,
      );
}

abstract class GGetUserCarsData_users
    implements Built<GGetUserCarsData_users, GGetUserCarsData_usersBuilder> {
  GGetUserCarsData_users._();

  factory GGetUserCarsData_users(
          [Function(GGetUserCarsData_usersBuilder b) updates]) =
      _$GGetUserCarsData_users;

  static void _initializeBuilder(GGetUserCarsData_usersBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get email;
  String get lastName;
  String? get id;
  bool get isActive;
  String get nationalId;
  String? get phoneNumber;
  String? get userName;
  BuiltList<GGetUserCarsData_users_ownedCars> get ownedCars;
  static Serializer<GGetUserCarsData_users> get serializer =>
      _$gGetUserCarsDataUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserCarsData_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserCarsData_users? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserCarsData_users.serializer,
        json,
      );
}

abstract class GGetUserCarsData_users_ownedCars
    implements
        Built<GGetUserCarsData_users_ownedCars,
            GGetUserCarsData_users_ownedCarsBuilder> {
  GGetUserCarsData_users_ownedCars._();

  factory GGetUserCarsData_users_ownedCars(
          [Function(GGetUserCarsData_users_ownedCarsBuilder b) updates]) =
      _$GGetUserCarsData_users_ownedCars;

  static void _initializeBuilder(GGetUserCarsData_users_ownedCarsBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get active;
  String get color;
  String get licensePlate;
  String get model;
  String get imageUrl;
  String get ownerId;
  static Serializer<GGetUserCarsData_users_ownedCars> get serializer =>
      _$gGetUserCarsDataUsersOwnedCarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserCarsData_users_ownedCars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserCarsData_users_ownedCars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserCarsData_users_ownedCars.serializer,
        json,
      );
}

abstract class GGetUserWithFilterData
    implements Built<GGetUserWithFilterData, GGetUserWithFilterDataBuilder> {
  GGetUserWithFilterData._();

  factory GGetUserWithFilterData(
          [Function(GGetUserWithFilterDataBuilder b) updates]) =
      _$GGetUserWithFilterData;

  static void _initializeBuilder(GGetUserWithFilterDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserWithFilterData_users> get users;
  static Serializer<GGetUserWithFilterData> get serializer =>
      _$gGetUserWithFilterDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterData.serializer,
        json,
      );
}

abstract class GGetUserWithFilterData_users
    implements
        Built<GGetUserWithFilterData_users,
            GGetUserWithFilterData_usersBuilder> {
  GGetUserWithFilterData_users._();

  factory GGetUserWithFilterData_users(
          [Function(GGetUserWithFilterData_usersBuilder b) updates]) =
      _$GGetUserWithFilterData_users;

  static void _initializeBuilder(GGetUserWithFilterData_usersBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get email;
  String get lastName;
  String? get firstName;
  String? get id;
  bool get isActive;
  String get nationalId;
  String? get phoneNumber;
  String? get userName;
  String? get aboutMe;
  String? get referalCode;
  double get loyaltyPoints;
  String get profilePictureDataUrl;
  GGetUserWithFilterData_users_location? get location;
  BuiltList<GGetUserWithFilterData_users_frequentRoutes> get frequentRoutes;
  BuiltList<GGetUserWithFilterData_users_ownedCars> get ownedCars;
  static Serializer<GGetUserWithFilterData_users> get serializer =>
      _$gGetUserWithFilterDataUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterData_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterData_users? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterData_users.serializer,
        json,
      );
}

abstract class GGetUserWithFilterData_users_location
    implements
        Built<GGetUserWithFilterData_users_location,
            GGetUserWithFilterData_users_locationBuilder> {
  GGetUserWithFilterData_users_location._();

  factory GGetUserWithFilterData_users_location(
          [Function(GGetUserWithFilterData_users_locationBuilder b) updates]) =
      _$GGetUserWithFilterData_users_location;

  static void _initializeBuilder(
          GGetUserWithFilterData_users_locationBuilder b) =>
      b..G__typename = 'Location';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserWithFilterData_users_location_country get country;
  static Serializer<GGetUserWithFilterData_users_location> get serializer =>
      _$gGetUserWithFilterDataUsersLocationSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterData_users_location.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterData_users_location? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterData_users_location.serializer,
        json,
      );
}

abstract class GGetUserWithFilterData_users_location_country
    implements
        Built<GGetUserWithFilterData_users_location_country,
            GGetUserWithFilterData_users_location_countryBuilder> {
  GGetUserWithFilterData_users_location_country._();

  factory GGetUserWithFilterData_users_location_country(
      [Function(GGetUserWithFilterData_users_location_countryBuilder b)
          updates]) = _$GGetUserWithFilterData_users_location_country;

  static void _initializeBuilder(
          GGetUserWithFilterData_users_location_countryBuilder b) =>
      b..G__typename = 'Country';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get abbrev;
  static Serializer<GGetUserWithFilterData_users_location_country>
      get serializer => _$gGetUserWithFilterDataUsersLocationCountrySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterData_users_location_country.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterData_users_location_country? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterData_users_location_country.serializer,
        json,
      );
}

abstract class GGetUserWithFilterData_users_frequentRoutes
    implements
        Built<GGetUserWithFilterData_users_frequentRoutes,
            GGetUserWithFilterData_users_frequentRoutesBuilder> {
  GGetUserWithFilterData_users_frequentRoutes._();

  factory GGetUserWithFilterData_users_frequentRoutes(
      [Function(GGetUserWithFilterData_users_frequentRoutesBuilder b)
          updates]) = _$GGetUserWithFilterData_users_frequentRoutes;

  static void _initializeBuilder(
          GGetUserWithFilterData_users_frequentRoutesBuilder b) =>
      b..G__typename = 'FrequentRoute';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get destination;
  String get origin;
  int get id;
  GGetUserWithFilterData_users_frequentRoutes_color get color;
  static Serializer<GGetUserWithFilterData_users_frequentRoutes>
      get serializer => _$gGetUserWithFilterDataUsersFrequentRoutesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterData_users_frequentRoutes.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterData_users_frequentRoutes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterData_users_frequentRoutes.serializer,
        json,
      );
}

abstract class GGetUserWithFilterData_users_frequentRoutes_color
    implements
        Built<GGetUserWithFilterData_users_frequentRoutes_color,
            GGetUserWithFilterData_users_frequentRoutes_colorBuilder> {
  GGetUserWithFilterData_users_frequentRoutes_color._();

  factory GGetUserWithFilterData_users_frequentRoutes_color(
      [Function(GGetUserWithFilterData_users_frequentRoutes_colorBuilder b)
          updates]) = _$GGetUserWithFilterData_users_frequentRoutes_color;

  static void _initializeBuilder(
          GGetUserWithFilterData_users_frequentRoutes_colorBuilder b) =>
      b..G__typename = 'ColorCustom';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get r;
  String get g;
  String get b;
  String get a;
  static Serializer<GGetUserWithFilterData_users_frequentRoutes_color>
      get serializer =>
          _$gGetUserWithFilterDataUsersFrequentRoutesColorSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterData_users_frequentRoutes_color.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterData_users_frequentRoutes_color? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterData_users_frequentRoutes_color.serializer,
        json,
      );
}

abstract class GGetUserWithFilterData_users_ownedCars
    implements
        Built<GGetUserWithFilterData_users_ownedCars,
            GGetUserWithFilterData_users_ownedCarsBuilder> {
  GGetUserWithFilterData_users_ownedCars._();

  factory GGetUserWithFilterData_users_ownedCars(
          [Function(GGetUserWithFilterData_users_ownedCarsBuilder b) updates]) =
      _$GGetUserWithFilterData_users_ownedCars;

  static void _initializeBuilder(
          GGetUserWithFilterData_users_ownedCarsBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get active;
  String get color;
  String get licensePlate;
  String get model;
  static Serializer<GGetUserWithFilterData_users_ownedCars> get serializer =>
      _$gGetUserWithFilterDataUsersOwnedCarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWithFilterData_users_ownedCars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterData_users_ownedCars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWithFilterData_users_ownedCars.serializer,
        json,
      );
}

abstract class GGetUserByIdData
    implements Built<GGetUserByIdData, GGetUserByIdDataBuilder> {
  GGetUserByIdData._();

  factory GGetUserByIdData([Function(GGetUserByIdDataBuilder b) updates]) =
      _$GGetUserByIdData;

  static void _initializeBuilder(GGetUserByIdDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserByIdData_users> get users;
  static Serializer<GGetUserByIdData> get serializer =>
      _$gGetUserByIdDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByIdData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByIdData.serializer,
        json,
      );
}

abstract class GGetUserByIdData_users
    implements Built<GGetUserByIdData_users, GGetUserByIdData_usersBuilder> {
  GGetUserByIdData_users._();

  factory GGetUserByIdData_users(
          [Function(GGetUserByIdData_usersBuilder b) updates]) =
      _$GGetUserByIdData_users;

  static void _initializeBuilder(GGetUserByIdData_usersBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get email;
  String get lastName;
  String? get firstName;
  String? get id;
  bool get isActive;
  String get nationalId;
  String? get phoneNumber;
  String? get userName;
  String get profilePictureDataUrl;
  double get averageRating;
  int get tripsCreated;
  int get tripsCompleted;
  int get tripsCancelled;
  String? get aboutMe;
  String? get referalCode;
  double get loyaltyPoints;
  GGetUserByIdData_users_device? get device;
  BuiltList<GGetUserByIdData_users_userRatings> get userRatings;
  BuiltList<GGetUserByIdData_users_ownedCars> get ownedCars;
  static Serializer<GGetUserByIdData_users> get serializer =>
      _$gGetUserByIdDataUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByIdData_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdData_users? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByIdData_users.serializer,
        json,
      );
}

abstract class GGetUserByIdData_users_device
    implements
        Built<GGetUserByIdData_users_device,
            GGetUserByIdData_users_deviceBuilder> {
  GGetUserByIdData_users_device._();

  factory GGetUserByIdData_users_device(
          [Function(GGetUserByIdData_users_deviceBuilder b) updates]) =
      _$GGetUserByIdData_users_device;

  static void _initializeBuilder(GGetUserByIdData_users_deviceBuilder b) =>
      b..G__typename = 'Device';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get deviceRegToken;
  static Serializer<GGetUserByIdData_users_device> get serializer =>
      _$gGetUserByIdDataUsersDeviceSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByIdData_users_device.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdData_users_device? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByIdData_users_device.serializer,
        json,
      );
}

abstract class GGetUserByIdData_users_userRatings
    implements
        Built<GGetUserByIdData_users_userRatings,
            GGetUserByIdData_users_userRatingsBuilder> {
  GGetUserByIdData_users_userRatings._();

  factory GGetUserByIdData_users_userRatings(
          [Function(GGetUserByIdData_users_userRatingsBuilder b) updates]) =
      _$GGetUserByIdData_users_userRatings;

  static void _initializeBuilder(GGetUserByIdData_users_userRatingsBuilder b) =>
      b..G__typename = 'UserRating';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String? get comment;
  String? get userThatRate;
  double get ratingValue;
  _i2.GDateTime get dateOfRating;
  GGetUserByIdData_users_userRatings_reviewer get reviewer;
  static Serializer<GGetUserByIdData_users_userRatings> get serializer =>
      _$gGetUserByIdDataUsersUserRatingsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByIdData_users_userRatings.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdData_users_userRatings? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByIdData_users_userRatings.serializer,
        json,
      );
}

abstract class GGetUserByIdData_users_userRatings_reviewer
    implements
        Built<GGetUserByIdData_users_userRatings_reviewer,
            GGetUserByIdData_users_userRatings_reviewerBuilder> {
  GGetUserByIdData_users_userRatings_reviewer._();

  factory GGetUserByIdData_users_userRatings_reviewer(
      [Function(GGetUserByIdData_users_userRatings_reviewerBuilder b)
          updates]) = _$GGetUserByIdData_users_userRatings_reviewer;

  static void _initializeBuilder(
          GGetUserByIdData_users_userRatings_reviewerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get firstName;
  String get lastName;
  static Serializer<GGetUserByIdData_users_userRatings_reviewer>
      get serializer => _$gGetUserByIdDataUsersUserRatingsReviewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByIdData_users_userRatings_reviewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdData_users_userRatings_reviewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByIdData_users_userRatings_reviewer.serializer,
        json,
      );
}

abstract class GGetUserByIdData_users_ownedCars
    implements
        Built<GGetUserByIdData_users_ownedCars,
            GGetUserByIdData_users_ownedCarsBuilder> {
  GGetUserByIdData_users_ownedCars._();

  factory GGetUserByIdData_users_ownedCars(
          [Function(GGetUserByIdData_users_ownedCarsBuilder b) updates]) =
      _$GGetUserByIdData_users_ownedCars;

  static void _initializeBuilder(GGetUserByIdData_users_ownedCarsBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get active;
  String get color;
  String get licensePlate;
  String get model;
  static Serializer<GGetUserByIdData_users_ownedCars> get serializer =>
      _$gGetUserByIdDataUsersOwnedCarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserByIdData_users_ownedCars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdData_users_ownedCars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserByIdData_users_ownedCars.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData
    implements
        Built<GGetOnGoingUserBookingsData, GGetOnGoingUserBookingsDataBuilder> {
  GGetOnGoingUserBookingsData._();

  factory GGetOnGoingUserBookingsData(
          [Function(GGetOnGoingUserBookingsDataBuilder b) updates]) =
      _$GGetOnGoingUserBookingsData;

  static void _initializeBuilder(GGetOnGoingUserBookingsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetOnGoingUserBookingsData_rides> get rides;
  static Serializer<GGetOnGoingUserBookingsData> get serializer =>
      _$gGetOnGoingUserBookingsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData_rides
    implements
        Built<GGetOnGoingUserBookingsData_rides,
            GGetOnGoingUserBookingsData_ridesBuilder> {
  GGetOnGoingUserBookingsData_rides._();

  factory GGetOnGoingUserBookingsData_rides(
          [Function(GGetOnGoingUserBookingsData_ridesBuilder b) updates]) =
      _$GGetOnGoingUserBookingsData_rides;

  static void _initializeBuilder(GGetOnGoingUserBookingsData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get destination;
  String? get duration;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get status;
  _i2.GDateTime get arrivalTime;
  GGetOnGoingUserBookingsData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  int? get routeIndex;
  GGetOnGoingUserBookingsData_rides_car? get car;
  BuiltList<GGetOnGoingUserBookingsData_rides_transactions>? get transactions;
  BuiltList<GGetOnGoingUserBookingsData_rides_users>? get users;
  static Serializer<GGetOnGoingUserBookingsData_rides> get serializer =>
      _$gGetOnGoingUserBookingsDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData_rides? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData_rides.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData_rides_seat
    implements
        Built<GGetOnGoingUserBookingsData_rides_seat,
            GGetOnGoingUserBookingsData_rides_seatBuilder> {
  GGetOnGoingUserBookingsData_rides_seat._();

  factory GGetOnGoingUserBookingsData_rides_seat(
          [Function(GGetOnGoingUserBookingsData_rides_seatBuilder b) updates]) =
      _$GGetOnGoingUserBookingsData_rides_seat;

  static void _initializeBuilder(
          GGetOnGoingUserBookingsData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetOnGoingUserBookingsData_rides_seat> get serializer =>
      _$gGetOnGoingUserBookingsDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData_rides_seat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData_rides_seat.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData_rides_car
    implements
        Built<GGetOnGoingUserBookingsData_rides_car,
            GGetOnGoingUserBookingsData_rides_carBuilder> {
  GGetOnGoingUserBookingsData_rides_car._();

  factory GGetOnGoingUserBookingsData_rides_car(
          [Function(GGetOnGoingUserBookingsData_rides_carBuilder b) updates]) =
      _$GGetOnGoingUserBookingsData_rides_car;

  static void _initializeBuilder(
          GGetOnGoingUserBookingsData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get id;
  GGetOnGoingUserBookingsData_rides_car_owner? get owner;
  static Serializer<GGetOnGoingUserBookingsData_rides_car> get serializer =>
      _$gGetOnGoingUserBookingsDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData_rides_car? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData_rides_car.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData_rides_car_owner
    implements
        Built<GGetOnGoingUserBookingsData_rides_car_owner,
            GGetOnGoingUserBookingsData_rides_car_ownerBuilder> {
  GGetOnGoingUserBookingsData_rides_car_owner._();

  factory GGetOnGoingUserBookingsData_rides_car_owner(
      [Function(GGetOnGoingUserBookingsData_rides_car_ownerBuilder b)
          updates]) = _$GGetOnGoingUserBookingsData_rides_car_owner;

  static void _initializeBuilder(
          GGetOnGoingUserBookingsData_rides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get firstName;
  String get lastName;
  String? get id;
  String? get userName;
  static Serializer<GGetOnGoingUserBookingsData_rides_car_owner>
      get serializer => _$gGetOnGoingUserBookingsDataRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData_rides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData_rides_car_owner? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData_rides_car_owner.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData_rides_transactions
    implements
        Built<GGetOnGoingUserBookingsData_rides_transactions,
            GGetOnGoingUserBookingsData_rides_transactionsBuilder> {
  GGetOnGoingUserBookingsData_rides_transactions._();

  factory GGetOnGoingUserBookingsData_rides_transactions(
      [Function(GGetOnGoingUserBookingsData_rides_transactionsBuilder b)
          updates]) = _$GGetOnGoingUserBookingsData_rides_transactions;

  static void _initializeBuilder(
          GGetOnGoingUserBookingsData_rides_transactionsBuilder b) =>
      b..G__typename = 'RideTransaction';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get status;
  String? get driverId;
  String? get passengerId;
  String? get phoneNumber;
  double get amount;
  String? get seatsStr;
  String? get id;
  static Serializer<GGetOnGoingUserBookingsData_rides_transactions>
      get serializer =>
          _$gGetOnGoingUserBookingsDataRidesTransactionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData_rides_transactions.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData_rides_transactions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData_rides_transactions.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData_rides_users
    implements
        Built<GGetOnGoingUserBookingsData_rides_users,
            GGetOnGoingUserBookingsData_rides_usersBuilder> {
  GGetOnGoingUserBookingsData_rides_users._();

  factory GGetOnGoingUserBookingsData_rides_users(
      [Function(GGetOnGoingUserBookingsData_rides_usersBuilder b)
          updates]) = _$GGetOnGoingUserBookingsData_rides_users;

  static void _initializeBuilder(
          GGetOnGoingUserBookingsData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetOnGoingUserBookingsData_rides_users_user? get user;
  static Serializer<GGetOnGoingUserBookingsData_rides_users> get serializer =>
      _$gGetOnGoingUserBookingsDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData_rides_users? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData_rides_users.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsData_rides_users_user
    implements
        Built<GGetOnGoingUserBookingsData_rides_users_user,
            GGetOnGoingUserBookingsData_rides_users_userBuilder> {
  GGetOnGoingUserBookingsData_rides_users_user._();

  factory GGetOnGoingUserBookingsData_rides_users_user(
      [Function(GGetOnGoingUserBookingsData_rides_users_userBuilder b)
          updates]) = _$GGetOnGoingUserBookingsData_rides_users_user;

  static void _initializeBuilder(
          GGetOnGoingUserBookingsData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetOnGoingUserBookingsData_rides_users_user>
      get serializer => _$gGetOnGoingUserBookingsDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetOnGoingUserBookingsData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsData_rides_users_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetOnGoingUserBookingsData_rides_users_user.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData
    implements
        Built<GGetPastUserBookingsData, GGetPastUserBookingsDataBuilder> {
  GGetPastUserBookingsData._();

  factory GGetPastUserBookingsData(
          [Function(GGetPastUserBookingsDataBuilder b) updates]) =
      _$GGetPastUserBookingsData;

  static void _initializeBuilder(GGetPastUserBookingsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetPastUserBookingsData_rides> get rides;
  static Serializer<GGetPastUserBookingsData> get serializer =>
      _$gGetPastUserBookingsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData_rides
    implements
        Built<GGetPastUserBookingsData_rides,
            GGetPastUserBookingsData_ridesBuilder> {
  GGetPastUserBookingsData_rides._();

  factory GGetPastUserBookingsData_rides(
          [Function(GGetPastUserBookingsData_ridesBuilder b) updates]) =
      _$GGetPastUserBookingsData_rides;

  static void _initializeBuilder(GGetPastUserBookingsData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get destination;
  String? get duration;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  _i2.GDateTime get arrivalTime;
  String? get status;
  GGetPastUserBookingsData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  GGetPastUserBookingsData_rides_car? get car;
  BuiltList<GGetPastUserBookingsData_rides_transactions>? get transactions;
  BuiltList<GGetPastUserBookingsData_rides_users>? get users;
  static Serializer<GGetPastUserBookingsData_rides> get serializer =>
      _$gGetPastUserBookingsDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData_rides.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData_rides_seat
    implements
        Built<GGetPastUserBookingsData_rides_seat,
            GGetPastUserBookingsData_rides_seatBuilder> {
  GGetPastUserBookingsData_rides_seat._();

  factory GGetPastUserBookingsData_rides_seat(
          [Function(GGetPastUserBookingsData_rides_seatBuilder b) updates]) =
      _$GGetPastUserBookingsData_rides_seat;

  static void _initializeBuilder(
          GGetPastUserBookingsData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetPastUserBookingsData_rides_seat> get serializer =>
      _$gGetPastUserBookingsDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData_rides_seat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData_rides_seat.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData_rides_car
    implements
        Built<GGetPastUserBookingsData_rides_car,
            GGetPastUserBookingsData_rides_carBuilder> {
  GGetPastUserBookingsData_rides_car._();

  factory GGetPastUserBookingsData_rides_car(
          [Function(GGetPastUserBookingsData_rides_carBuilder b) updates]) =
      _$GGetPastUserBookingsData_rides_car;

  static void _initializeBuilder(GGetPastUserBookingsData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get id;
  GGetPastUserBookingsData_rides_car_owner? get owner;
  static Serializer<GGetPastUserBookingsData_rides_car> get serializer =>
      _$gGetPastUserBookingsDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData_rides_car? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData_rides_car.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData_rides_car_owner
    implements
        Built<GGetPastUserBookingsData_rides_car_owner,
            GGetPastUserBookingsData_rides_car_ownerBuilder> {
  GGetPastUserBookingsData_rides_car_owner._();

  factory GGetPastUserBookingsData_rides_car_owner(
      [Function(GGetPastUserBookingsData_rides_car_ownerBuilder b)
          updates]) = _$GGetPastUserBookingsData_rides_car_owner;

  static void _initializeBuilder(
          GGetPastUserBookingsData_rides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get firstName;
  String get lastName;
  String? get id;
  String? get userName;
  static Serializer<GGetPastUserBookingsData_rides_car_owner> get serializer =>
      _$gGetPastUserBookingsDataRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData_rides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData_rides_car_owner? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData_rides_car_owner.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData_rides_transactions
    implements
        Built<GGetPastUserBookingsData_rides_transactions,
            GGetPastUserBookingsData_rides_transactionsBuilder> {
  GGetPastUserBookingsData_rides_transactions._();

  factory GGetPastUserBookingsData_rides_transactions(
      [Function(GGetPastUserBookingsData_rides_transactionsBuilder b)
          updates]) = _$GGetPastUserBookingsData_rides_transactions;

  static void _initializeBuilder(
          GGetPastUserBookingsData_rides_transactionsBuilder b) =>
      b..G__typename = 'RideTransaction';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get status;
  String? get driverId;
  String? get passengerId;
  String? get phoneNumber;
  double get amount;
  String? get seatsStr;
  String? get id;
  String? get paymentMethod;
  static Serializer<GGetPastUserBookingsData_rides_transactions>
      get serializer => _$gGetPastUserBookingsDataRidesTransactionsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData_rides_transactions.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData_rides_transactions? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData_rides_transactions.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData_rides_users
    implements
        Built<GGetPastUserBookingsData_rides_users,
            GGetPastUserBookingsData_rides_usersBuilder> {
  GGetPastUserBookingsData_rides_users._();

  factory GGetPastUserBookingsData_rides_users(
          [Function(GGetPastUserBookingsData_rides_usersBuilder b) updates]) =
      _$GGetPastUserBookingsData_rides_users;

  static void _initializeBuilder(
          GGetPastUserBookingsData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetPastUserBookingsData_rides_users_user? get user;
  static Serializer<GGetPastUserBookingsData_rides_users> get serializer =>
      _$gGetPastUserBookingsDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData_rides_users? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData_rides_users.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsData_rides_users_user
    implements
        Built<GGetPastUserBookingsData_rides_users_user,
            GGetPastUserBookingsData_rides_users_userBuilder> {
  GGetPastUserBookingsData_rides_users_user._();

  factory GGetPastUserBookingsData_rides_users_user(
      [Function(GGetPastUserBookingsData_rides_users_userBuilder b)
          updates]) = _$GGetPastUserBookingsData_rides_users_user;

  static void _initializeBuilder(
          GGetPastUserBookingsData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetPastUserBookingsData_rides_users_user> get serializer =>
      _$gGetPastUserBookingsDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPastUserBookingsData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsData_rides_users_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPastUserBookingsData_rides_users_user.serializer,
        json,
      );
}

abstract class GGetRidesData
    implements Built<GGetRidesData, GGetRidesDataBuilder> {
  GGetRidesData._();

  factory GGetRidesData([Function(GGetRidesDataBuilder b) updates]) =
      _$GGetRidesData;

  static void _initializeBuilder(GGetRidesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetRidesData_rides> get rides;
  static Serializer<GGetRidesData> get serializer => _$gGetRidesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesData.serializer,
        json,
      );
}

abstract class GGetRidesData_rides
    implements Built<GGetRidesData_rides, GGetRidesData_ridesBuilder> {
  GGetRidesData_rides._();

  factory GGetRidesData_rides(
      [Function(GGetRidesData_ridesBuilder b) updates]) = _$GGetRidesData_rides;

  static void _initializeBuilder(GGetRidesData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get destination;
  String? get estimatedDistance;
  String? get duration;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get exactPickupLocation;
  String? get exactDropOffLocation;
  int? get routeIndex;
  String? get status;
  GGetRidesData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  GGetRidesData_rides_car? get car;
  BuiltList<GGetRidesData_rides_users>? get users;
  static Serializer<GGetRidesData_rides> get serializer =>
      _$gGetRidesDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesData_rides.serializer,
        json,
      );
}

abstract class GGetRidesData_rides_seat
    implements
        Built<GGetRidesData_rides_seat, GGetRidesData_rides_seatBuilder> {
  GGetRidesData_rides_seat._();

  factory GGetRidesData_rides_seat(
          [Function(GGetRidesData_rides_seatBuilder b) updates]) =
      _$GGetRidesData_rides_seat;

  static void _initializeBuilder(GGetRidesData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetRidesData_rides_seat> get serializer =>
      _$gGetRidesDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesData_rides_seat? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesData_rides_seat.serializer,
        json,
      );
}

abstract class GGetRidesData_rides_car
    implements Built<GGetRidesData_rides_car, GGetRidesData_rides_carBuilder> {
  GGetRidesData_rides_car._();

  factory GGetRidesData_rides_car(
          [Function(GGetRidesData_rides_carBuilder b) updates]) =
      _$GGetRidesData_rides_car;

  static void _initializeBuilder(GGetRidesData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get color;
  String get model;
  String get ownerId;
  String get id;
  GGetRidesData_rides_car_owner? get owner;
  static Serializer<GGetRidesData_rides_car> get serializer =>
      _$gGetRidesDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesData_rides_car? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesData_rides_car.serializer,
        json,
      );
}

abstract class GGetRidesData_rides_car_owner
    implements
        Built<GGetRidesData_rides_car_owner,
            GGetRidesData_rides_car_ownerBuilder> {
  GGetRidesData_rides_car_owner._();

  factory GGetRidesData_rides_car_owner(
          [Function(GGetRidesData_rides_car_ownerBuilder b) updates]) =
      _$GGetRidesData_rides_car_owner;

  static void _initializeBuilder(GGetRidesData_rides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get firstName;
  String? get userName;
  String get profilePictureDataUrl;
  double get averageRating;
  int get tripsCreated;
  int get tripsCompleted;
  int get tripsCancelled;
  static Serializer<GGetRidesData_rides_car_owner> get serializer =>
      _$gGetRidesDataRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesData_rides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesData_rides_car_owner? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesData_rides_car_owner.serializer,
        json,
      );
}

abstract class GGetRidesData_rides_users
    implements
        Built<GGetRidesData_rides_users, GGetRidesData_rides_usersBuilder> {
  GGetRidesData_rides_users._();

  factory GGetRidesData_rides_users(
          [Function(GGetRidesData_rides_usersBuilder b) updates]) =
      _$GGetRidesData_rides_users;

  static void _initializeBuilder(GGetRidesData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetRidesData_rides_users_user? get user;
  static Serializer<GGetRidesData_rides_users> get serializer =>
      _$gGetRidesDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesData_rides_users? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesData_rides_users.serializer,
        json,
      );
}

abstract class GGetRidesData_rides_users_user
    implements
        Built<GGetRidesData_rides_users_user,
            GGetRidesData_rides_users_userBuilder> {
  GGetRidesData_rides_users_user._();

  factory GGetRidesData_rides_users_user(
          [Function(GGetRidesData_rides_users_userBuilder b) updates]) =
      _$GGetRidesData_rides_users_user;

  static void _initializeBuilder(GGetRidesData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetRidesData_rides_users_user> get serializer =>
      _$gGetRidesDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesData_rides_users_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesData_rides_users_user.serializer,
        json,
      );
}

abstract class GGetLatestRidesData
    implements Built<GGetLatestRidesData, GGetLatestRidesDataBuilder> {
  GGetLatestRidesData._();

  factory GGetLatestRidesData(
      [Function(GGetLatestRidesDataBuilder b) updates]) = _$GGetLatestRidesData;

  static void _initializeBuilder(GGetLatestRidesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetLatestRidesData_latestRides> get latestRides;
  static Serializer<GGetLatestRidesData> get serializer =>
      _$gGetLatestRidesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesData.serializer,
        json,
      );
}

abstract class GGetLatestRidesData_latestRides
    implements
        Built<GGetLatestRidesData_latestRides,
            GGetLatestRidesData_latestRidesBuilder> {
  GGetLatestRidesData_latestRides._();

  factory GGetLatestRidesData_latestRides(
          [Function(GGetLatestRidesData_latestRidesBuilder b) updates]) =
      _$GGetLatestRidesData_latestRides;

  static void _initializeBuilder(GGetLatestRidesData_latestRidesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get destination;
  String? get estimatedDistance;
  String? get duration;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get exactPickupLocation;
  int? get routeIndex;
  String? get status;
  GGetLatestRidesData_latestRides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  GGetLatestRidesData_latestRides_car? get car;
  BuiltList<GGetLatestRidesData_latestRides_users>? get users;
  static Serializer<GGetLatestRidesData_latestRides> get serializer =>
      _$gGetLatestRidesDataLatestRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesData_latestRides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesData_latestRides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesData_latestRides.serializer,
        json,
      );
}

abstract class GGetLatestRidesData_latestRides_seat
    implements
        Built<GGetLatestRidesData_latestRides_seat,
            GGetLatestRidesData_latestRides_seatBuilder> {
  GGetLatestRidesData_latestRides_seat._();

  factory GGetLatestRidesData_latestRides_seat(
          [Function(GGetLatestRidesData_latestRides_seatBuilder b) updates]) =
      _$GGetLatestRidesData_latestRides_seat;

  static void _initializeBuilder(
          GGetLatestRidesData_latestRides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetLatestRidesData_latestRides_seat> get serializer =>
      _$gGetLatestRidesDataLatestRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesData_latestRides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesData_latestRides_seat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesData_latestRides_seat.serializer,
        json,
      );
}

abstract class GGetLatestRidesData_latestRides_car
    implements
        Built<GGetLatestRidesData_latestRides_car,
            GGetLatestRidesData_latestRides_carBuilder> {
  GGetLatestRidesData_latestRides_car._();

  factory GGetLatestRidesData_latestRides_car(
          [Function(GGetLatestRidesData_latestRides_carBuilder b) updates]) =
      _$GGetLatestRidesData_latestRides_car;

  static void _initializeBuilder(
          GGetLatestRidesData_latestRides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get color;
  String get model;
  String get ownerId;
  String get id;
  GGetLatestRidesData_latestRides_car_owner? get owner;
  static Serializer<GGetLatestRidesData_latestRides_car> get serializer =>
      _$gGetLatestRidesDataLatestRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesData_latestRides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesData_latestRides_car? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesData_latestRides_car.serializer,
        json,
      );
}

abstract class GGetLatestRidesData_latestRides_car_owner
    implements
        Built<GGetLatestRidesData_latestRides_car_owner,
            GGetLatestRidesData_latestRides_car_ownerBuilder> {
  GGetLatestRidesData_latestRides_car_owner._();

  factory GGetLatestRidesData_latestRides_car_owner(
      [Function(GGetLatestRidesData_latestRides_car_ownerBuilder b)
          updates]) = _$GGetLatestRidesData_latestRides_car_owner;

  static void _initializeBuilder(
          GGetLatestRidesData_latestRides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get firstName;
  String? get userName;
  String get profilePictureDataUrl;
  double get averageRating;
  int get tripsCreated;
  int get tripsCompleted;
  int get tripsCancelled;
  static Serializer<GGetLatestRidesData_latestRides_car_owner> get serializer =>
      _$gGetLatestRidesDataLatestRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesData_latestRides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesData_latestRides_car_owner? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesData_latestRides_car_owner.serializer,
        json,
      );
}

abstract class GGetLatestRidesData_latestRides_users
    implements
        Built<GGetLatestRidesData_latestRides_users,
            GGetLatestRidesData_latestRides_usersBuilder> {
  GGetLatestRidesData_latestRides_users._();

  factory GGetLatestRidesData_latestRides_users(
          [Function(GGetLatestRidesData_latestRides_usersBuilder b) updates]) =
      _$GGetLatestRidesData_latestRides_users;

  static void _initializeBuilder(
          GGetLatestRidesData_latestRides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetLatestRidesData_latestRides_users_user? get user;
  static Serializer<GGetLatestRidesData_latestRides_users> get serializer =>
      _$gGetLatestRidesDataLatestRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesData_latestRides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesData_latestRides_users? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesData_latestRides_users.serializer,
        json,
      );
}

abstract class GGetLatestRidesData_latestRides_users_user
    implements
        Built<GGetLatestRidesData_latestRides_users_user,
            GGetLatestRidesData_latestRides_users_userBuilder> {
  GGetLatestRidesData_latestRides_users_user._();

  factory GGetLatestRidesData_latestRides_users_user(
      [Function(GGetLatestRidesData_latestRides_users_userBuilder b)
          updates]) = _$GGetLatestRidesData_latestRides_users_user;

  static void _initializeBuilder(
          GGetLatestRidesData_latestRides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetLatestRidesData_latestRides_users_user>
      get serializer => _$gGetLatestRidesDataLatestRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetLatestRidesData_latestRides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesData_latestRides_users_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetLatestRidesData_latestRides_users_user.serializer,
        json,
      );
}

abstract class GGetRideInfoData
    implements Built<GGetRideInfoData, GGetRideInfoDataBuilder> {
  GGetRideInfoData._();

  factory GGetRideInfoData([Function(GGetRideInfoDataBuilder b) updates]) =
      _$GGetRideInfoData;

  static void _initializeBuilder(GGetRideInfoDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetRideInfoData_rides> get rides;
  static Serializer<GGetRideInfoData> get serializer =>
      _$gGetRideInfoDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoData.serializer,
        json,
      );
}

abstract class GGetRideInfoData_rides
    implements Built<GGetRideInfoData_rides, GGetRideInfoData_ridesBuilder> {
  GGetRideInfoData_rides._();

  factory GGetRideInfoData_rides(
          [Function(GGetRideInfoData_ridesBuilder b) updates]) =
      _$GGetRideInfoData_rides;

  static void _initializeBuilder(GGetRideInfoData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get placeofStart;
  String? get destination;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  _i2.GDateTime get arrivalTime;
  String? get duration;
  int? get routeIndex;
  String? get exactPickupLocation;
  String? get status;
  GGetRideInfoData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  BuiltList<GGetRideInfoData_rides_users>? get users;
  GGetRideInfoData_rides_car? get car;
  static Serializer<GGetRideInfoData_rides> get serializer =>
      _$gGetRideInfoDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoData_rides.serializer,
        json,
      );
}

abstract class GGetRideInfoData_rides_seat
    implements
        Built<GGetRideInfoData_rides_seat, GGetRideInfoData_rides_seatBuilder> {
  GGetRideInfoData_rides_seat._();

  factory GGetRideInfoData_rides_seat(
          [Function(GGetRideInfoData_rides_seatBuilder b) updates]) =
      _$GGetRideInfoData_rides_seat;

  static void _initializeBuilder(GGetRideInfoData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetRideInfoData_rides_seat> get serializer =>
      _$gGetRideInfoDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoData_rides_seat? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoData_rides_seat.serializer,
        json,
      );
}

abstract class GGetRideInfoData_rides_users
    implements
        Built<GGetRideInfoData_rides_users,
            GGetRideInfoData_rides_usersBuilder> {
  GGetRideInfoData_rides_users._();

  factory GGetRideInfoData_rides_users(
          [Function(GGetRideInfoData_rides_usersBuilder b) updates]) =
      _$GGetRideInfoData_rides_users;

  static void _initializeBuilder(GGetRideInfoData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get userId;
  GGetRideInfoData_rides_users_user? get user;
  static Serializer<GGetRideInfoData_rides_users> get serializer =>
      _$gGetRideInfoDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoData_rides_users? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoData_rides_users.serializer,
        json,
      );
}

abstract class GGetRideInfoData_rides_users_user
    implements
        Built<GGetRideInfoData_rides_users_user,
            GGetRideInfoData_rides_users_userBuilder> {
  GGetRideInfoData_rides_users_user._();

  factory GGetRideInfoData_rides_users_user(
          [Function(GGetRideInfoData_rides_users_userBuilder b) updates]) =
      _$GGetRideInfoData_rides_users_user;

  static void _initializeBuilder(GGetRideInfoData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetRideInfoData_rides_users_user> get serializer =>
      _$gGetRideInfoDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoData_rides_users_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoData_rides_users_user.serializer,
        json,
      );
}

abstract class GGetRideInfoData_rides_car
    implements
        Built<GGetRideInfoData_rides_car, GGetRideInfoData_rides_carBuilder> {
  GGetRideInfoData_rides_car._();

  factory GGetRideInfoData_rides_car(
          [Function(GGetRideInfoData_rides_carBuilder b) updates]) =
      _$GGetRideInfoData_rides_car;

  static void _initializeBuilder(GGetRideInfoData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get color;
  String get model;
  String get ownerId;
  String get id;
  GGetRideInfoData_rides_car_owner? get owner;
  static Serializer<GGetRideInfoData_rides_car> get serializer =>
      _$gGetRideInfoDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoData_rides_car? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoData_rides_car.serializer,
        json,
      );
}

abstract class GGetRideInfoData_rides_car_owner
    implements
        Built<GGetRideInfoData_rides_car_owner,
            GGetRideInfoData_rides_car_ownerBuilder> {
  GGetRideInfoData_rides_car_owner._();

  factory GGetRideInfoData_rides_car_owner(
          [Function(GGetRideInfoData_rides_car_ownerBuilder b) updates]) =
      _$GGetRideInfoData_rides_car_owner;

  static void _initializeBuilder(GGetRideInfoData_rides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get firstName;
  String? get userName;
  String get profilePictureDataUrl;
  double get averageRating;
  int get tripsCreated;
  int get tripsCompleted;
  int get tripsCancelled;
  static Serializer<GGetRideInfoData_rides_car_owner> get serializer =>
      _$gGetRideInfoDataRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideInfoData_rides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoData_rides_car_owner? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideInfoData_rides_car_owner.serializer,
        json,
      );
}

abstract class GGetRideData
    implements Built<GGetRideData, GGetRideDataBuilder> {
  GGetRideData._();

  factory GGetRideData([Function(GGetRideDataBuilder b) updates]) =
      _$GGetRideData;

  static void _initializeBuilder(GGetRideDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetRideData_rides> get rides;
  static Serializer<GGetRideData> get serializer => _$gGetRideDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideData.serializer,
        json,
      );
}

abstract class GGetRideData_rides
    implements Built<GGetRideData_rides, GGetRideData_ridesBuilder> {
  GGetRideData_rides._();

  factory GGetRideData_rides([Function(GGetRideData_ridesBuilder b) updates]) =
      _$GGetRideData_rides;

  static void _initializeBuilder(GGetRideData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get destination;
  String? get estimatedDistance;
  String? get duration;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get exactPickupLocation;
  int? get routeIndex;
  String? get status;
  GGetRideData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  GGetRideData_rides_car? get car;
  BuiltList<GGetRideData_rides_users>? get users;
  static Serializer<GGetRideData_rides> get serializer =>
      _$gGetRideDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideData_rides.serializer,
        json,
      );
}

abstract class GGetRideData_rides_seat
    implements Built<GGetRideData_rides_seat, GGetRideData_rides_seatBuilder> {
  GGetRideData_rides_seat._();

  factory GGetRideData_rides_seat(
          [Function(GGetRideData_rides_seatBuilder b) updates]) =
      _$GGetRideData_rides_seat;

  static void _initializeBuilder(GGetRideData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetRideData_rides_seat> get serializer =>
      _$gGetRideDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideData_rides_seat? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideData_rides_seat.serializer,
        json,
      );
}

abstract class GGetRideData_rides_car
    implements Built<GGetRideData_rides_car, GGetRideData_rides_carBuilder> {
  GGetRideData_rides_car._();

  factory GGetRideData_rides_car(
          [Function(GGetRideData_rides_carBuilder b) updates]) =
      _$GGetRideData_rides_car;

  static void _initializeBuilder(GGetRideData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get color;
  String get model;
  String get ownerId;
  String get id;
  GGetRideData_rides_car_owner? get owner;
  static Serializer<GGetRideData_rides_car> get serializer =>
      _$gGetRideDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideData_rides_car? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideData_rides_car.serializer,
        json,
      );
}

abstract class GGetRideData_rides_car_owner
    implements
        Built<GGetRideData_rides_car_owner,
            GGetRideData_rides_car_ownerBuilder> {
  GGetRideData_rides_car_owner._();

  factory GGetRideData_rides_car_owner(
          [Function(GGetRideData_rides_car_ownerBuilder b) updates]) =
      _$GGetRideData_rides_car_owner;

  static void _initializeBuilder(GGetRideData_rides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get firstName;
  String? get userName;
  String get profilePictureDataUrl;
  double get averageRating;
  int get tripsCreated;
  int get tripsCompleted;
  int get tripsCancelled;
  static Serializer<GGetRideData_rides_car_owner> get serializer =>
      _$gGetRideDataRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideData_rides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideData_rides_car_owner? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideData_rides_car_owner.serializer,
        json,
      );
}

abstract class GGetRideData_rides_users
    implements
        Built<GGetRideData_rides_users, GGetRideData_rides_usersBuilder> {
  GGetRideData_rides_users._();

  factory GGetRideData_rides_users(
          [Function(GGetRideData_rides_usersBuilder b) updates]) =
      _$GGetRideData_rides_users;

  static void _initializeBuilder(GGetRideData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetRideData_rides_users_user? get user;
  static Serializer<GGetRideData_rides_users> get serializer =>
      _$gGetRideDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideData_rides_users? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideData_rides_users.serializer,
        json,
      );
}

abstract class GGetRideData_rides_users_user
    implements
        Built<GGetRideData_rides_users_user,
            GGetRideData_rides_users_userBuilder> {
  GGetRideData_rides_users_user._();

  factory GGetRideData_rides_users_user(
          [Function(GGetRideData_rides_users_userBuilder b) updates]) =
      _$GGetRideData_rides_users_user;

  static void _initializeBuilder(GGetRideData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetRideData_rides_users_user> get serializer =>
      _$gGetRideDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRideData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideData_rides_users_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRideData_rides_users_user.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterData
    implements Built<GGetRidesWithFilterData, GGetRidesWithFilterDataBuilder> {
  GGetRidesWithFilterData._();

  factory GGetRidesWithFilterData(
          [Function(GGetRidesWithFilterDataBuilder b) updates]) =
      _$GGetRidesWithFilterData;

  static void _initializeBuilder(GGetRidesWithFilterDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetRidesWithFilterData_rides> get rides;
  static Serializer<GGetRidesWithFilterData> get serializer =>
      _$gGetRidesWithFilterDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterData.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterData_rides
    implements
        Built<GGetRidesWithFilterData_rides,
            GGetRidesWithFilterData_ridesBuilder> {
  GGetRidesWithFilterData_rides._();

  factory GGetRidesWithFilterData_rides(
          [Function(GGetRidesWithFilterData_ridesBuilder b) updates]) =
      _$GGetRidesWithFilterData_rides;

  static void _initializeBuilder(GGetRidesWithFilterData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get destination;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get duration;
  int? get routeIndex;
  String? get status;
  GGetRidesWithFilterData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  GGetRidesWithFilterData_rides_car? get car;
  BuiltList<GGetRidesWithFilterData_rides_users>? get users;
  static Serializer<GGetRidesWithFilterData_rides> get serializer =>
      _$gGetRidesWithFilterDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterData_rides.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterData_rides_seat
    implements
        Built<GGetRidesWithFilterData_rides_seat,
            GGetRidesWithFilterData_rides_seatBuilder> {
  GGetRidesWithFilterData_rides_seat._();

  factory GGetRidesWithFilterData_rides_seat(
          [Function(GGetRidesWithFilterData_rides_seatBuilder b) updates]) =
      _$GGetRidesWithFilterData_rides_seat;

  static void _initializeBuilder(GGetRidesWithFilterData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetRidesWithFilterData_rides_seat> get serializer =>
      _$gGetRidesWithFilterDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterData_rides_seat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterData_rides_seat.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterData_rides_car
    implements
        Built<GGetRidesWithFilterData_rides_car,
            GGetRidesWithFilterData_rides_carBuilder> {
  GGetRidesWithFilterData_rides_car._();

  factory GGetRidesWithFilterData_rides_car(
          [Function(GGetRidesWithFilterData_rides_carBuilder b) updates]) =
      _$GGetRidesWithFilterData_rides_car;

  static void _initializeBuilder(GGetRidesWithFilterData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get id;
  GGetRidesWithFilterData_rides_car_owner? get owner;
  static Serializer<GGetRidesWithFilterData_rides_car> get serializer =>
      _$gGetRidesWithFilterDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterData_rides_car? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterData_rides_car.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterData_rides_car_owner
    implements
        Built<GGetRidesWithFilterData_rides_car_owner,
            GGetRidesWithFilterData_rides_car_ownerBuilder> {
  GGetRidesWithFilterData_rides_car_owner._();

  factory GGetRidesWithFilterData_rides_car_owner(
      [Function(GGetRidesWithFilterData_rides_car_ownerBuilder b)
          updates]) = _$GGetRidesWithFilterData_rides_car_owner;

  static void _initializeBuilder(
          GGetRidesWithFilterData_rides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get firstName;
  String? get userName;
  String get profilePictureDataUrl;
  double get averageRating;
  int get tripsCreated;
  int get tripsCompleted;
  int get tripsCancelled;
  static Serializer<GGetRidesWithFilterData_rides_car_owner> get serializer =>
      _$gGetRidesWithFilterDataRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterData_rides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterData_rides_car_owner? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterData_rides_car_owner.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterData_rides_users
    implements
        Built<GGetRidesWithFilterData_rides_users,
            GGetRidesWithFilterData_rides_usersBuilder> {
  GGetRidesWithFilterData_rides_users._();

  factory GGetRidesWithFilterData_rides_users(
          [Function(GGetRidesWithFilterData_rides_usersBuilder b) updates]) =
      _$GGetRidesWithFilterData_rides_users;

  static void _initializeBuilder(
          GGetRidesWithFilterData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetRidesWithFilterData_rides_users_user? get user;
  static Serializer<GGetRidesWithFilterData_rides_users> get serializer =>
      _$gGetRidesWithFilterDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterData_rides_users? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterData_rides_users.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterData_rides_users_user
    implements
        Built<GGetRidesWithFilterData_rides_users_user,
            GGetRidesWithFilterData_rides_users_userBuilder> {
  GGetRidesWithFilterData_rides_users_user._();

  factory GGetRidesWithFilterData_rides_users_user(
      [Function(GGetRidesWithFilterData_rides_users_userBuilder b)
          updates]) = _$GGetRidesWithFilterData_rides_users_user;

  static void _initializeBuilder(
          GGetRidesWithFilterData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetRidesWithFilterData_rides_users_user> get serializer =>
      _$gGetRidesWithFilterDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRidesWithFilterData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterData_rides_users_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRidesWithFilterData_rides_users_user.serializer,
        json,
      );
}

abstract class GGetDestinationRidesData
    implements
        Built<GGetDestinationRidesData, GGetDestinationRidesDataBuilder> {
  GGetDestinationRidesData._();

  factory GGetDestinationRidesData(
          [Function(GGetDestinationRidesDataBuilder b) updates]) =
      _$GGetDestinationRidesData;

  static void _initializeBuilder(GGetDestinationRidesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetDestinationRidesData_rides> get rides;
  static Serializer<GGetDestinationRidesData> get serializer =>
      _$gGetDestinationRidesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesData.serializer,
        json,
      );
}

abstract class GGetDestinationRidesData_rides
    implements
        Built<GGetDestinationRidesData_rides,
            GGetDestinationRidesData_ridesBuilder> {
  GGetDestinationRidesData_rides._();

  factory GGetDestinationRidesData_rides(
          [Function(GGetDestinationRidesData_ridesBuilder b) updates]) =
      _$GGetDestinationRidesData_rides;

  static void _initializeBuilder(GGetDestinationRidesData_ridesBuilder b) =>
      b..G__typename = 'Ride';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get allowedBehDesc;
  int get id;
  String? get name;
  _i2.GDateTime get departureDate;
  _i2.GTimeSpan? get departureTime;
  String? get destination;
  String? get duration;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String? get placeofStart;
  String? get status;
  GGetDestinationRidesData_rides_seat? get seat;
  double get totalPay;
  double get maxTotalPay;
  int get seatCount;
  int get seatCapacity;
  double get estimatePrice;
  GGetDestinationRidesData_rides_car? get car;
  BuiltList<GGetDestinationRidesData_rides_users>? get users;
  static Serializer<GGetDestinationRidesData_rides> get serializer =>
      _$gGetDestinationRidesDataRidesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesData_rides.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesData_rides? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesData_rides.serializer,
        json,
      );
}

abstract class GGetDestinationRidesData_rides_seat
    implements
        Built<GGetDestinationRidesData_rides_seat,
            GGetDestinationRidesData_rides_seatBuilder> {
  GGetDestinationRidesData_rides_seat._();

  factory GGetDestinationRidesData_rides_seat(
          [Function(GGetDestinationRidesData_rides_seatBuilder b) updates]) =
      _$GGetDestinationRidesData_rides_seat;

  static void _initializeBuilder(
          GGetDestinationRidesData_rides_seatBuilder b) =>
      b..G__typename = 'Seat';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get backLeft;
  String? get frontLeft;
  String? get backCentre;
  String? get backRight;
  String? get middleLeft;
  String? get middleRight;
  String? get middleCentre;
  static Serializer<GGetDestinationRidesData_rides_seat> get serializer =>
      _$gGetDestinationRidesDataRidesSeatSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesData_rides_seat.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesData_rides_seat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesData_rides_seat.serializer,
        json,
      );
}

abstract class GGetDestinationRidesData_rides_car
    implements
        Built<GGetDestinationRidesData_rides_car,
            GGetDestinationRidesData_rides_carBuilder> {
  GGetDestinationRidesData_rides_car._();

  factory GGetDestinationRidesData_rides_car(
          [Function(GGetDestinationRidesData_rides_carBuilder b) updates]) =
      _$GGetDestinationRidesData_rides_car;

  static void _initializeBuilder(GGetDestinationRidesData_rides_carBuilder b) =>
      b..G__typename = 'Car';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get licensePlate;
  String get imageUrl;
  String get id;
  GGetDestinationRidesData_rides_car_owner? get owner;
  static Serializer<GGetDestinationRidesData_rides_car> get serializer =>
      _$gGetDestinationRidesDataRidesCarSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesData_rides_car.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesData_rides_car? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesData_rides_car.serializer,
        json,
      );
}

abstract class GGetDestinationRidesData_rides_car_owner
    implements
        Built<GGetDestinationRidesData_rides_car_owner,
            GGetDestinationRidesData_rides_car_ownerBuilder> {
  GGetDestinationRidesData_rides_car_owner._();

  factory GGetDestinationRidesData_rides_car_owner(
      [Function(GGetDestinationRidesData_rides_car_ownerBuilder b)
          updates]) = _$GGetDestinationRidesData_rides_car_owner;

  static void _initializeBuilder(
          GGetDestinationRidesData_rides_car_ownerBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get firstName;
  String? get id;
  static Serializer<GGetDestinationRidesData_rides_car_owner> get serializer =>
      _$gGetDestinationRidesDataRidesCarOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesData_rides_car_owner.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesData_rides_car_owner? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesData_rides_car_owner.serializer,
        json,
      );
}

abstract class GGetDestinationRidesData_rides_users
    implements
        Built<GGetDestinationRidesData_rides_users,
            GGetDestinationRidesData_rides_usersBuilder> {
  GGetDestinationRidesData_rides_users._();

  factory GGetDestinationRidesData_rides_users(
          [Function(GGetDestinationRidesData_rides_usersBuilder b) updates]) =
      _$GGetDestinationRidesData_rides_users;

  static void _initializeBuilder(
          GGetDestinationRidesData_rides_usersBuilder b) =>
      b..G__typename = 'UserRides';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetDestinationRidesData_rides_users_user? get user;
  static Serializer<GGetDestinationRidesData_rides_users> get serializer =>
      _$gGetDestinationRidesDataRidesUsersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesData_rides_users.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesData_rides_users? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesData_rides_users.serializer,
        json,
      );
}

abstract class GGetDestinationRidesData_rides_users_user
    implements
        Built<GGetDestinationRidesData_rides_users_user,
            GGetDestinationRidesData_rides_users_userBuilder> {
  GGetDestinationRidesData_rides_users_user._();

  factory GGetDestinationRidesData_rides_users_user(
      [Function(GGetDestinationRidesData_rides_users_userBuilder b)
          updates]) = _$GGetDestinationRidesData_rides_users_user;

  static void _initializeBuilder(
          GGetDestinationRidesData_rides_users_userBuilder b) =>
      b..G__typename = 'SafiriCarUser';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get userName;
  String get profilePictureDataUrl;
  static Serializer<GGetDestinationRidesData_rides_users_user> get serializer =>
      _$gGetDestinationRidesDataRidesUsersUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDestinationRidesData_rides_users_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesData_rides_users_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDestinationRidesData_rides_users_user.serializer,
        json,
      );
}

abstract class GOnGetMessageData
    implements Built<GOnGetMessageData, GOnGetMessageDataBuilder> {
  GOnGetMessageData._();

  factory GOnGetMessageData([Function(GOnGetMessageDataBuilder b) updates]) =
      _$GOnGetMessageData;

  static void _initializeBuilder(GOnGetMessageDataBuilder b) =>
      b..G__typename = 'Subscription';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GOnGetMessageData_onGetMessage get onGetMessage;
  static Serializer<GOnGetMessageData> get serializer =>
      _$gOnGetMessageDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOnGetMessageData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOnGetMessageData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOnGetMessageData.serializer,
        json,
      );
}

abstract class GOnGetMessageData_onGetMessage
    implements
        Built<GOnGetMessageData_onGetMessage,
            GOnGetMessageData_onGetMessageBuilder> {
  GOnGetMessageData_onGetMessage._();

  factory GOnGetMessageData_onGetMessage(
          [Function(GOnGetMessageData_onGetMessageBuilder b) updates]) =
      _$GOnGetMessageData_onGetMessage;

  static void _initializeBuilder(GOnGetMessageData_onGetMessageBuilder b) =>
      b..G__typename = 'PamrideMessage';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get to;
  String? get from;
  String? get message;
  String? get topic;
  _i2.GDateTime? get dateSend;
  static Serializer<GOnGetMessageData_onGetMessage> get serializer =>
      _$gOnGetMessageDataOnGetMessageSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOnGetMessageData_onGetMessage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOnGetMessageData_onGetMessage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOnGetMessageData_onGetMessage.serializer,
        json,
      );
}
