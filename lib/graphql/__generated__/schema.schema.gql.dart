// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;
import 'package:pamride/graphql/__generated__/serializers.gql.dart' as _i2;

part 'schema.schema.gql.g.dart';

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i1.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime((serialized as String?)));
}

abstract class GSafiriCarUserFilterInput
    implements
        Built<GSafiriCarUserFilterInput, GSafiriCarUserFilterInputBuilder> {
  GSafiriCarUserFilterInput._();

  factory GSafiriCarUserFilterInput(
          [Function(GSafiriCarUserFilterInputBuilder b) updates]) =
      _$GSafiriCarUserFilterInput;

  BuiltList<GSafiriCarUserFilterInput>? get and;
  BuiltList<GSafiriCarUserFilterInput>? get or;
  GStringOperationFilterInput? get firstName;
  GStringOperationFilterInput? get lastName;
  GStringOperationFilterInput? get nationalId;
  GListFilterInputTypeOfCarFilterInput? get ownedCars;
  GStringOperationFilterInput? get createdBy;
  GStringOperationFilterInput? get profilePictureDataUrl;
  GStringOperationFilterInput? get referalCode;
  GIdentificationDocumentFilterInput? get identificationDocument;
  GComparableNullableOfDateTimeOperationFilterInput? get createdOn;
  GStringOperationFilterInput? get lastModifiedBy;
  GComparableNullableOfDateTimeOperationFilterInput? get lastModifiedOn;
  GBooleanOperationFilterInput? get isDeleted;
  GComparableNullableOfDateTimeOperationFilterInput? get deletedOn;
  GBooleanOperationFilterInput? get isActive;
  GStringOperationFilterInput? get refreshToken;
  GStringOperationFilterInput? get role;
  GComparableNullableOfDateTimeOperationFilterInput? get refreshTokenExpiryTime;
  GComparableInt32OperationFilterInput? get totalRating;
  GComparableDoubleOperationFilterInput? get averageRating;
  GComparableInt32OperationFilterInput? get tripsCreated;
  GComparableInt32OperationFilterInput? get tripsCompleted;
  GComparableInt32OperationFilterInput? get tripsCancelled;
  GBooleanOperationFilterInput? get isVerified;
  GStringOperationFilterInput? get aboutMe;
  GComparableSingleOperationFilterInput? get loyaltyPoints;
  GLocationFilterInput? get location;
  GDeviceFilterInput? get device;
  GListFilterInputTypeOfUserRidesFilterInput? get rides;
  GListFilterInputTypeOfUserRatingFilterInput? get userRatings;
  GListFilterInputTypeOfFrequentRouteFilterInput? get frequentRoutes;
  GListFilterInputTypeOfSafiriCarUserFilterInput? get userReferals;
  GStringOperationFilterInput? get id;
  GStringOperationFilterInput? get userName;
  GStringOperationFilterInput? get normalizedUserName;
  GStringOperationFilterInput? get email;
  GStringOperationFilterInput? get normalizedEmail;
  GBooleanOperationFilterInput? get emailConfirmed;
  GStringOperationFilterInput? get passwordHash;
  GStringOperationFilterInput? get securityStamp;
  GStringOperationFilterInput? get concurrencyStamp;
  GStringOperationFilterInput? get phoneNumber;
  GBooleanOperationFilterInput? get phoneNumberConfirmed;
  GBooleanOperationFilterInput? get twoFactorEnabled;
  GComparableNullableOfDateTimeOffsetOperationFilterInput? get lockoutEnd;
  GBooleanOperationFilterInput? get lockoutEnabled;
  GComparableInt32OperationFilterInput? get accessFailedCount;
  static Serializer<GSafiriCarUserFilterInput> get serializer =>
      _$gSafiriCarUserFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSafiriCarUserFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSafiriCarUserFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSafiriCarUserFilterInput.serializer,
        json,
      );
}

abstract class GSafiriCarUserSortInput
    implements Built<GSafiriCarUserSortInput, GSafiriCarUserSortInputBuilder> {
  GSafiriCarUserSortInput._();

  factory GSafiriCarUserSortInput(
          [Function(GSafiriCarUserSortInputBuilder b) updates]) =
      _$GSafiriCarUserSortInput;

  GSortEnumType? get firstName;
  GSortEnumType? get lastName;
  GSortEnumType? get nationalId;
  GSortEnumType? get createdBy;
  GSortEnumType? get profilePictureDataUrl;
  GSortEnumType? get referalCode;
  GIdentificationDocumentSortInput? get identificationDocument;
  GSortEnumType? get createdOn;
  GSortEnumType? get lastModifiedBy;
  GSortEnumType? get lastModifiedOn;
  GSortEnumType? get isDeleted;
  GSortEnumType? get deletedOn;
  GSortEnumType? get isActive;
  GSortEnumType? get refreshToken;
  GSortEnumType? get role;
  GSortEnumType? get refreshTokenExpiryTime;
  GSortEnumType? get totalRating;
  GSortEnumType? get averageRating;
  GSortEnumType? get tripsCreated;
  GSortEnumType? get tripsCompleted;
  GSortEnumType? get tripsCancelled;
  GSortEnumType? get isVerified;
  GSortEnumType? get aboutMe;
  GSortEnumType? get loyaltyPoints;
  GLocationSortInput? get location;
  GDeviceSortInput? get device;
  GSortEnumType? get id;
  GSortEnumType? get userName;
  GSortEnumType? get normalizedUserName;
  GSortEnumType? get email;
  GSortEnumType? get normalizedEmail;
  GSortEnumType? get emailConfirmed;
  GSortEnumType? get passwordHash;
  GSortEnumType? get securityStamp;
  GSortEnumType? get concurrencyStamp;
  GSortEnumType? get phoneNumber;
  GSortEnumType? get phoneNumberConfirmed;
  GSortEnumType? get twoFactorEnabled;
  GSortEnumType? get lockoutEnd;
  GSortEnumType? get lockoutEnabled;
  GSortEnumType? get accessFailedCount;
  static Serializer<GSafiriCarUserSortInput> get serializer =>
      _$gSafiriCarUserSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSafiriCarUserSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSafiriCarUserSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSafiriCarUserSortInput.serializer,
        json,
      );
}

abstract class GLocationFilterInput
    implements Built<GLocationFilterInput, GLocationFilterInputBuilder> {
  GLocationFilterInput._();

  factory GLocationFilterInput(
          [Function(GLocationFilterInputBuilder b) updates]) =
      _$GLocationFilterInput;

  BuiltList<GLocationFilterInput>? get and;
  BuiltList<GLocationFilterInput>? get or;
  GComparableInt32OperationFilterInput? get id;
  GStringOperationFilterInput? get town;
  GBooleanOperationFilterInput? get isPopular;
  GCountryFilterInput? get country;
  GComparableNullableOfDateTimeOperationFilterInput? get createdOn;
  GStringOperationFilterInput? get createdBy;
  GComparableNullableOfDateTimeOperationFilterInput? get lastModifiedOn;
  GStringOperationFilterInput? get lastModifiedBy;
  static Serializer<GLocationFilterInput> get serializer =>
      _$gLocationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GLocationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLocationFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GLocationFilterInput.serializer,
        json,
      );
}

abstract class GLocationSortInput
    implements Built<GLocationSortInput, GLocationSortInputBuilder> {
  GLocationSortInput._();

  factory GLocationSortInput([Function(GLocationSortInputBuilder b) updates]) =
      _$GLocationSortInput;

  GSortEnumType? get id;
  GSortEnumType? get town;
  GSortEnumType? get isPopular;
  GCountrySortInput? get country;
  GSortEnumType? get createdOn;
  GSortEnumType? get createdBy;
  GSortEnumType? get lastModifiedOn;
  GSortEnumType? get lastModifiedBy;
  static Serializer<GLocationSortInput> get serializer =>
      _$gLocationSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GLocationSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLocationSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GLocationSortInput.serializer,
        json,
      );
}

abstract class GAPIRequestFilterInput
    implements Built<GAPIRequestFilterInput, GAPIRequestFilterInputBuilder> {
  GAPIRequestFilterInput._();

  factory GAPIRequestFilterInput(
          [Function(GAPIRequestFilterInputBuilder b) updates]) =
      _$GAPIRequestFilterInput;

  BuiltList<GAPIRequestFilterInput>? get and;
  BuiltList<GAPIRequestFilterInput>? get or;
  GStringOperationFilterInput? get id;
  GStringOperationFilterInput? get iPAddress;
  GStringOperationFilterInput? get uAString;
  GStringOperationFilterInput? get languages;
  GStringOperationFilterInput? get path;
  GComparableInt32OperationFilterInput? get statusCode;
  GComparableDateTimeOperationFilterInput? get createdOn;
  static Serializer<GAPIRequestFilterInput> get serializer =>
      _$gAPIRequestFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GAPIRequestFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAPIRequestFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GAPIRequestFilterInput.serializer,
        json,
      );
}

abstract class GAPIRequestSortInput
    implements Built<GAPIRequestSortInput, GAPIRequestSortInputBuilder> {
  GAPIRequestSortInput._();

  factory GAPIRequestSortInput(
          [Function(GAPIRequestSortInputBuilder b) updates]) =
      _$GAPIRequestSortInput;

  GSortEnumType? get id;
  GSortEnumType? get iPAddress;
  GSortEnumType? get uAString;
  GSortEnumType? get languages;
  GSortEnumType? get path;
  GSortEnumType? get statusCode;
  GSortEnumType? get createdOn;
  static Serializer<GAPIRequestSortInput> get serializer =>
      _$gAPIRequestSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GAPIRequestSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAPIRequestSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GAPIRequestSortInput.serializer,
        json,
      );
}

abstract class GRideFilterInput
    implements Built<GRideFilterInput, GRideFilterInputBuilder> {
  GRideFilterInput._();

  factory GRideFilterInput([Function(GRideFilterInputBuilder b) updates]) =
      _$GRideFilterInput;

  BuiltList<GRideFilterInput>? get and;
  BuiltList<GRideFilterInput>? get or;
  GComparableInt32OperationFilterInput? get id;
  GStringOperationFilterInput? get name;
  GStringOperationFilterInput? get placeofStart;
  GStringOperationFilterInput? get destination;
  GStringOperationFilterInput? get driverId;
  GComparableSingleOperationFilterInput? get estimatePrice;
  GStringOperationFilterInput? get estimatedDistance;
  GComparableInt32OperationFilterInput? get numberOfPeople;
  GComparableInt32OperationFilterInput? get maximumCarryWeight;
  GComparableDateTimeOperationFilterInput? get departureDate;
  GStringOperationFilterInput? get duration;
  GStringOperationFilterInput? get status;
  GSeatFilterInput? get seat;
  GComparableInt32OperationFilterInput? get seatCount;
  GComparableInt32OperationFilterInput? get seatCapacity;
  GComparableSingleOperationFilterInput? get maxTotalPay;
  GComparableSingleOperationFilterInput? get totalPay;
  GComparableDecimalOperationFilterInput? get amountCashedOut;
  GComparableNullableOfTimeSpanOperationFilterInput? get departureTime;
  GComparableDateTimeOperationFilterInput? get arrivalTime;
  GStringOperationFilterInput? get allowedBehDesc;
  GStringOperationFilterInput? get exactPickupLocation;
  GComparableNullableOfInt32OperationFilterInput? get routeIndex;
  GStringOperationFilterInput? get mpesaReceiptNumber;
  GComparableDateTimeOperationFilterInput? get transactionDate;
  GStringOperationFilterInput? get merchantRequestId;
  GStringOperationFilterInput? get checkoutRequestId;
  GComparableSingleOperationFilterInput? get compensatedFromPassengerCancel;
  GComparableNullableOfDateTimeOperationFilterInput? get driverPaymentTime;
  GStringOperationFilterInput? get exactDropOffLocation;
  GBooleanOperationFilterInput? get isRecurring;
  GStringOperationFilterInput? get carId;
  GCarFilterInput? get car;
  GListFilterInputTypeOfUserRidesFilterInput? get users;
  GListFilterInputTypeOfRideTransactionFilterInput? get transactions;
  static Serializer<GRideFilterInput> get serializer =>
      _$gRideFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRideFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRideFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRideFilterInput.serializer,
        json,
      );
}

abstract class GRideSortInput
    implements Built<GRideSortInput, GRideSortInputBuilder> {
  GRideSortInput._();

  factory GRideSortInput([Function(GRideSortInputBuilder b) updates]) =
      _$GRideSortInput;

  GSortEnumType? get id;
  GSortEnumType? get name;
  GSortEnumType? get placeofStart;
  GSortEnumType? get destination;
  GSortEnumType? get driverId;
  GSortEnumType? get estimatePrice;
  GSortEnumType? get estimatedDistance;
  GSortEnumType? get numberOfPeople;
  GSortEnumType? get maximumCarryWeight;
  GSortEnumType? get departureDate;
  GSortEnumType? get duration;
  GSortEnumType? get status;
  GSeatSortInput? get seat;
  GSortEnumType? get seatCount;
  GSortEnumType? get seatCapacity;
  GSortEnumType? get maxTotalPay;
  GSortEnumType? get totalPay;
  GSortEnumType? get amountCashedOut;
  GSortEnumType? get departureTime;
  GSortEnumType? get arrivalTime;
  GSortEnumType? get allowedBehDesc;
  GSortEnumType? get exactPickupLocation;
  GSortEnumType? get routeIndex;
  GSortEnumType? get mpesaReceiptNumber;
  GSortEnumType? get transactionDate;
  GSortEnumType? get merchantRequestId;
  GSortEnumType? get checkoutRequestId;
  GSortEnumType? get compensatedFromPassengerCancel;
  GSortEnumType? get driverPaymentTime;
  GSortEnumType? get exactDropOffLocation;
  GSortEnumType? get isRecurring;
  GSortEnumType? get carId;
  GCarSortInput? get car;
  static Serializer<GRideSortInput> get serializer =>
      _$gRideSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRideSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRideSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRideSortInput.serializer,
        json,
      );
}

abstract class GUserRidesFilterInput
    implements Built<GUserRidesFilterInput, GUserRidesFilterInputBuilder> {
  GUserRidesFilterInput._();

  factory GUserRidesFilterInput(
          [Function(GUserRidesFilterInputBuilder b) updates]) =
      _$GUserRidesFilterInput;

  BuiltList<GUserRidesFilterInput>? get and;
  BuiltList<GUserRidesFilterInput>? get or;
  GStringOperationFilterInput? get userId;
  GSafiriCarUserFilterInput? get user;
  GComparableInt32OperationFilterInput? get rideId;
  GRideFilterInput? get ride;
  GListFilterInputTypeOfRideTransactionFilterInput? get transactions;
  static Serializer<GUserRidesFilterInput> get serializer =>
      _$gUserRidesFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUserRidesFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserRidesFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUserRidesFilterInput.serializer,
        json,
      );
}

abstract class GUserRidesSortInput
    implements Built<GUserRidesSortInput, GUserRidesSortInputBuilder> {
  GUserRidesSortInput._();

  factory GUserRidesSortInput(
      [Function(GUserRidesSortInputBuilder b) updates]) = _$GUserRidesSortInput;

  GSortEnumType? get userId;
  GSafiriCarUserSortInput? get user;
  GSortEnumType? get rideId;
  GRideSortInput? get ride;
  static Serializer<GUserRidesSortInput> get serializer =>
      _$gUserRidesSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUserRidesSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserRidesSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUserRidesSortInput.serializer,
        json,
      );
}

abstract class GRideTransactionFilterInput
    implements
        Built<GRideTransactionFilterInput, GRideTransactionFilterInputBuilder> {
  GRideTransactionFilterInput._();

  factory GRideTransactionFilterInput(
          [Function(GRideTransactionFilterInputBuilder b) updates]) =
      _$GRideTransactionFilterInput;

  BuiltList<GRideTransactionFilterInput>? get and;
  BuiltList<GRideTransactionFilterInput>? get or;
  GStringOperationFilterInput? get id;
  GStringOperationFilterInput? get phoneNumber;
  GComparableSingleOperationFilterInput? get amount;
  GBooleanOperationFilterInput? get isReversed;
  GStringOperationFilterInput? get status;
  GComparableInt32OperationFilterInput? get bookedRideId;
  GStringOperationFilterInput? get passengerId;
  GStringOperationFilterInput? get driverId;
  GStringOperationFilterInput? get transactionCode;
  GStringOperationFilterInput? get merchantRequestId;
  GStringOperationFilterInput? get checkoutRequestId;
  GComparableNullableOfDateTimeOperationFilterInput? get transactionDate;
  GComparableNullableOfTimeSpanOperationFilterInput? get transactionTime;
  GComparableDateTimeOperationFilterInput? get approvedDateTime;
  GStringOperationFilterInput? get transactionID;
  GStringOperationFilterInput? get conversationID;
  GStringOperationFilterInput? get originatorConversationID;
  GStringOperationFilterInput? get reversedDate;
  GStringOperationFilterInput? get reversedTime;
  GStringOperationFilterInput? get reseaonForReversal;
  GStringOperationFilterInput? get seatsStr;
  GStringOperationFilterInput? get paymentMethod;
  GStringOperationFilterInput? get exactDropOffLocation;
  static Serializer<GRideTransactionFilterInput> get serializer =>
      _$gRideTransactionFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRideTransactionFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRideTransactionFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRideTransactionFilterInput.serializer,
        json,
      );
}

abstract class GRideTransactionSortInput
    implements
        Built<GRideTransactionSortInput, GRideTransactionSortInputBuilder> {
  GRideTransactionSortInput._();

  factory GRideTransactionSortInput(
          [Function(GRideTransactionSortInputBuilder b) updates]) =
      _$GRideTransactionSortInput;

  GSortEnumType? get id;
  GSortEnumType? get phoneNumber;
  GSortEnumType? get amount;
  GSortEnumType? get isReversed;
  GSortEnumType? get status;
  GSortEnumType? get bookedRideId;
  GSortEnumType? get passengerId;
  GSortEnumType? get driverId;
  GSortEnumType? get transactionCode;
  GSortEnumType? get merchantRequestId;
  GSortEnumType? get checkoutRequestId;
  GSortEnumType? get transactionDate;
  GSortEnumType? get transactionTime;
  GSortEnumType? get approvedDateTime;
  GSortEnumType? get transactionID;
  GSortEnumType? get conversationID;
  GSortEnumType? get originatorConversationID;
  GSortEnumType? get reversedDate;
  GSortEnumType? get reversedTime;
  GSortEnumType? get reseaonForReversal;
  GSortEnumType? get seatsStr;
  GSortEnumType? get paymentMethod;
  GSortEnumType? get exactDropOffLocation;
  static Serializer<GRideTransactionSortInput> get serializer =>
      _$gRideTransactionSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRideTransactionSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRideTransactionSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRideTransactionSortInput.serializer,
        json,
      );
}

abstract class GPamrideMessageFilterInput
    implements
        Built<GPamrideMessageFilterInput, GPamrideMessageFilterInputBuilder> {
  GPamrideMessageFilterInput._();

  factory GPamrideMessageFilterInput(
          [Function(GPamrideMessageFilterInputBuilder b) updates]) =
      _$GPamrideMessageFilterInput;

  BuiltList<GPamrideMessageFilterInput>? get and;
  BuiltList<GPamrideMessageFilterInput>? get or;
  GStringOperationFilterInput? get id;
  GStringOperationFilterInput? get from;
  GStringOperationFilterInput? get to;
  GComparableNullableOfDateTimeOperationFilterInput? get dateSend;
  GStringOperationFilterInput? get message;
  GStringOperationFilterInput? get topic;
  GComparableNullableOfDateTimeOperationFilterInput? get updated;
  GComparableNullableOfTimeSpanOperationFilterInput? get updatedAt;
  static Serializer<GPamrideMessageFilterInput> get serializer =>
      _$gPamrideMessageFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPamrideMessageFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPamrideMessageFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPamrideMessageFilterInput.serializer,
        json,
      );
}

abstract class GPamrideMessageSortInput
    implements
        Built<GPamrideMessageSortInput, GPamrideMessageSortInputBuilder> {
  GPamrideMessageSortInput._();

  factory GPamrideMessageSortInput(
          [Function(GPamrideMessageSortInputBuilder b) updates]) =
      _$GPamrideMessageSortInput;

  GSortEnumType? get id;
  GSortEnumType? get from;
  GSortEnumType? get to;
  GSortEnumType? get dateSend;
  GSortEnumType? get message;
  GSortEnumType? get topic;
  GSortEnumType? get updated;
  GSortEnumType? get updatedAt;
  static Serializer<GPamrideMessageSortInput> get serializer =>
      _$gPamrideMessageSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPamrideMessageSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPamrideMessageSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPamrideMessageSortInput.serializer,
        json,
      );
}

abstract class GCarFilterInput
    implements Built<GCarFilterInput, GCarFilterInputBuilder> {
  GCarFilterInput._();

  factory GCarFilterInput([Function(GCarFilterInputBuilder b) updates]) =
      _$GCarFilterInput;

  BuiltList<GCarFilterInput>? get and;
  BuiltList<GCarFilterInput>? get or;
  GStringOperationFilterInput? get id;
  GStringOperationFilterInput? get color;
  GStringOperationFilterInput? get model;
  GStringOperationFilterInput? get licensePlate;
  GStringOperationFilterInput? get imageUrl;
  GBooleanOperationFilterInput? get active;
  GStringOperationFilterInput? get ownerId;
  GSafiriCarUserFilterInput? get owner;
  GListFilterInputTypeOfRideFilterInput? get rides;
  static Serializer<GCarFilterInput> get serializer =>
      _$gCarFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCarFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCarFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCarFilterInput.serializer,
        json,
      );
}

abstract class GCarSortInput
    implements Built<GCarSortInput, GCarSortInputBuilder> {
  GCarSortInput._();

  factory GCarSortInput([Function(GCarSortInputBuilder b) updates]) =
      _$GCarSortInput;

  GSortEnumType? get id;
  GSortEnumType? get color;
  GSortEnumType? get model;
  GSortEnumType? get licensePlate;
  GSortEnumType? get imageUrl;
  GSortEnumType? get active;
  GSortEnumType? get ownerId;
  GSafiriCarUserSortInput? get owner;
  static Serializer<GCarSortInput> get serializer => _$gCarSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCarSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCarSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCarSortInput.serializer,
        json,
      );
}

abstract class GStringOperationFilterInput
    implements
        Built<GStringOperationFilterInput, GStringOperationFilterInputBuilder> {
  GStringOperationFilterInput._();

  factory GStringOperationFilterInput(
          [Function(GStringOperationFilterInputBuilder b) updates]) =
      _$GStringOperationFilterInput;

  BuiltList<GStringOperationFilterInput>? get and;
  BuiltList<GStringOperationFilterInput>? get or;
  String? get eq;
  String? get neq;
  String? get contains;
  String? get ncontains;
  @BuiltValueField(wireName: 'in')
  BuiltList<String>? get Gin;
  BuiltList<String>? get nin;
  String? get startsWith;
  String? get nstartsWith;
  String? get endsWith;
  String? get nendsWith;
  static Serializer<GStringOperationFilterInput> get serializer =>
      _$gStringOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GStringOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStringOperationFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GStringOperationFilterInput.serializer,
        json,
      );
}

abstract class GListFilterInputTypeOfCarFilterInput
    implements
        Built<GListFilterInputTypeOfCarFilterInput,
            GListFilterInputTypeOfCarFilterInputBuilder> {
  GListFilterInputTypeOfCarFilterInput._();

  factory GListFilterInputTypeOfCarFilterInput(
          [Function(GListFilterInputTypeOfCarFilterInputBuilder b) updates]) =
      _$GListFilterInputTypeOfCarFilterInput;

  GCarFilterInput? get all;
  GCarFilterInput? get none;
  GCarFilterInput? get some;
  bool? get any;
  static Serializer<GListFilterInputTypeOfCarFilterInput> get serializer =>
      _$gListFilterInputTypeOfCarFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GListFilterInputTypeOfCarFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListFilterInputTypeOfCarFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GListFilterInputTypeOfCarFilterInput.serializer,
        json,
      );
}

abstract class GIdentificationDocumentFilterInput
    implements
        Built<GIdentificationDocumentFilterInput,
            GIdentificationDocumentFilterInputBuilder> {
  GIdentificationDocumentFilterInput._();

  factory GIdentificationDocumentFilterInput(
          [Function(GIdentificationDocumentFilterInputBuilder b) updates]) =
      _$GIdentificationDocumentFilterInput;

  BuiltList<GIdentificationDocumentFilterInput>? get and;
  BuiltList<GIdentificationDocumentFilterInput>? get or;
  GComparableInt32OperationFilterInput? get id;
  GStringOperationFilterInput? get nationalIdFront;
  GStringOperationFilterInput? get nationalIdRear;
  GStringOperationFilterInput? get drivingLicenceFront;
  GStringOperationFilterInput? get drivingLicenceRear;
  static Serializer<GIdentificationDocumentFilterInput> get serializer =>
      _$gIdentificationDocumentFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GIdentificationDocumentFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIdentificationDocumentFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GIdentificationDocumentFilterInput.serializer,
        json,
      );
}

abstract class GComparableNullableOfDateTimeOperationFilterInput
    implements
        Built<GComparableNullableOfDateTimeOperationFilterInput,
            GComparableNullableOfDateTimeOperationFilterInputBuilder> {
  GComparableNullableOfDateTimeOperationFilterInput._();

  factory GComparableNullableOfDateTimeOperationFilterInput(
      [Function(GComparableNullableOfDateTimeOperationFilterInputBuilder b)
          updates]) = _$GComparableNullableOfDateTimeOperationFilterInput;

  GDateTime? get eq;
  GDateTime? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<GDateTime>? get Gin;
  BuiltList<GDateTime>? get nin;
  GDateTime? get gt;
  GDateTime? get ngt;
  GDateTime? get gte;
  GDateTime? get ngte;
  GDateTime? get lt;
  GDateTime? get nlt;
  GDateTime? get lte;
  GDateTime? get nlte;
  static Serializer<GComparableNullableOfDateTimeOperationFilterInput>
      get serializer =>
          _$gComparableNullableOfDateTimeOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableNullableOfDateTimeOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableNullableOfDateTimeOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableNullableOfDateTimeOperationFilterInput.serializer,
        json,
      );
}

abstract class GBooleanOperationFilterInput
    implements
        Built<GBooleanOperationFilterInput,
            GBooleanOperationFilterInputBuilder> {
  GBooleanOperationFilterInput._();

  factory GBooleanOperationFilterInput(
          [Function(GBooleanOperationFilterInputBuilder b) updates]) =
      _$GBooleanOperationFilterInput;

  bool? get eq;
  bool? get neq;
  static Serializer<GBooleanOperationFilterInput> get serializer =>
      _$gBooleanOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GBooleanOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBooleanOperationFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GBooleanOperationFilterInput.serializer,
        json,
      );
}

abstract class GComparableInt32OperationFilterInput
    implements
        Built<GComparableInt32OperationFilterInput,
            GComparableInt32OperationFilterInputBuilder> {
  GComparableInt32OperationFilterInput._();

  factory GComparableInt32OperationFilterInput(
          [Function(GComparableInt32OperationFilterInputBuilder b) updates]) =
      _$GComparableInt32OperationFilterInput;

  int? get eq;
  int? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<int>? get Gin;
  BuiltList<int>? get nin;
  int? get gt;
  int? get ngt;
  int? get gte;
  int? get ngte;
  int? get lt;
  int? get nlt;
  int? get lte;
  int? get nlte;
  static Serializer<GComparableInt32OperationFilterInput> get serializer =>
      _$gComparableInt32OperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableInt32OperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableInt32OperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableInt32OperationFilterInput.serializer,
        json,
      );
}

abstract class GComparableDoubleOperationFilterInput
    implements
        Built<GComparableDoubleOperationFilterInput,
            GComparableDoubleOperationFilterInputBuilder> {
  GComparableDoubleOperationFilterInput._();

  factory GComparableDoubleOperationFilterInput(
          [Function(GComparableDoubleOperationFilterInputBuilder b) updates]) =
      _$GComparableDoubleOperationFilterInput;

  double? get eq;
  double? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<double>? get Gin;
  BuiltList<double>? get nin;
  double? get gt;
  double? get ngt;
  double? get gte;
  double? get ngte;
  double? get lt;
  double? get nlt;
  double? get lte;
  double? get nlte;
  static Serializer<GComparableDoubleOperationFilterInput> get serializer =>
      _$gComparableDoubleOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableDoubleOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableDoubleOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableDoubleOperationFilterInput.serializer,
        json,
      );
}

abstract class GComparableSingleOperationFilterInput
    implements
        Built<GComparableSingleOperationFilterInput,
            GComparableSingleOperationFilterInputBuilder> {
  GComparableSingleOperationFilterInput._();

  factory GComparableSingleOperationFilterInput(
          [Function(GComparableSingleOperationFilterInputBuilder b) updates]) =
      _$GComparableSingleOperationFilterInput;

  double? get eq;
  double? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<double>? get Gin;
  BuiltList<double>? get nin;
  double? get gt;
  double? get ngt;
  double? get gte;
  double? get ngte;
  double? get lt;
  double? get nlt;
  double? get lte;
  double? get nlte;
  static Serializer<GComparableSingleOperationFilterInput> get serializer =>
      _$gComparableSingleOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableSingleOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableSingleOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableSingleOperationFilterInput.serializer,
        json,
      );
}

abstract class GDeviceFilterInput
    implements Built<GDeviceFilterInput, GDeviceFilterInputBuilder> {
  GDeviceFilterInput._();

  factory GDeviceFilterInput([Function(GDeviceFilterInputBuilder b) updates]) =
      _$GDeviceFilterInput;

  BuiltList<GDeviceFilterInput>? get and;
  BuiltList<GDeviceFilterInput>? get or;
  GComparableInt32OperationFilterInput? get id;
  GStringOperationFilterInput? get deviceRegToken;
  GComparableNullableOfDateTimeOperationFilterInput? get createdOn;
  GStringOperationFilterInput? get createdBy;
  GComparableNullableOfDateTimeOperationFilterInput? get lastModifiedOn;
  GStringOperationFilterInput? get lastModifiedBy;
  static Serializer<GDeviceFilterInput> get serializer =>
      _$gDeviceFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeviceFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeviceFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeviceFilterInput.serializer,
        json,
      );
}

abstract class GListFilterInputTypeOfUserRidesFilterInput
    implements
        Built<GListFilterInputTypeOfUserRidesFilterInput,
            GListFilterInputTypeOfUserRidesFilterInputBuilder> {
  GListFilterInputTypeOfUserRidesFilterInput._();

  factory GListFilterInputTypeOfUserRidesFilterInput(
      [Function(GListFilterInputTypeOfUserRidesFilterInputBuilder b)
          updates]) = _$GListFilterInputTypeOfUserRidesFilterInput;

  GUserRidesFilterInput? get all;
  GUserRidesFilterInput? get none;
  GUserRidesFilterInput? get some;
  bool? get any;
  static Serializer<GListFilterInputTypeOfUserRidesFilterInput>
      get serializer => _$gListFilterInputTypeOfUserRidesFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GListFilterInputTypeOfUserRidesFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListFilterInputTypeOfUserRidesFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GListFilterInputTypeOfUserRidesFilterInput.serializer,
        json,
      );
}

abstract class GListFilterInputTypeOfUserRatingFilterInput
    implements
        Built<GListFilterInputTypeOfUserRatingFilterInput,
            GListFilterInputTypeOfUserRatingFilterInputBuilder> {
  GListFilterInputTypeOfUserRatingFilterInput._();

  factory GListFilterInputTypeOfUserRatingFilterInput(
      [Function(GListFilterInputTypeOfUserRatingFilterInputBuilder b)
          updates]) = _$GListFilterInputTypeOfUserRatingFilterInput;

  GUserRatingFilterInput? get all;
  GUserRatingFilterInput? get none;
  GUserRatingFilterInput? get some;
  bool? get any;
  static Serializer<GListFilterInputTypeOfUserRatingFilterInput>
      get serializer => _$gListFilterInputTypeOfUserRatingFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GListFilterInputTypeOfUserRatingFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListFilterInputTypeOfUserRatingFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GListFilterInputTypeOfUserRatingFilterInput.serializer,
        json,
      );
}

abstract class GListFilterInputTypeOfFrequentRouteFilterInput
    implements
        Built<GListFilterInputTypeOfFrequentRouteFilterInput,
            GListFilterInputTypeOfFrequentRouteFilterInputBuilder> {
  GListFilterInputTypeOfFrequentRouteFilterInput._();

  factory GListFilterInputTypeOfFrequentRouteFilterInput(
      [Function(GListFilterInputTypeOfFrequentRouteFilterInputBuilder b)
          updates]) = _$GListFilterInputTypeOfFrequentRouteFilterInput;

  GFrequentRouteFilterInput? get all;
  GFrequentRouteFilterInput? get none;
  GFrequentRouteFilterInput? get some;
  bool? get any;
  static Serializer<GListFilterInputTypeOfFrequentRouteFilterInput>
      get serializer =>
          _$gListFilterInputTypeOfFrequentRouteFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GListFilterInputTypeOfFrequentRouteFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListFilterInputTypeOfFrequentRouteFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GListFilterInputTypeOfFrequentRouteFilterInput.serializer,
        json,
      );
}

abstract class GListFilterInputTypeOfSafiriCarUserFilterInput
    implements
        Built<GListFilterInputTypeOfSafiriCarUserFilterInput,
            GListFilterInputTypeOfSafiriCarUserFilterInputBuilder> {
  GListFilterInputTypeOfSafiriCarUserFilterInput._();

  factory GListFilterInputTypeOfSafiriCarUserFilterInput(
      [Function(GListFilterInputTypeOfSafiriCarUserFilterInputBuilder b)
          updates]) = _$GListFilterInputTypeOfSafiriCarUserFilterInput;

  GSafiriCarUserFilterInput? get all;
  GSafiriCarUserFilterInput? get none;
  GSafiriCarUserFilterInput? get some;
  bool? get any;
  static Serializer<GListFilterInputTypeOfSafiriCarUserFilterInput>
      get serializer =>
          _$gListFilterInputTypeOfSafiriCarUserFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GListFilterInputTypeOfSafiriCarUserFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListFilterInputTypeOfSafiriCarUserFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GListFilterInputTypeOfSafiriCarUserFilterInput.serializer,
        json,
      );
}

abstract class GComparableNullableOfDateTimeOffsetOperationFilterInput
    implements
        Built<GComparableNullableOfDateTimeOffsetOperationFilterInput,
            GComparableNullableOfDateTimeOffsetOperationFilterInputBuilder> {
  GComparableNullableOfDateTimeOffsetOperationFilterInput._();

  factory GComparableNullableOfDateTimeOffsetOperationFilterInput(
      [Function(
              GComparableNullableOfDateTimeOffsetOperationFilterInputBuilder b)
          updates]) = _$GComparableNullableOfDateTimeOffsetOperationFilterInput;

  GDateTime? get eq;
  GDateTime? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<GDateTime>? get Gin;
  BuiltList<GDateTime>? get nin;
  GDateTime? get gt;
  GDateTime? get ngt;
  GDateTime? get gte;
  GDateTime? get ngte;
  GDateTime? get lt;
  GDateTime? get nlt;
  GDateTime? get lte;
  GDateTime? get nlte;
  static Serializer<GComparableNullableOfDateTimeOffsetOperationFilterInput>
      get serializer =>
          _$gComparableNullableOfDateTimeOffsetOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableNullableOfDateTimeOffsetOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableNullableOfDateTimeOffsetOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableNullableOfDateTimeOffsetOperationFilterInput.serializer,
        json,
      );
}

class GSortEnumType extends EnumClass {
  const GSortEnumType._(String name) : super(name);

  static const GSortEnumType ASC = _$gSortEnumTypeASC;

  static const GSortEnumType DESC = _$gSortEnumTypeDESC;

  static Serializer<GSortEnumType> get serializer => _$gSortEnumTypeSerializer;
  static BuiltSet<GSortEnumType> get values => _$gSortEnumTypeValues;
  static GSortEnumType valueOf(String name) => _$gSortEnumTypeValueOf(name);
}

abstract class GIdentificationDocumentSortInput
    implements
        Built<GIdentificationDocumentSortInput,
            GIdentificationDocumentSortInputBuilder> {
  GIdentificationDocumentSortInput._();

  factory GIdentificationDocumentSortInput(
          [Function(GIdentificationDocumentSortInputBuilder b) updates]) =
      _$GIdentificationDocumentSortInput;

  GSortEnumType? get id;
  GSortEnumType? get nationalIdFront;
  GSortEnumType? get nationalIdRear;
  GSortEnumType? get drivingLicenceFront;
  GSortEnumType? get drivingLicenceRear;
  static Serializer<GIdentificationDocumentSortInput> get serializer =>
      _$gIdentificationDocumentSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GIdentificationDocumentSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIdentificationDocumentSortInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GIdentificationDocumentSortInput.serializer,
        json,
      );
}

abstract class GDeviceSortInput
    implements Built<GDeviceSortInput, GDeviceSortInputBuilder> {
  GDeviceSortInput._();

  factory GDeviceSortInput([Function(GDeviceSortInputBuilder b) updates]) =
      _$GDeviceSortInput;

  GSortEnumType? get id;
  GSortEnumType? get deviceRegToken;
  GSortEnumType? get createdOn;
  GSortEnumType? get createdBy;
  GSortEnumType? get lastModifiedOn;
  GSortEnumType? get lastModifiedBy;
  static Serializer<GDeviceSortInput> get serializer =>
      _$gDeviceSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeviceSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeviceSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeviceSortInput.serializer,
        json,
      );
}

abstract class GCountryFilterInput
    implements Built<GCountryFilterInput, GCountryFilterInputBuilder> {
  GCountryFilterInput._();

  factory GCountryFilterInput(
      [Function(GCountryFilterInputBuilder b) updates]) = _$GCountryFilterInput;

  BuiltList<GCountryFilterInput>? get and;
  BuiltList<GCountryFilterInput>? get or;
  GComparableInt32OperationFilterInput? get id;
  GStringOperationFilterInput? get name;
  GStringOperationFilterInput? get code;
  GStringOperationFilterInput? get abbrev;
  static Serializer<GCountryFilterInput> get serializer =>
      _$gCountryFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCountryFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCountryFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCountryFilterInput.serializer,
        json,
      );
}

abstract class GCountrySortInput
    implements Built<GCountrySortInput, GCountrySortInputBuilder> {
  GCountrySortInput._();

  factory GCountrySortInput([Function(GCountrySortInputBuilder b) updates]) =
      _$GCountrySortInput;

  GSortEnumType? get id;
  GSortEnumType? get name;
  GSortEnumType? get code;
  GSortEnumType? get abbrev;
  static Serializer<GCountrySortInput> get serializer =>
      _$gCountrySortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCountrySortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCountrySortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCountrySortInput.serializer,
        json,
      );
}

abstract class GComparableDateTimeOperationFilterInput
    implements
        Built<GComparableDateTimeOperationFilterInput,
            GComparableDateTimeOperationFilterInputBuilder> {
  GComparableDateTimeOperationFilterInput._();

  factory GComparableDateTimeOperationFilterInput(
      [Function(GComparableDateTimeOperationFilterInputBuilder b)
          updates]) = _$GComparableDateTimeOperationFilterInput;

  GDateTime? get eq;
  GDateTime? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<GDateTime>? get Gin;
  BuiltList<GDateTime>? get nin;
  GDateTime? get gt;
  GDateTime? get ngt;
  GDateTime? get gte;
  GDateTime? get ngte;
  GDateTime? get lt;
  GDateTime? get nlt;
  GDateTime? get lte;
  GDateTime? get nlte;
  static Serializer<GComparableDateTimeOperationFilterInput> get serializer =>
      _$gComparableDateTimeOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableDateTimeOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableDateTimeOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableDateTimeOperationFilterInput.serializer,
        json,
      );
}

abstract class GSeatFilterInput
    implements Built<GSeatFilterInput, GSeatFilterInputBuilder> {
  GSeatFilterInput._();

  factory GSeatFilterInput([Function(GSeatFilterInputBuilder b) updates]) =
      _$GSeatFilterInput;

  BuiltList<GSeatFilterInput>? get and;
  BuiltList<GSeatFilterInput>? get or;
  GStringOperationFilterInput? get id;
  GStringOperationFilterInput? get frontLeft;
  GStringOperationFilterInput? get middleLeft;
  GStringOperationFilterInput? get middleCentre;
  GStringOperationFilterInput? get middleRight;
  GStringOperationFilterInput? get backLeft;
  GStringOperationFilterInput? get backCentre;
  GStringOperationFilterInput? get backRight;
  static Serializer<GSeatFilterInput> get serializer =>
      _$gSeatFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSeatFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSeatFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSeatFilterInput.serializer,
        json,
      );
}

abstract class GComparableDecimalOperationFilterInput
    implements
        Built<GComparableDecimalOperationFilterInput,
            GComparableDecimalOperationFilterInputBuilder> {
  GComparableDecimalOperationFilterInput._();

  factory GComparableDecimalOperationFilterInput(
          [Function(GComparableDecimalOperationFilterInputBuilder b) updates]) =
      _$GComparableDecimalOperationFilterInput;

  GDecimal? get eq;
  GDecimal? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<GDecimal>? get Gin;
  BuiltList<GDecimal>? get nin;
  GDecimal? get gt;
  GDecimal? get ngt;
  GDecimal? get gte;
  GDecimal? get ngte;
  GDecimal? get lt;
  GDecimal? get nlt;
  GDecimal? get lte;
  GDecimal? get nlte;
  static Serializer<GComparableDecimalOperationFilterInput> get serializer =>
      _$gComparableDecimalOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableDecimalOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableDecimalOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableDecimalOperationFilterInput.serializer,
        json,
      );
}

abstract class GComparableNullableOfTimeSpanOperationFilterInput
    implements
        Built<GComparableNullableOfTimeSpanOperationFilterInput,
            GComparableNullableOfTimeSpanOperationFilterInputBuilder> {
  GComparableNullableOfTimeSpanOperationFilterInput._();

  factory GComparableNullableOfTimeSpanOperationFilterInput(
      [Function(GComparableNullableOfTimeSpanOperationFilterInputBuilder b)
          updates]) = _$GComparableNullableOfTimeSpanOperationFilterInput;

  GTimeSpan? get eq;
  GTimeSpan? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<GTimeSpan>? get Gin;
  BuiltList<GTimeSpan>? get nin;
  GTimeSpan? get gt;
  GTimeSpan? get ngt;
  GTimeSpan? get gte;
  GTimeSpan? get ngte;
  GTimeSpan? get lt;
  GTimeSpan? get nlt;
  GTimeSpan? get lte;
  GTimeSpan? get nlte;
  static Serializer<GComparableNullableOfTimeSpanOperationFilterInput>
      get serializer =>
          _$gComparableNullableOfTimeSpanOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableNullableOfTimeSpanOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableNullableOfTimeSpanOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableNullableOfTimeSpanOperationFilterInput.serializer,
        json,
      );
}

abstract class GComparableNullableOfInt32OperationFilterInput
    implements
        Built<GComparableNullableOfInt32OperationFilterInput,
            GComparableNullableOfInt32OperationFilterInputBuilder> {
  GComparableNullableOfInt32OperationFilterInput._();

  factory GComparableNullableOfInt32OperationFilterInput(
      [Function(GComparableNullableOfInt32OperationFilterInputBuilder b)
          updates]) = _$GComparableNullableOfInt32OperationFilterInput;

  int? get eq;
  int? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<int>? get Gin;
  BuiltList<int>? get nin;
  int? get gt;
  int? get ngt;
  int? get gte;
  int? get ngte;
  int? get lt;
  int? get nlt;
  int? get lte;
  int? get nlte;
  static Serializer<GComparableNullableOfInt32OperationFilterInput>
      get serializer =>
          _$gComparableNullableOfInt32OperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableNullableOfInt32OperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableNullableOfInt32OperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableNullableOfInt32OperationFilterInput.serializer,
        json,
      );
}

abstract class GListFilterInputTypeOfRideTransactionFilterInput
    implements
        Built<GListFilterInputTypeOfRideTransactionFilterInput,
            GListFilterInputTypeOfRideTransactionFilterInputBuilder> {
  GListFilterInputTypeOfRideTransactionFilterInput._();

  factory GListFilterInputTypeOfRideTransactionFilterInput(
      [Function(GListFilterInputTypeOfRideTransactionFilterInputBuilder b)
          updates]) = _$GListFilterInputTypeOfRideTransactionFilterInput;

  GRideTransactionFilterInput? get all;
  GRideTransactionFilterInput? get none;
  GRideTransactionFilterInput? get some;
  bool? get any;
  static Serializer<GListFilterInputTypeOfRideTransactionFilterInput>
      get serializer =>
          _$gListFilterInputTypeOfRideTransactionFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GListFilterInputTypeOfRideTransactionFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListFilterInputTypeOfRideTransactionFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GListFilterInputTypeOfRideTransactionFilterInput.serializer,
        json,
      );
}

abstract class GSeatSortInput
    implements Built<GSeatSortInput, GSeatSortInputBuilder> {
  GSeatSortInput._();

  factory GSeatSortInput([Function(GSeatSortInputBuilder b) updates]) =
      _$GSeatSortInput;

  GSortEnumType? get id;
  GSortEnumType? get frontLeft;
  GSortEnumType? get middleLeft;
  GSortEnumType? get middleCentre;
  GSortEnumType? get middleRight;
  GSortEnumType? get backLeft;
  GSortEnumType? get backCentre;
  GSortEnumType? get backRight;
  static Serializer<GSeatSortInput> get serializer =>
      _$gSeatSortInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSeatSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSeatSortInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSeatSortInput.serializer,
        json,
      );
}

abstract class GListFilterInputTypeOfRideFilterInput
    implements
        Built<GListFilterInputTypeOfRideFilterInput,
            GListFilterInputTypeOfRideFilterInputBuilder> {
  GListFilterInputTypeOfRideFilterInput._();

  factory GListFilterInputTypeOfRideFilterInput(
          [Function(GListFilterInputTypeOfRideFilterInputBuilder b) updates]) =
      _$GListFilterInputTypeOfRideFilterInput;

  GRideFilterInput? get all;
  GRideFilterInput? get none;
  GRideFilterInput? get some;
  bool? get any;
  static Serializer<GListFilterInputTypeOfRideFilterInput> get serializer =>
      _$gListFilterInputTypeOfRideFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GListFilterInputTypeOfRideFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListFilterInputTypeOfRideFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GListFilterInputTypeOfRideFilterInput.serializer,
        json,
      );
}

abstract class GUserRatingFilterInput
    implements Built<GUserRatingFilterInput, GUserRatingFilterInputBuilder> {
  GUserRatingFilterInput._();

  factory GUserRatingFilterInput(
          [Function(GUserRatingFilterInputBuilder b) updates]) =
      _$GUserRatingFilterInput;

  BuiltList<GUserRatingFilterInput>? get and;
  BuiltList<GUserRatingFilterInput>? get or;
  GComparableInt32OperationFilterInput? get id;
  GStringOperationFilterInput? get userThatRate;
  GStringOperationFilterInput? get userToRate;
  GComparableDoubleOperationFilterInput? get ratingValue;
  GComparableInt32OperationFilterInput? get rideId;
  GStringOperationFilterInput? get levelOfSatisfaction;
  GStringOperationFilterInput? get comment;
  GComparableDateTimeOperationFilterInput? get dateOfRating;
  GComparableTimeSpanOperationFilterInput? get timeOfRating;
  GComparableDateTimeOperationFilterInput? get dateOfLastUpadte;
  GComparableTimeSpanOperationFilterInput? get timeOfLastUpdate;
  GSafiriCarUserFilterInput? get reviewer;
  static Serializer<GUserRatingFilterInput> get serializer =>
      _$gUserRatingFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUserRatingFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserRatingFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUserRatingFilterInput.serializer,
        json,
      );
}

abstract class GFrequentRouteFilterInput
    implements
        Built<GFrequentRouteFilterInput, GFrequentRouteFilterInputBuilder> {
  GFrequentRouteFilterInput._();

  factory GFrequentRouteFilterInput(
          [Function(GFrequentRouteFilterInputBuilder b) updates]) =
      _$GFrequentRouteFilterInput;

  BuiltList<GFrequentRouteFilterInput>? get and;
  BuiltList<GFrequentRouteFilterInput>? get or;
  GStringOperationFilterInput? get origin;
  GStringOperationFilterInput? get destination;
  GStringOperationFilterInput? get image;
  GColorCustomFilterInput? get color;
  GStringOperationFilterInput? get userId;
  GComparableNullableOfDateTimeOperationFilterInput? get createdDate;
  GComparableInt32OperationFilterInput? get id;
  static Serializer<GFrequentRouteFilterInput> get serializer =>
      _$gFrequentRouteFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFrequentRouteFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFrequentRouteFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFrequentRouteFilterInput.serializer,
        json,
      );
}

abstract class GComparableTimeSpanOperationFilterInput
    implements
        Built<GComparableTimeSpanOperationFilterInput,
            GComparableTimeSpanOperationFilterInputBuilder> {
  GComparableTimeSpanOperationFilterInput._();

  factory GComparableTimeSpanOperationFilterInput(
      [Function(GComparableTimeSpanOperationFilterInputBuilder b)
          updates]) = _$GComparableTimeSpanOperationFilterInput;

  GTimeSpan? get eq;
  GTimeSpan? get neq;
  @BuiltValueField(wireName: 'in')
  BuiltList<GTimeSpan>? get Gin;
  BuiltList<GTimeSpan>? get nin;
  GTimeSpan? get gt;
  GTimeSpan? get ngt;
  GTimeSpan? get gte;
  GTimeSpan? get ngte;
  GTimeSpan? get lt;
  GTimeSpan? get nlt;
  GTimeSpan? get lte;
  GTimeSpan? get nlte;
  static Serializer<GComparableTimeSpanOperationFilterInput> get serializer =>
      _$gComparableTimeSpanOperationFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GComparableTimeSpanOperationFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComparableTimeSpanOperationFilterInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GComparableTimeSpanOperationFilterInput.serializer,
        json,
      );
}

abstract class GColorCustomFilterInput
    implements Built<GColorCustomFilterInput, GColorCustomFilterInputBuilder> {
  GColorCustomFilterInput._();

  factory GColorCustomFilterInput(
          [Function(GColorCustomFilterInputBuilder b) updates]) =
      _$GColorCustomFilterInput;

  BuiltList<GColorCustomFilterInput>? get and;
  BuiltList<GColorCustomFilterInput>? get or;
  GStringOperationFilterInput? get r;
  GStringOperationFilterInput? get g;
  GStringOperationFilterInput? get b;
  GStringOperationFilterInput? get a;
  GComparableInt32OperationFilterInput? get id;
  static Serializer<GColorCustomFilterInput> get serializer =>
      _$gColorCustomFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GColorCustomFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GColorCustomFilterInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GColorCustomFilterInput.serializer,
        json,
      );
}

abstract class GCreateRideRequestInput
    implements Built<GCreateRideRequestInput, GCreateRideRequestInputBuilder> {
  GCreateRideRequestInput._();

  factory GCreateRideRequestInput(
          [Function(GCreateRideRequestInputBuilder b) updates]) =
      _$GCreateRideRequestInput;

  String get name;
  String get placeofStart;
  String get destination;
  bool? get isActive;
  String get departureDate;
  String get duration;
  double get estimatePrice;
  String get estimateDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  String get carId;
  GSeatInput get seat;
  String get departureTime;
  String? get allowedBehDesc;
  int? get rideIndex;
  String? get exactPickupLocation;
  String? get exactDropOffLocation;
  bool? get isRecurring;
  static Serializer<GCreateRideRequestInput> get serializer =>
      _$gCreateRideRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateRideRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateRideRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateRideRequestInput.serializer,
        json,
      );
}

abstract class GContactUsRequestInput
    implements Built<GContactUsRequestInput, GContactUsRequestInputBuilder> {
  GContactUsRequestInput._();

  factory GContactUsRequestInput(
          [Function(GContactUsRequestInputBuilder b) updates]) =
      _$GContactUsRequestInput;

  String get name;
  String get email;
  String get message;
  static Serializer<GContactUsRequestInput> get serializer =>
      _$gContactUsRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GContactUsRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GContactUsRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GContactUsRequestInput.serializer,
        json,
      );
}

abstract class GToggleUserStatusRequestInput
    implements
        Built<GToggleUserStatusRequestInput,
            GToggleUserStatusRequestInputBuilder> {
  GToggleUserStatusRequestInput._();

  factory GToggleUserStatusRequestInput(
          [Function(GToggleUserStatusRequestInputBuilder b) updates]) =
      _$GToggleUserStatusRequestInput;

  bool get activateUser;
  String get userId;
  static Serializer<GToggleUserStatusRequestInput> get serializer =>
      _$gToggleUserStatusRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GToggleUserStatusRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GToggleUserStatusRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GToggleUserStatusRequestInput.serializer,
        json,
      );
}

abstract class GUpdateIdentificationDocumentRequestInput
    implements
        Built<GUpdateIdentificationDocumentRequestInput,
            GUpdateIdentificationDocumentRequestInputBuilder> {
  GUpdateIdentificationDocumentRequestInput._();

  factory GUpdateIdentificationDocumentRequestInput(
      [Function(GUpdateIdentificationDocumentRequestInputBuilder b)
          updates]) = _$GUpdateIdentificationDocumentRequestInput;

  String get email;
  GIdentificationDocumentInput? get identificationDocument;
  String? get updatedBy;
  static Serializer<GUpdateIdentificationDocumentRequestInput> get serializer =>
      _$gUpdateIdentificationDocumentRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateIdentificationDocumentRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateIdentificationDocumentRequestInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateIdentificationDocumentRequestInput.serializer,
        json,
      );
}

abstract class GUpdateRequestInput
    implements Built<GUpdateRequestInput, GUpdateRequestInputBuilder> {
  GUpdateRequestInput._();

  factory GUpdateRequestInput(
      [Function(GUpdateRequestInputBuilder b) updates]) = _$GUpdateRequestInput;

  String? get firstName;
  String? get lastName;
  String get email;
  String? get userName;
  String? get aboutMe;
  String? get phoneNumber;
  String? get updatedBy;
  static Serializer<GUpdateRequestInput> get serializer =>
      _$gUpdateRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateRequestInput.serializer,
        json,
      );
}

abstract class GRegisterRequestInput
    implements Built<GRegisterRequestInput, GRegisterRequestInputBuilder> {
  GRegisterRequestInput._();

  factory GRegisterRequestInput(
          [Function(GRegisterRequestInputBuilder b) updates]) =
      _$GRegisterRequestInput;

  String get firstName;
  String get lastName;
  String get email;
  String get nationalId;
  String get userName;
  String get password;
  String get confirmPassword;
  String get phoneNumber;
  String get role;
  bool get activateUser;
  bool get autoConfirmEmail;
  String get createdBy;
  GIdentificationDocumentInput? get identificationDocument;
  int get totalRating;
  double get averageRating;
  String? get referalCode;
  GLocationDtoInput get locationDto;
  GDeviceDtoInput? get deviceDto;
  static Serializer<GRegisterRequestInput> get serializer =>
      _$gRegisterRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRegisterRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRegisterRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRegisterRequestInput.serializer,
        json,
      );
}

abstract class GResetPasswordRequestInput
    implements
        Built<GResetPasswordRequestInput, GResetPasswordRequestInputBuilder> {
  GResetPasswordRequestInput._();

  factory GResetPasswordRequestInput(
          [Function(GResetPasswordRequestInputBuilder b) updates]) =
      _$GResetPasswordRequestInput;

  String get email;
  String get password;
  String get confirmPassword;
  String get token;
  static Serializer<GResetPasswordRequestInput> get serializer =>
      _$gResetPasswordRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GResetPasswordRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GResetPasswordRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GResetPasswordRequestInput.serializer,
        json,
      );
}

abstract class GForgotPasswordRequestInput
    implements
        Built<GForgotPasswordRequestInput, GForgotPasswordRequestInputBuilder> {
  GForgotPasswordRequestInput._();

  factory GForgotPasswordRequestInput(
          [Function(GForgotPasswordRequestInputBuilder b) updates]) =
      _$GForgotPasswordRequestInput;

  String get email;
  static Serializer<GForgotPasswordRequestInput> get serializer =>
      _$gForgotPasswordRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GForgotPasswordRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GForgotPasswordRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GForgotPasswordRequestInput.serializer,
        json,
      );
}

abstract class GUpdateUserRolesRequestInput
    implements
        Built<GUpdateUserRolesRequestInput,
            GUpdateUserRolesRequestInputBuilder> {
  GUpdateUserRolesRequestInput._();

  factory GUpdateUserRolesRequestInput(
          [Function(GUpdateUserRolesRequestInputBuilder b) updates]) =
      _$GUpdateUserRolesRequestInput;

  String get userId;
  BuiltList<GUserRoleModelInput> get userRoles;
  static Serializer<GUpdateUserRolesRequestInput> get serializer =>
      _$gUpdateUserRolesRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateUserRolesRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserRolesRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateUserRolesRequestInput.serializer,
        json,
      );
}

abstract class GRoleClaimRequestInput
    implements Built<GRoleClaimRequestInput, GRoleClaimRequestInputBuilder> {
  GRoleClaimRequestInput._();

  factory GRoleClaimRequestInput(
          [Function(GRoleClaimRequestInputBuilder b) updates]) =
      _$GRoleClaimRequestInput;

  int get id;
  String get roleId;
  String get type;
  String get value;
  String get description;
  String get group;
  bool get selected;
  static Serializer<GRoleClaimRequestInput> get serializer =>
      _$gRoleClaimRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRoleClaimRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRoleClaimRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRoleClaimRequestInput.serializer,
        json,
      );
}

abstract class GPermissionRequestInput
    implements Built<GPermissionRequestInput, GPermissionRequestInputBuilder> {
  GPermissionRequestInput._();

  factory GPermissionRequestInput(
          [Function(GPermissionRequestInputBuilder b) updates]) =
      _$GPermissionRequestInput;

  String get roleId;
  BuiltList<GRoleClaimRequestInput> get roleClaims;
  static Serializer<GPermissionRequestInput> get serializer =>
      _$gPermissionRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPermissionRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPermissionRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPermissionRequestInput.serializer,
        json,
      );
}

abstract class GRoleRequestInput
    implements Built<GRoleRequestInput, GRoleRequestInputBuilder> {
  GRoleRequestInput._();

  factory GRoleRequestInput([Function(GRoleRequestInputBuilder b) updates]) =
      _$GRoleRequestInput;

  String get id;
  String get name;
  String get description;
  static Serializer<GRoleRequestInput> get serializer =>
      _$gRoleRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRoleRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRoleRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRoleRequestInput.serializer,
        json,
      );
}

abstract class GFrequentRouteInput
    implements Built<GFrequentRouteInput, GFrequentRouteInputBuilder> {
  GFrequentRouteInput._();

  factory GFrequentRouteInput(
      [Function(GFrequentRouteInputBuilder b) updates]) = _$GFrequentRouteInput;

  String get origin;
  String get destination;
  String get image;
  GColorCustomInput get color;
  String get userId;
  GDateTime? get createdDate;
  int get id;
  static Serializer<GFrequentRouteInput> get serializer =>
      _$gFrequentRouteInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFrequentRouteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFrequentRouteInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFrequentRouteInput.serializer,
        json,
      );
}

abstract class GResfreshTokenRequestInput
    implements
        Built<GResfreshTokenRequestInput, GResfreshTokenRequestInputBuilder> {
  GResfreshTokenRequestInput._();

  factory GResfreshTokenRequestInput(
          [Function(GResfreshTokenRequestInputBuilder b) updates]) =
      _$GResfreshTokenRequestInput;

  String get token;
  String get refreshToken;
  static Serializer<GResfreshTokenRequestInput> get serializer =>
      _$gResfreshTokenRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GResfreshTokenRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GResfreshTokenRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GResfreshTokenRequestInput.serializer,
        json,
      );
}

abstract class GTokenRequestInput
    implements Built<GTokenRequestInput, GTokenRequestInputBuilder> {
  GTokenRequestInput._();

  factory GTokenRequestInput([Function(GTokenRequestInputBuilder b) updates]) =
      _$GTokenRequestInput;

  String get email;
  String get password;
  static Serializer<GTokenRequestInput> get serializer =>
      _$gTokenRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GTokenRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTokenRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GTokenRequestInput.serializer,
        json,
      );
}

abstract class GUpdateProfileRequestInput
    implements
        Built<GUpdateProfileRequestInput, GUpdateProfileRequestInputBuilder> {
  GUpdateProfileRequestInput._();

  factory GUpdateProfileRequestInput(
          [Function(GUpdateProfileRequestInputBuilder b) updates]) =
      _$GUpdateProfileRequestInput;

  String? get phoneNumber;
  String get firstName;
  String get lastName;
  String get email;
  String get identificationDocumentUrl;
  static Serializer<GUpdateProfileRequestInput> get serializer =>
      _$gUpdateProfileRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateProfileRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateProfileRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateProfileRequestInput.serializer,
        json,
      );
}

abstract class GPasswordResetRequestByPhoneInput
    implements
        Built<GPasswordResetRequestByPhoneInput,
            GPasswordResetRequestByPhoneInputBuilder> {
  GPasswordResetRequestByPhoneInput._();

  factory GPasswordResetRequestByPhoneInput(
          [Function(GPasswordResetRequestByPhoneInputBuilder b) updates]) =
      _$GPasswordResetRequestByPhoneInput;

  String get password;
  String get confirmPassword;
  String get phoneNumber;
  static Serializer<GPasswordResetRequestByPhoneInput> get serializer =>
      _$gPasswordResetRequestByPhoneInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPasswordResetRequestByPhoneInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPasswordResetRequestByPhoneInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPasswordResetRequestByPhoneInput.serializer,
        json,
      );
}

abstract class GChangePasswordRequestInput
    implements
        Built<GChangePasswordRequestInput, GChangePasswordRequestInputBuilder> {
  GChangePasswordRequestInput._();

  factory GChangePasswordRequestInput(
          [Function(GChangePasswordRequestInputBuilder b) updates]) =
      _$GChangePasswordRequestInput;

  String get password;
  String get newPassword;
  String get phoneNumber;
  static Serializer<GChangePasswordRequestInput> get serializer =>
      _$gChangePasswordRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GChangePasswordRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GChangePasswordRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GChangePasswordRequestInput.serializer,
        json,
      );
}

abstract class GTransactRequestInput
    implements Built<GTransactRequestInput, GTransactRequestInputBuilder> {
  GTransactRequestInput._();

  factory GTransactRequestInput(
          [Function(GTransactRequestInputBuilder b) updates]) =
      _$GTransactRequestInput;

  String get phoneNumber;
  String get amount;
  String get callBackUrl;
  static Serializer<GTransactRequestInput> get serializer =>
      _$gTransactRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GTransactRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GTransactRequestInput.serializer,
        json,
      );
}

abstract class GTransactB2CRequestInput
    implements
        Built<GTransactB2CRequestInput, GTransactB2CRequestInputBuilder> {
  GTransactB2CRequestInput._();

  factory GTransactB2CRequestInput(
          [Function(GTransactB2CRequestInputBuilder b) updates]) =
      _$GTransactB2CRequestInput;

  String get phoneNumber;
  String get amount;
  String get callBackUrl;
  String get occassion;
  String get remarks;
  String get queueTimeOutURL;
  int get rideId;
  String? get userId;
  static Serializer<GTransactB2CRequestInput> get serializer =>
      _$gTransactB2CRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GTransactB2CRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactB2CRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GTransactB2CRequestInput.serializer,
        json,
      );
}

abstract class GTransactionStatusRequestDtoInput
    implements
        Built<GTransactionStatusRequestDtoInput,
            GTransactionStatusRequestDtoInputBuilder> {
  GTransactionStatusRequestDtoInput._();

  factory GTransactionStatusRequestDtoInput(
          [Function(GTransactionStatusRequestDtoInputBuilder b) updates]) =
      _$GTransactionStatusRequestDtoInput;

  String get transactionID;
  String? get resultURL;
  String? get queueTimeOutURL;
  String? get remarks;
  String? get occasion;
  static Serializer<GTransactionStatusRequestDtoInput> get serializer =>
      _$gTransactionStatusRequestDtoInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GTransactionStatusRequestDtoInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactionStatusRequestDtoInput? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GTransactionStatusRequestDtoInput.serializer,
        json,
      );
}

abstract class GReverseRequestInput
    implements Built<GReverseRequestInput, GReverseRequestInputBuilder> {
  GReverseRequestInput._();

  factory GReverseRequestInput(
          [Function(GReverseRequestInputBuilder b) updates]) =
      _$GReverseRequestInput;

  String? get initiator;
  String? get securityCredential;
  GCommandType? get commandID;
  String? get transactionID;
  String? get amount;
  String? get receiverParty;
  String? get recieverIdentifierType;
  String? get remarks;
  String? get queueTimeOutURL;
  String? get resultURL;
  String? get occassion;
  static Serializer<GReverseRequestInput> get serializer =>
      _$gReverseRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GReverseRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReverseRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GReverseRequestInput.serializer,
        json,
      );
}

abstract class GChartDtoInput
    implements Built<GChartDtoInput, GChartDtoInputBuilder> {
  GChartDtoInput._();

  factory GChartDtoInput([Function(GChartDtoInputBuilder b) updates]) =
      _$GChartDtoInput;

  String get id;
  String get from;
  String get to;
  String get dateSend;
  String get message;
  String get topic;
  String? get deviceRegToken;
  static Serializer<GChartDtoInput> get serializer =>
      _$gChartDtoInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GChartDtoInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GChartDtoInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GChartDtoInput.serializer,
        json,
      );
}

abstract class GSubscriberEmailInput
    implements Built<GSubscriberEmailInput, GSubscriberEmailInputBuilder> {
  GSubscriberEmailInput._();

  factory GSubscriberEmailInput(
          [Function(GSubscriberEmailInputBuilder b) updates]) =
      _$GSubscriberEmailInput;

  int? get id;
  String? get email;
  bool? get isActive;
  static Serializer<GSubscriberEmailInput> get serializer =>
      _$gSubscriberEmailInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSubscriberEmailInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSubscriberEmailInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSubscriberEmailInput.serializer,
        json,
      );
}

abstract class GUploadRequestInput
    implements Built<GUploadRequestInput, GUploadRequestInputBuilder> {
  GUploadRequestInput._();

  factory GUploadRequestInput(
      [Function(GUploadRequestInputBuilder b) updates]) = _$GUploadRequestInput;

  String? get fileName;
  String? get extension;
  GUploadType? get uploadType;
  BuiltList<GByte>? get data;
  static Serializer<GUploadRequestInput> get serializer =>
      _$gUploadRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUploadRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUploadRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUploadRequestInput.serializer,
        json,
      );
}

abstract class GUploadRequestFlInput
    implements Built<GUploadRequestFlInput, GUploadRequestFlInputBuilder> {
  GUploadRequestFlInput._();

  factory GUploadRequestFlInput(
          [Function(GUploadRequestFlInputBuilder b) updates]) =
      _$GUploadRequestFlInput;

  String? get fileName;
  String? get extension;
  GUploadType? get uploadType;
  String? get data;
  static Serializer<GUploadRequestFlInput> get serializer =>
      _$gUploadRequestFlInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUploadRequestFlInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUploadRequestFlInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUploadRequestFlInput.serializer,
        json,
      );
}

abstract class GDownloadRequestInput
    implements Built<GDownloadRequestInput, GDownloadRequestInputBuilder> {
  GDownloadRequestInput._();

  factory GDownloadRequestInput(
          [Function(GDownloadRequestInputBuilder b) updates]) =
      _$GDownloadRequestInput;

  String? get fileName;
  GUploadType? get downloadType;
  static Serializer<GDownloadRequestInput> get serializer =>
      _$gDownloadRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDownloadRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDownloadRequestInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDownloadRequestInput.serializer,
        json,
      );
}

abstract class GCarInput implements Built<GCarInput, GCarInputBuilder> {
  GCarInput._();

  factory GCarInput([Function(GCarInputBuilder b) updates]) = _$GCarInput;

  String get id;
  String get color;
  String get model;
  String get licensePlate;
  String get imageUrl;
  bool get active;
  String get ownerId;
  GSafiriCarUserInput? get owner;
  BuiltList<GRideInput>? get rides;
  static Serializer<GCarInput> get serializer => _$gCarInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCarInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCarInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCarInput.serializer,
        json,
      );
}

abstract class GCarUpdateDtoInput
    implements Built<GCarUpdateDtoInput, GCarUpdateDtoInputBuilder> {
  GCarUpdateDtoInput._();

  factory GCarUpdateDtoInput([Function(GCarUpdateDtoInputBuilder b) updates]) =
      _$GCarUpdateDtoInput;

  String? get color;
  String? get model;
  String? get licensePlate;
  String? get imageUrl;
  bool get active;
  String? get ownerId;
  static Serializer<GCarUpdateDtoInput> get serializer =>
      _$gCarUpdateDtoInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCarUpdateDtoInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCarUpdateDtoInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCarUpdateDtoInput.serializer,
        json,
      );
}

abstract class GTimeSpan implements Built<GTimeSpan, GTimeSpanBuilder> {
  GTimeSpan._();

  factory GTimeSpan([String? value]) =>
      _$GTimeSpan((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTimeSpan> get serializer =>
      _i1.DefaultScalarSerializer<GTimeSpan>(
          (Object serialized) => GTimeSpan((serialized as String?)));
}

abstract class GDecimal implements Built<GDecimal, GDecimalBuilder> {
  GDecimal._();

  factory GDecimal([String? value]) =>
      _$GDecimal((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDecimal> get serializer =>
      _i1.DefaultScalarSerializer<GDecimal>(
          (Object serialized) => GDecimal((serialized as String?)));
}

abstract class GRideInput implements Built<GRideInput, GRideInputBuilder> {
  GRideInput._();

  factory GRideInput([Function(GRideInputBuilder b) updates]) = _$GRideInput;

  int get id;
  String? get name;
  String? get placeofStart;
  String? get destination;
  String? get driverId;
  double get estimatePrice;
  String? get estimatedDistance;
  int get numberOfPeople;
  int get maximumCarryWeight;
  GDateTime get departureDate;
  String? get duration;
  String? get status;
  GSeatInput? get seat;
  int get seatCount;
  int get seatCapacity;
  double get maxTotalPay;
  double get totalPay;
  GDecimal get amountCashedOut;
  GTimeSpan? get departureTime;
  GDateTime get arrivalTime;
  String? get allowedBehDesc;
  String? get exactPickupLocation;
  int? get routeIndex;
  String get mpesaReceiptNumber;
  GDateTime get transactionDate;
  String get merchantRequestId;
  String get checkoutRequestId;
  double get compensatedFromPassengerCancel;
  GDateTime? get driverPaymentTime;
  String? get exactDropOffLocation;
  bool? get isRecurring;
  String get carId;
  GCarInput? get car;
  BuiltList<GUserRidesInput>? get users;
  BuiltList<GRideTransactionInput>? get transactions;
  static Serializer<GRideInput> get serializer => _$gRideInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRideInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRideInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRideInput.serializer,
        json,
      );
}

abstract class GSafiriCarUserInput
    implements Built<GSafiriCarUserInput, GSafiriCarUserInputBuilder> {
  GSafiriCarUserInput._();

  factory GSafiriCarUserInput(
      [Function(GSafiriCarUserInputBuilder b) updates]) = _$GSafiriCarUserInput;

  String get firstName;
  String get lastName;
  String get nationalId;
  BuiltList<GCarInput> get ownedCars;
  String get createdBy;
  String get profilePictureDataUrl;
  String? get referalCode;
  GIdentificationDocumentInput? get identificationDocument;
  GDateTime? get createdOn;
  String? get lastModifiedBy;
  GDateTime? get lastModifiedOn;
  bool get isDeleted;
  GDateTime? get deletedOn;
  bool get isActive;
  String? get refreshToken;
  String? get role;
  GDateTime? get refreshTokenExpiryTime;
  int get totalRating;
  double get averageRating;
  int get tripsCreated;
  int get tripsCompleted;
  int get tripsCancelled;
  bool get isVerified;
  String? get aboutMe;
  double get loyaltyPoints;
  GLocationInput? get location;
  GDeviceInput? get device;
  BuiltList<GUserRidesInput> get rides;
  BuiltList<GUserRatingInput> get userRatings;
  BuiltList<GFrequentRouteInput> get frequentRoutes;
  BuiltList<GSafiriCarUserInput>? get userReferals;
  String? get id;
  String? get userName;
  String? get normalizedUserName;
  String? get email;
  String? get normalizedEmail;
  bool get emailConfirmed;
  String? get passwordHash;
  String? get securityStamp;
  String? get concurrencyStamp;
  String? get phoneNumber;
  bool get phoneNumberConfirmed;
  bool get twoFactorEnabled;
  GDateTime? get lockoutEnd;
  bool get lockoutEnabled;
  int get accessFailedCount;
  static Serializer<GSafiriCarUserInput> get serializer =>
      _$gSafiriCarUserInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSafiriCarUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSafiriCarUserInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSafiriCarUserInput.serializer,
        json,
      );
}

abstract class GByte implements Built<GByte, GByteBuilder> {
  GByte._();

  factory GByte([String? value]) =>
      _$GByte((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GByte> get serializer => _i1.DefaultScalarSerializer<GByte>(
      (Object serialized) => GByte((serialized as String?)));
}

class GUploadType extends EnumClass {
  const GUploadType._(String name) : super(name);

  static const GUploadType CAR = _$gUploadTypeCAR;

  static const GUploadType PROFILE_PICTURE = _$gUploadTypePROFILE_PICTURE;

  static const GUploadType DOCUMENT = _$gUploadTypeDOCUMENT;

  static Serializer<GUploadType> get serializer => _$gUploadTypeSerializer;
  static BuiltSet<GUploadType> get values => _$gUploadTypeValues;
  static GUploadType valueOf(String name) => _$gUploadTypeValueOf(name);
}

class GCommandType extends EnumClass {
  const GCommandType._(String name) : super(name);

  static const GCommandType TRANSACTION_REVERSAL =
      _$gCommandTypeTRANSACTION_REVERSAL;

  static const GCommandType SALARY_PAYMENT = _$gCommandTypeSALARY_PAYMENT;

  static const GCommandType BUSINESS_PAYMENT = _$gCommandTypeBUSINESS_PAYMENT;

  static const GCommandType PROMOTION_PAYMENT = _$gCommandTypePROMOTION_PAYMENT;

  static const GCommandType ACCOUNT_BALANCE = _$gCommandTypeACCOUNT_BALANCE;

  static const GCommandType CUSTOMER_PAY_BILL_ONLINE =
      _$gCommandTypeCUSTOMER_PAY_BILL_ONLINE;

  static const GCommandType TRANSACTION_STATUS_QUERY =
      _$gCommandTypeTRANSACTION_STATUS_QUERY;

  static const GCommandType CHECK_IDENTITY = _$gCommandTypeCHECK_IDENTITY;

  static const GCommandType BUSINESS_PAY_BILL = _$gCommandTypeBUSINESS_PAY_BILL;

  static const GCommandType BUSINESS_BUY_GOODS =
      _$gCommandTypeBUSINESS_BUY_GOODS;

  static const GCommandType DISBURSE_FUNDS_TO_BUSINESS =
      _$gCommandTypeDISBURSE_FUNDS_TO_BUSINESS;

  static const GCommandType BUSINESS_TO_BUSINESS_TRANSFER =
      _$gCommandTypeBUSINESS_TO_BUSINESS_TRANSFER;

  static const GCommandType BUSINESS_TRANSFER_FROM_MMFTO_UTILITY =
      _$gCommandTypeBUSINESS_TRANSFER_FROM_MMFTO_UTILITY;

  static Serializer<GCommandType> get serializer => _$gCommandTypeSerializer;
  static BuiltSet<GCommandType> get values => _$gCommandTypeValues;
  static GCommandType valueOf(String name) => _$gCommandTypeValueOf(name);
}

abstract class GColorCustomInput
    implements Built<GColorCustomInput, GColorCustomInputBuilder> {
  GColorCustomInput._();

  factory GColorCustomInput([Function(GColorCustomInputBuilder b) updates]) =
      _$GColorCustomInput;

  String get r;
  String get g;
  String get b;
  String get a;
  int get id;
  static Serializer<GColorCustomInput> get serializer =>
      _$gColorCustomInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GColorCustomInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GColorCustomInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GColorCustomInput.serializer,
        json,
      );
}

abstract class GUserRoleModelInput
    implements Built<GUserRoleModelInput, GUserRoleModelInputBuilder> {
  GUserRoleModelInput._();

  factory GUserRoleModelInput(
      [Function(GUserRoleModelInputBuilder b) updates]) = _$GUserRoleModelInput;

  String get roleName;
  String get roleDescription;
  bool get selected;
  static Serializer<GUserRoleModelInput> get serializer =>
      _$gUserRoleModelInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUserRoleModelInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserRoleModelInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUserRoleModelInput.serializer,
        json,
      );
}

abstract class GDeviceDtoInput
    implements Built<GDeviceDtoInput, GDeviceDtoInputBuilder> {
  GDeviceDtoInput._();

  factory GDeviceDtoInput([Function(GDeviceDtoInputBuilder b) updates]) =
      _$GDeviceDtoInput;

  String get deviceRegToken;
  static Serializer<GDeviceDtoInput> get serializer =>
      _$gDeviceDtoInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeviceDtoInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeviceDtoInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeviceDtoInput.serializer,
        json,
      );
}

abstract class GLocationDtoInput
    implements Built<GLocationDtoInput, GLocationDtoInputBuilder> {
  GLocationDtoInput._();

  factory GLocationDtoInput([Function(GLocationDtoInputBuilder b) updates]) =
      _$GLocationDtoInput;

  String get town;
  GCountryDtoInput get countryDto;
  static Serializer<GLocationDtoInput> get serializer =>
      _$gLocationDtoInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GLocationDtoInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLocationDtoInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GLocationDtoInput.serializer,
        json,
      );
}

abstract class GIdentificationDocumentInput
    implements
        Built<GIdentificationDocumentInput,
            GIdentificationDocumentInputBuilder> {
  GIdentificationDocumentInput._();

  factory GIdentificationDocumentInput(
          [Function(GIdentificationDocumentInputBuilder b) updates]) =
      _$GIdentificationDocumentInput;

  int get id;
  String? get nationalIdFront;
  String? get nationalIdRear;
  String? get drivingLicenceFront;
  String? get drivingLicenceRear;
  static Serializer<GIdentificationDocumentInput> get serializer =>
      _$gIdentificationDocumentInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GIdentificationDocumentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIdentificationDocumentInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GIdentificationDocumentInput.serializer,
        json,
      );
}

abstract class GSeatInput implements Built<GSeatInput, GSeatInputBuilder> {
  GSeatInput._();

  factory GSeatInput([Function(GSeatInputBuilder b) updates]) = _$GSeatInput;

  String? get id;
  String? get frontLeft;
  String? get middleLeft;
  String? get middleCentre;
  String? get middleRight;
  String? get backLeft;
  String? get backCentre;
  String? get backRight;
  static Serializer<GSeatInput> get serializer => _$gSeatInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GSeatInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSeatInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GSeatInput.serializer,
        json,
      );
}

class GApplyPolicy extends EnumClass {
  const GApplyPolicy._(String name) : super(name);

  static const GApplyPolicy BEFORE_RESOLVER = _$gApplyPolicyBEFORE_RESOLVER;

  static const GApplyPolicy AFTER_RESOLVER = _$gApplyPolicyAFTER_RESOLVER;

  static Serializer<GApplyPolicy> get serializer => _$gApplyPolicySerializer;
  static BuiltSet<GApplyPolicy> get values => _$gApplyPolicyValues;
  static GApplyPolicy valueOf(String name) => _$gApplyPolicyValueOf(name);
}

abstract class GCountryDtoInput
    implements Built<GCountryDtoInput, GCountryDtoInputBuilder> {
  GCountryDtoInput._();

  factory GCountryDtoInput([Function(GCountryDtoInputBuilder b) updates]) =
      _$GCountryDtoInput;

  String get name;
  String get code;
  String get abbrev;
  static Serializer<GCountryDtoInput> get serializer =>
      _$gCountryDtoInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCountryDtoInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCountryDtoInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCountryDtoInput.serializer,
        json,
      );
}

abstract class GUserRatingInput
    implements Built<GUserRatingInput, GUserRatingInputBuilder> {
  GUserRatingInput._();

  factory GUserRatingInput([Function(GUserRatingInputBuilder b) updates]) =
      _$GUserRatingInput;

  int get id;
  String? get userThatRate;
  String? get userToRate;
  double get ratingValue;
  int get rideId;
  String? get levelOfSatisfaction;
  String? get comment;
  GDateTime get dateOfRating;
  GTimeSpan get timeOfRating;
  GDateTime get dateOfLastUpadte;
  GTimeSpan get timeOfLastUpdate;
  GSafiriCarUserInput get reviewer;
  static Serializer<GUserRatingInput> get serializer =>
      _$gUserRatingInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUserRatingInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserRatingInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUserRatingInput.serializer,
        json,
      );
}

abstract class GDeviceInput
    implements Built<GDeviceInput, GDeviceInputBuilder> {
  GDeviceInput._();

  factory GDeviceInput([Function(GDeviceInputBuilder b) updates]) =
      _$GDeviceInput;

  int get id;
  String get deviceRegToken;
  GDateTime? get createdOn;
  String? get createdBy;
  GDateTime? get lastModifiedOn;
  String? get lastModifiedBy;
  static Serializer<GDeviceInput> get serializer => _$gDeviceInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeviceInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeviceInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeviceInput.serializer,
        json,
      );
}

abstract class GLocationInput
    implements Built<GLocationInput, GLocationInputBuilder> {
  GLocationInput._();

  factory GLocationInput([Function(GLocationInputBuilder b) updates]) =
      _$GLocationInput;

  int get id;
  String get town;
  bool get isPopular;
  GCountryInput get country;
  GDateTime? get createdOn;
  String? get createdBy;
  GDateTime? get lastModifiedOn;
  String? get lastModifiedBy;
  static Serializer<GLocationInput> get serializer =>
      _$gLocationInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GLocationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLocationInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GLocationInput.serializer,
        json,
      );
}

abstract class GRideTransactionInput
    implements Built<GRideTransactionInput, GRideTransactionInputBuilder> {
  GRideTransactionInput._();

  factory GRideTransactionInput(
          [Function(GRideTransactionInputBuilder b) updates]) =
      _$GRideTransactionInput;

  String? get id;
  String? get phoneNumber;
  double get amount;
  bool get isReversed;
  String? get status;
  int get bookedRideId;
  String? get passengerId;
  String? get driverId;
  String? get transactionCode;
  String? get merchantRequestId;
  String? get checkoutRequestId;
  GDateTime? get transactionDate;
  GTimeSpan? get transactionTime;
  GDateTime get approvedDateTime;
  String? get transactionID;
  String? get conversationID;
  String? get originatorConversationID;
  String? get reversedDate;
  String? get reversedTime;
  String? get reseaonForReversal;
  String? get seatsStr;
  String? get paymentMethod;
  String? get exactDropOffLocation;
  static Serializer<GRideTransactionInput> get serializer =>
      _$gRideTransactionInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRideTransactionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRideTransactionInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRideTransactionInput.serializer,
        json,
      );
}

abstract class GUserRidesInput
    implements Built<GUserRidesInput, GUserRidesInputBuilder> {
  GUserRidesInput._();

  factory GUserRidesInput([Function(GUserRidesInputBuilder b) updates]) =
      _$GUserRidesInput;

  String? get userId;
  GSafiriCarUserInput? get user;
  int get rideId;
  GRideInput? get ride;
  BuiltList<GRideTransactionInput>? get transactions;
  static Serializer<GUserRidesInput> get serializer =>
      _$gUserRidesInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUserRidesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserRidesInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUserRidesInput.serializer,
        json,
      );
}

abstract class GCountryInput
    implements Built<GCountryInput, GCountryInputBuilder> {
  GCountryInput._();

  factory GCountryInput([Function(GCountryInputBuilder b) updates]) =
      _$GCountryInput;

  int get id;
  String get name;
  String get code;
  String get abbrev;
  static Serializer<GCountryInput> get serializer => _$gCountryInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCountryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCountryInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCountryInput.serializer,
        json,
      );
}

const possibleTypesMap = {
  'IResult': {
    'AppResultOfListOfContactUs',
    'AppResultOfUserRolesResponse',
    'AppResult',
    'AppResultOfString',
    'AppResultOfPermissionResponse',
    'AppResultOfRoleResponse',
    'AppResultOfListOfRoleResponse',
    'AppResultOfRoleClaimResponse',
    'AppResultOfListOfRoleClaimResponse',
    'AppResultOfBoolean',
    'AppResultOfTokenResponse',
  }
};
