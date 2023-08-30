// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRegisterUserVars> _$gRegisterUserVarsSerializer =
    new _$GRegisterUserVarsSerializer();
Serializer<GUserLoginVars> _$gUserLoginVarsSerializer =
    new _$GUserLoginVarsSerializer();
Serializer<GUpdateLicenceDocumentsVars>
    _$gUpdateLicenceDocumentsVarsSerializer =
    new _$GUpdateLicenceDocumentsVarsSerializer();
Serializer<GCreateARideVars> _$gCreateARideVarsSerializer =
    new _$GCreateARideVarsSerializer();
Serializer<GTransactionVars> _$gTransactionVarsSerializer =
    new _$GTransactionVarsSerializer();
Serializer<GSaveUserFileVars> _$gSaveUserFileVarsSerializer =
    new _$GSaveUserFileVarsSerializer();
Serializer<GSaveUserFileStringVars> _$gSaveUserFileStringVarsSerializer =
    new _$GSaveUserFileStringVarsSerializer();
Serializer<GCreateCarVars> _$gCreateCarVarsSerializer =
    new _$GCreateCarVarsSerializer();
Serializer<GAddChatVars> _$gAddChatVarsSerializer =
    new _$GAddChatVarsSerializer();
Serializer<GChangeUserPasswordVars> _$gChangeUserPasswordVarsSerializer =
    new _$GChangeUserPasswordVarsSerializer();
Serializer<GSendOTPVars> _$gSendOTPVarsSerializer =
    new _$GSendOTPVarsSerializer();
Serializer<GLNMStatusVars> _$gLNMStatusVarsSerializer =
    new _$GLNMStatusVarsSerializer();
Serializer<GTransactB2CVars> _$gTransactB2CVarsSerializer =
    new _$GTransactB2CVarsSerializer();
Serializer<GUpdateUserPhoneNumberVars> _$gUpdateUserPhoneNumberVarsSerializer =
    new _$GUpdateUserPhoneNumberVarsSerializer();
Serializer<GUpdateUserDetailsVars> _$gUpdateUserDetailsVarsSerializer =
    new _$GUpdateUserDetailsVarsSerializer();
Serializer<GUpdateCarDetailsVars> _$gUpdateCarDetailsVarsSerializer =
    new _$GUpdateCarDetailsVarsSerializer();
Serializer<GupdateFMCTokenVars> _$gupdateFMCTokenVarsSerializer =
    new _$GupdateFMCTokenVarsSerializer();
Serializer<GCheckIfUserIsDriverVars> _$gCheckIfUserIsDriverVarsSerializer =
    new _$GCheckIfUserIsDriverVarsSerializer();
Serializer<GGetAllRolesVars> _$gGetAllRolesVarsSerializer =
    new _$GGetAllRolesVarsSerializer();
Serializer<GGetDriverTripsVars> _$gGetDriverTripsVarsSerializer =
    new _$GGetDriverTripsVarsSerializer();
Serializer<GGetPaidTripsVars> _$gGetPaidTripsVarsSerializer =
    new _$GGetPaidTripsVarsSerializer();
Serializer<GGetUserByUserNameVars> _$gGetUserByUserNameVarsSerializer =
    new _$GGetUserByUserNameVarsSerializer();
Serializer<GFilterToAndFromRidesVars> _$gFilterToAndFromRidesVarsSerializer =
    new _$GFilterToAndFromRidesVarsSerializer();
Serializer<GGetUserCarsVars> _$gGetUserCarsVarsSerializer =
    new _$GGetUserCarsVarsSerializer();
Serializer<GGetUserWithFilterVars> _$gGetUserWithFilterVarsSerializer =
    new _$GGetUserWithFilterVarsSerializer();
Serializer<GGetUserByIdVars> _$gGetUserByIdVarsSerializer =
    new _$GGetUserByIdVarsSerializer();
Serializer<GGetOnGoingUserBookingsVars>
    _$gGetOnGoingUserBookingsVarsSerializer =
    new _$GGetOnGoingUserBookingsVarsSerializer();
Serializer<GGetPastUserBookingsVars> _$gGetPastUserBookingsVarsSerializer =
    new _$GGetPastUserBookingsVarsSerializer();
Serializer<GGetRidesVars> _$gGetRidesVarsSerializer =
    new _$GGetRidesVarsSerializer();
Serializer<GGetLatestRidesVars> _$gGetLatestRidesVarsSerializer =
    new _$GGetLatestRidesVarsSerializer();
Serializer<GGetRideInfoVars> _$gGetRideInfoVarsSerializer =
    new _$GGetRideInfoVarsSerializer();
Serializer<GGetRideVars> _$gGetRideVarsSerializer =
    new _$GGetRideVarsSerializer();
Serializer<GGetRidesWithFilterVars> _$gGetRidesWithFilterVarsSerializer =
    new _$GGetRidesWithFilterVarsSerializer();
Serializer<GGetDestinationRidesVars> _$gGetDestinationRidesVarsSerializer =
    new _$GGetDestinationRidesVarsSerializer();
Serializer<GOnGetMessageVars> _$gOnGetMessageVarsSerializer =
    new _$GOnGetMessageVarsSerializer();

class _$GRegisterUserVarsSerializer
    implements StructuredSerializer<GRegisterUserVars> {
  @override
  final Iterable<Type> types = const [GRegisterUserVars, _$GRegisterUserVars];
  @override
  final String wireName = 'GRegisterUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRegisterUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'confirmPassword',
      serializers.serialize(object.confirmPassword,
          specifiedType: const FullType(String)),
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
      'nationalId',
      serializers.serialize(object.nationalId,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'userName',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
      'town',
      serializers.serialize(object.town, specifiedType: const FullType(String)),
      'cName',
      serializers.serialize(object.cName,
          specifiedType: const FullType(String)),
      'cCode',
      serializers.serialize(object.cCode,
          specifiedType: const FullType(String)),
      'cAbbrev',
      serializers.serialize(object.cAbbrev,
          specifiedType: const FullType(String)),
      'deviceToken',
      serializers.serialize(object.deviceToken,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GRegisterUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRegisterUserVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'confirmPassword':
          result.confirmPassword = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nationalId':
          result.nationalId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'town':
          result.town = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cName':
          result.cName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cCode':
          result.cCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cAbbrev':
          result.cAbbrev = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'deviceToken':
          result.deviceToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserLoginVarsSerializer
    implements StructuredSerializer<GUserLoginVars> {
  @override
  final Iterable<Type> types = const [GUserLoginVars, _$GUserLoginVars];
  @override
  final String wireName = 'GUserLoginVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserLoginVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserLoginVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserLoginVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateLicenceDocumentsVarsSerializer
    implements StructuredSerializer<GUpdateLicenceDocumentsVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateLicenceDocumentsVars,
    _$GUpdateLicenceDocumentsVars
  ];
  @override
  final String wireName = 'GUpdateLicenceDocumentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateLicenceDocumentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'updatedBy',
      serializers.serialize(object.updatedBy,
          specifiedType: const FullType(String)),
      'licenseFront',
      serializers.serialize(object.licenseFront,
          specifiedType: const FullType(String)),
      'licenseRear',
      serializers.serialize(object.licenseRear,
          specifiedType: const FullType(String)),
      'nationalIdFront',
      serializers.serialize(object.nationalIdFront,
          specifiedType: const FullType(String)),
      'nationalIdBack',
      serializers.serialize(object.nationalIdBack,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GUpdateLicenceDocumentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateLicenceDocumentsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updatedBy':
          result.updatedBy = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'licenseFront':
          result.licenseFront = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'licenseRear':
          result.licenseRear = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nationalIdFront':
          result.nationalIdFront = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nationalIdBack':
          result.nationalIdBack = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateARideVarsSerializer
    implements StructuredSerializer<GCreateARideVars> {
  @override
  final Iterable<Type> types = const [GCreateARideVars, _$GCreateARideVars];
  @override
  final String wireName = 'GCreateARideVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateARideVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'placeOfStart',
      serializers.serialize(object.placeOfStart,
          specifiedType: const FullType(String)),
      'estimatePrice',
      serializers.serialize(object.estimatePrice,
          specifiedType: const FullType(double)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'destination',
      serializers.serialize(object.destination,
          specifiedType: const FullType(String)),
      'departureDate',
      serializers.serialize(object.departureDate,
          specifiedType: const FullType(String)),
      'estimateTime',
      serializers.serialize(object.estimateTime,
          specifiedType: const FullType(String)),
      'estimateDistance',
      serializers.serialize(object.estimateDistance,
          specifiedType: const FullType(String)),
      'numberOfPeople',
      serializers.serialize(object.numberOfPeople,
          specifiedType: const FullType(int)),
      'maxCarry',
      serializers.serialize(object.maxCarry,
          specifiedType: const FullType(int)),
      'carId',
      serializers.serialize(object.carId,
          specifiedType: const FullType(String)),
      'departureTime',
      serializers.serialize(object.departureTime,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.backCentre;
    if (value != null) {
      result
        ..add('backCentre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.backRight;
    if (value != null) {
      result
        ..add('backRight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.backLeft;
    if (value != null) {
      result
        ..add('backLeft')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.frontLeft;
    if (value != null) {
      result
        ..add('frontLeft')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.middleCentre;
    if (value != null) {
      result
        ..add('middleCentre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.middleLeft;
    if (value != null) {
      result
        ..add('middleLeft')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.middleRight;
    if (value != null) {
      result
        ..add('middleRight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rideIndex;
    if (value != null) {
      result
        ..add('rideIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GCreateARideVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateARideVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'placeOfStart':
          result.placeOfStart = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'estimatePrice':
          result.estimatePrice = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'departureDate':
          result.departureDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'estimateTime':
          result.estimateTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'estimateDistance':
          result.estimateDistance = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'numberOfPeople':
          result.numberOfPeople = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'maxCarry':
          result.maxCarry = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'carId':
          result.carId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'backCentre':
          result.backCentre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'backRight':
          result.backRight = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'backLeft':
          result.backLeft = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'frontLeft':
          result.frontLeft = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'middleCentre':
          result.middleCentre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'middleLeft':
          result.middleLeft = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'middleRight':
          result.middleRight = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'departureTime':
          result.departureTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rideIndex':
          result.rideIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTransactionVarsSerializer
    implements StructuredSerializer<GTransactionVars> {
  @override
  final Iterable<Type> types = const [GTransactionVars, _$GTransactionVars];
  @override
  final String wireName = 'GTransactionVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTransactionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(String)),
      'callBackUrl',
      serializers.serialize(object.callBackUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GTransactionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTransactionVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'callBackUrl':
          result.callBackUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GSaveUserFileVarsSerializer
    implements StructuredSerializer<GSaveUserFileVars> {
  @override
  final Iterable<Type> types = const [GSaveUserFileVars, _$GSaveUserFileVars];
  @override
  final String wireName = 'GSaveUserFileVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSaveUserFileVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fileName',
      serializers.serialize(object.fileName,
          specifiedType: const FullType(String)),
      'fileExtension',
      serializers.serialize(object.fileExtension,
          specifiedType: const FullType(String)),
      'uploadType',
      serializers.serialize(object.uploadType,
          specifiedType: const FullType(_i2.GUploadType)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GSaveUserFileVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSaveUserFileVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fileName':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fileExtension':
          result.fileExtension = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'uploadType':
          result.uploadType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GUploadType))!
              as _i2.GUploadType;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GSaveUserFileStringVarsSerializer
    implements StructuredSerializer<GSaveUserFileStringVars> {
  @override
  final Iterable<Type> types = const [
    GSaveUserFileStringVars,
    _$GSaveUserFileStringVars
  ];
  @override
  final String wireName = 'GSaveUserFileStringVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSaveUserFileStringVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fileName',
      serializers.serialize(object.fileName,
          specifiedType: const FullType(String)),
      'fileExtension',
      serializers.serialize(object.fileExtension,
          specifiedType: const FullType(String)),
      'uploadType',
      serializers.serialize(object.uploadType,
          specifiedType: const FullType(_i2.GUploadType)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GSaveUserFileStringVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSaveUserFileStringVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fileName':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fileExtension':
          result.fileExtension = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'uploadType':
          result.uploadType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GUploadType))!
              as _i2.GUploadType;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateCarVarsSerializer
    implements StructuredSerializer<GCreateCarVars> {
  @override
  final Iterable<Type> types = const [GCreateCarVars, _$GCreateCarVars];
  @override
  final String wireName = 'GCreateCarVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateCarVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'active',
      serializers.serialize(object.active, specifiedType: const FullType(bool)),
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(String)),
      'licensePlate',
      serializers.serialize(object.licensePlate,
          specifiedType: const FullType(String)),
      'model',
      serializers.serialize(object.model,
          specifiedType: const FullType(String)),
      'ownerId',
      serializers.serialize(object.ownerId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateCarVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateCarVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'licensePlate':
          result.licensePlate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ownerId':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddChatVarsSerializer implements StructuredSerializer<GAddChatVars> {
  @override
  final Iterable<Type> types = const [GAddChatVars, _$GAddChatVars];
  @override
  final String wireName = 'GAddChatVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddChatVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'deviceRegToken',
      serializers.serialize(object.deviceRegToken,
          specifiedType: const FullType(String)),
      'from',
      serializers.serialize(object.from, specifiedType: const FullType(String)),
      'to',
      serializers.serialize(object.to, specifiedType: const FullType(String)),
      'topic',
      serializers.serialize(object.topic,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAddChatVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddChatVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'deviceRegToken':
          result.deviceRegToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'topic':
          result.topic = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GChangeUserPasswordVarsSerializer
    implements StructuredSerializer<GChangeUserPasswordVars> {
  @override
  final Iterable<Type> types = const [
    GChangeUserPasswordVars,
    _$GChangeUserPasswordVars
  ];
  @override
  final String wireName = 'GChangeUserPasswordVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChangeUserPasswordVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'confirmPassword',
      serializers.serialize(object.confirmPassword,
          specifiedType: const FullType(String)),
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GChangeUserPasswordVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChangeUserPasswordVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'confirmPassword':
          result.confirmPassword = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GSendOTPVarsSerializer implements StructuredSerializer<GSendOTPVars> {
  @override
  final Iterable<Type> types = const [GSendOTPVars, _$GSendOTPVars];
  @override
  final String wireName = 'GSendOTPVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSendOTPVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GSendOTPVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSendOTPVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GLNMStatusVarsSerializer
    implements StructuredSerializer<GLNMStatusVars> {
  @override
  final Iterable<Type> types = const [GLNMStatusVars, _$GLNMStatusVars];
  @override
  final String wireName = 'GLNMStatusVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GLNMStatusVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'requestId',
      serializers.serialize(object.requestId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GLNMStatusVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLNMStatusVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GTransactB2CVarsSerializer
    implements StructuredSerializer<GTransactB2CVars> {
  @override
  final Iterable<Type> types = const [GTransactB2CVars, _$GTransactB2CVars];
  @override
  final String wireName = 'GTransactB2CVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTransactB2CVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(String)),
      'callbackUrl',
      serializers.serialize(object.callbackUrl,
          specifiedType: const FullType(String)),
      'occasion',
      serializers.serialize(object.occasion,
          specifiedType: const FullType(String)),
      'remarks',
      serializers.serialize(object.remarks,
          specifiedType: const FullType(String)),
      'queueTimeoutUrl',
      serializers.serialize(object.queueTimeoutUrl,
          specifiedType: const FullType(String)),
      'rideId',
      serializers.serialize(object.rideId, specifiedType: const FullType(int)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GTransactB2CVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTransactB2CVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'callbackUrl':
          result.callbackUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'occasion':
          result.occasion = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'remarks':
          result.remarks = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'queueTimeoutUrl':
          result.queueTimeoutUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rideId':
          result.rideId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserPhoneNumberVarsSerializer
    implements StructuredSerializer<GUpdateUserPhoneNumberVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserPhoneNumberVars,
    _$GUpdateUserPhoneNumberVars
  ];
  @override
  final String wireName = 'GUpdateUserPhoneNumberVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserPhoneNumberVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUpdateUserPhoneNumberVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserPhoneNumberVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserDetailsVarsSerializer
    implements StructuredSerializer<GUpdateUserDetailsVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserDetailsVars,
    _$GUpdateUserDetailsVars
  ];
  @override
  final String wireName = 'GUpdateUserDetailsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserDetailsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'aboutMe',
      serializers.serialize(object.aboutMe,
          specifiedType: const FullType(String)),
      'phoneNumber',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('userName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateUserDetailsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserDetailsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'aboutMe':
          result.aboutMe = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateCarDetailsVarsSerializer
    implements StructuredSerializer<GUpdateCarDetailsVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateCarDetailsVars,
    _$GUpdateCarDetailsVars
  ];
  @override
  final String wireName = 'GUpdateCarDetailsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateCarDetailsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'active',
      serializers.serialize(object.active, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.licensePlate;
    if (value != null) {
      result
        ..add('licensePlate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.model;
    if (value != null) {
      result
        ..add('model')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerId;
    if (value != null) {
      result
        ..add('ownerId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateCarDetailsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateCarDetailsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'licensePlate':
          result.licensePlate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ownerId':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GupdateFMCTokenVarsSerializer
    implements StructuredSerializer<GupdateFMCTokenVars> {
  @override
  final Iterable<Type> types = const [
    GupdateFMCTokenVars,
    _$GupdateFMCTokenVars
  ];
  @override
  final String wireName = 'GupdateFMCTokenVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GupdateFMCTokenVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'fcmToken',
      serializers.serialize(object.fcmToken,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GupdateFMCTokenVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GupdateFMCTokenVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fcmToken':
          result.fcmToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCheckIfUserIsDriverVarsSerializer
    implements StructuredSerializer<GCheckIfUserIsDriverVars> {
  @override
  final Iterable<Type> types = const [
    GCheckIfUserIsDriverVars,
    _$GCheckIfUserIsDriverVars
  ];
  @override
  final String wireName = 'GCheckIfUserIsDriverVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCheckIfUserIsDriverVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'driverRoleId',
      serializers.serialize(object.driverRoleId,
          specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCheckIfUserIsDriverVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCheckIfUserIsDriverVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'driverRoleId':
          result.driverRoleId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAllRolesVarsSerializer
    implements StructuredSerializer<GGetAllRolesVars> {
  @override
  final Iterable<Type> types = const [GGetAllRolesVars, _$GGetAllRolesVars];
  @override
  final String wireName = 'GGetAllRolesVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetAllRolesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetAllRolesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetAllRolesVarsBuilder().build();
  }
}

class _$GGetDriverTripsVarsSerializer
    implements StructuredSerializer<GGetDriverTripsVars> {
  @override
  final Iterable<Type> types = const [
    GGetDriverTripsVars,
    _$GGetDriverTripsVars
  ];
  @override
  final String wireName = 'GGetDriverTripsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDriverTripsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.UserId;
    if (value != null) {
      result
        ..add('UserId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetDriverTripsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDriverTripsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'UserId':
          result.UserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPaidTripsVarsSerializer
    implements StructuredSerializer<GGetPaidTripsVars> {
  @override
  final Iterable<Type> types = const [GGetPaidTripsVars, _$GGetPaidTripsVars];
  @override
  final String wireName = 'GGetPaidTripsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetPaidTripsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetPaidTripsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPaidTripsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserByUserNameVarsSerializer
    implements StructuredSerializer<GGetUserByUserNameVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserByUserNameVars,
    _$GGetUserByUserNameVars
  ];
  @override
  final String wireName = 'GGetUserByUserNameVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserByUserNameVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userName;
    if (value != null) {
      result
        ..add('userName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserByUserNameVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserByUserNameVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterToAndFromRidesVarsSerializer
    implements StructuredSerializer<GFilterToAndFromRidesVars> {
  @override
  final Iterable<Type> types = const [
    GFilterToAndFromRidesVars,
    _$GFilterToAndFromRidesVars
  ];
  @override
  final String wireName = 'GFilterToAndFromRidesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterToAndFromRidesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.searchText;
    if (value != null) {
      result
        ..add('searchText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFilterToAndFromRidesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterToAndFromRidesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'searchText':
          result.searchText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserCarsVarsSerializer
    implements StructuredSerializer<GGetUserCarsVars> {
  @override
  final Iterable<Type> types = const [GGetUserCarsVars, _$GGetUserCarsVars];
  @override
  final String wireName = 'GGetUserCarsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetUserCarsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetUserCarsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserCarsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserWithFilterVarsSerializer
    implements StructuredSerializer<GGetUserWithFilterVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserWithFilterVars,
    _$GGetUserWithFilterVars
  ];
  @override
  final String wireName = 'GGetUserWithFilterVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserWithFilterVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userName',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetUserWithFilterVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserWithFilterVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserByIdVarsSerializer
    implements StructuredSerializer<GGetUserByIdVars> {
  @override
  final Iterable<Type> types = const [GGetUserByIdVars, _$GGetUserByIdVars];
  @override
  final String wireName = 'GGetUserByIdVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetUserByIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetUserByIdVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserByIdVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetOnGoingUserBookingsVarsSerializer
    implements StructuredSerializer<GGetOnGoingUserBookingsVars> {
  @override
  final Iterable<Type> types = const [
    GGetOnGoingUserBookingsVars,
    _$GGetOnGoingUserBookingsVars
  ];
  @override
  final String wireName = 'GGetOnGoingUserBookingsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetOnGoingUserBookingsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetOnGoingUserBookingsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetOnGoingUserBookingsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPastUserBookingsVarsSerializer
    implements StructuredSerializer<GGetPastUserBookingsVars> {
  @override
  final Iterable<Type> types = const [
    GGetPastUserBookingsVars,
    _$GGetPastUserBookingsVars
  ];
  @override
  final String wireName = 'GGetPastUserBookingsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPastUserBookingsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetPastUserBookingsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPastUserBookingsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetRidesVarsSerializer implements StructuredSerializer<GGetRidesVars> {
  @override
  final Iterable<Type> types = const [GGetRidesVars, _$GGetRidesVars];
  @override
  final String wireName = 'GGetRidesVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetRidesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.placeOfStartFilter;
    if (value != null) {
      result
        ..add('placeOfStartFilter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.destinationFilter;
    if (value != null) {
      result
        ..add('destinationFilter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetRidesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetRidesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'placeOfStartFilter':
          result.placeOfStartFilter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'destinationFilter':
          result.destinationFilter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetLatestRidesVarsSerializer
    implements StructuredSerializer<GGetLatestRidesVars> {
  @override
  final Iterable<Type> types = const [
    GGetLatestRidesVars,
    _$GGetLatestRidesVars
  ];
  @override
  final String wireName = 'GGetLatestRidesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetLatestRidesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GGetLatestRidesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetLatestRidesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetRideInfoVarsSerializer
    implements StructuredSerializer<GGetRideInfoVars> {
  @override
  final Iterable<Type> types = const [GGetRideInfoVars, _$GGetRideInfoVars];
  @override
  final String wireName = 'GGetRideInfoVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetRideInfoVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.rideId;
    if (value != null) {
      result
        ..add('rideId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GGetRideInfoVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetRideInfoVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rideId':
          result.rideId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetRideVarsSerializer implements StructuredSerializer<GGetRideVars> {
  @override
  final Iterable<Type> types = const [GGetRideVars, _$GGetRideVars];
  @override
  final String wireName = 'GGetRideVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetRideVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.rideId;
    if (value != null) {
      result
        ..add('rideId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GGetRideVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetRideVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rideId':
          result.rideId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetRidesWithFilterVarsSerializer
    implements StructuredSerializer<GGetRidesWithFilterVars> {
  @override
  final Iterable<Type> types = const [
    GGetRidesWithFilterVars,
    _$GGetRidesWithFilterVars
  ];
  @override
  final String wireName = 'GGetRidesWithFilterVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetRidesWithFilterVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GGetRidesWithFilterVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetRidesWithFilterVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDestinationRidesVarsSerializer
    implements StructuredSerializer<GGetDestinationRidesVars> {
  @override
  final Iterable<Type> types = const [
    GGetDestinationRidesVars,
    _$GGetDestinationRidesVars
  ];
  @override
  final String wireName = 'GGetDestinationRidesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDestinationRidesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'placeOfStart',
      serializers.serialize(object.placeOfStart,
          specifiedType: const FullType(String)),
      'destination',
      serializers.serialize(object.destination,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetDestinationRidesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDestinationRidesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'placeOfStart':
          result.placeOfStart = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GOnGetMessageVarsSerializer
    implements StructuredSerializer<GOnGetMessageVars> {
  @override
  final Iterable<Type> types = const [GOnGetMessageVars, _$GOnGetMessageVars];
  @override
  final String wireName = 'GOnGetMessageVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GOnGetMessageVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GOnGetMessageVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GOnGetMessageVarsBuilder().build();
  }
}

class _$GRegisterUserVars extends GRegisterUserVars {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String phoneNumber;
  @override
  final String nationalId;
  @override
  final String email;
  @override
  final String role;
  @override
  final String userName;
  @override
  final String town;
  @override
  final String cName;
  @override
  final String cCode;
  @override
  final String cAbbrev;
  @override
  final String deviceToken;

  factory _$GRegisterUserVars(
          [void Function(GRegisterUserVarsBuilder)? updates]) =>
      (new GRegisterUserVarsBuilder()..update(updates))._build();

  _$GRegisterUserVars._(
      {required this.firstName,
      required this.lastName,
      required this.password,
      required this.confirmPassword,
      required this.phoneNumber,
      required this.nationalId,
      required this.email,
      required this.role,
      required this.userName,
      required this.town,
      required this.cName,
      required this.cCode,
      required this.cAbbrev,
      required this.deviceToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'GRegisterUserVars', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'GRegisterUserVars', 'lastName');
    BuiltValueNullFieldError.checkNotNull(
        password, r'GRegisterUserVars', 'password');
    BuiltValueNullFieldError.checkNotNull(
        confirmPassword, r'GRegisterUserVars', 'confirmPassword');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'GRegisterUserVars', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(
        nationalId, r'GRegisterUserVars', 'nationalId');
    BuiltValueNullFieldError.checkNotNull(email, r'GRegisterUserVars', 'email');
    BuiltValueNullFieldError.checkNotNull(role, r'GRegisterUserVars', 'role');
    BuiltValueNullFieldError.checkNotNull(
        userName, r'GRegisterUserVars', 'userName');
    BuiltValueNullFieldError.checkNotNull(town, r'GRegisterUserVars', 'town');
    BuiltValueNullFieldError.checkNotNull(cName, r'GRegisterUserVars', 'cName');
    BuiltValueNullFieldError.checkNotNull(cCode, r'GRegisterUserVars', 'cCode');
    BuiltValueNullFieldError.checkNotNull(
        cAbbrev, r'GRegisterUserVars', 'cAbbrev');
    BuiltValueNullFieldError.checkNotNull(
        deviceToken, r'GRegisterUserVars', 'deviceToken');
  }

  @override
  GRegisterUserVars rebuild(void Function(GRegisterUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRegisterUserVarsBuilder toBuilder() =>
      new GRegisterUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRegisterUserVars &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        password == other.password &&
        confirmPassword == other.confirmPassword &&
        phoneNumber == other.phoneNumber &&
        nationalId == other.nationalId &&
        email == other.email &&
        role == other.role &&
        userName == other.userName &&
        town == other.town &&
        cName == other.cName &&
        cCode == other.cCode &&
        cAbbrev == other.cAbbrev &&
        deviceToken == other.deviceToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, confirmPassword.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, nationalId.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, town.hashCode);
    _$hash = $jc(_$hash, cName.hashCode);
    _$hash = $jc(_$hash, cCode.hashCode);
    _$hash = $jc(_$hash, cAbbrev.hashCode);
    _$hash = $jc(_$hash, deviceToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRegisterUserVars')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('password', password)
          ..add('confirmPassword', confirmPassword)
          ..add('phoneNumber', phoneNumber)
          ..add('nationalId', nationalId)
          ..add('email', email)
          ..add('role', role)
          ..add('userName', userName)
          ..add('town', town)
          ..add('cName', cName)
          ..add('cCode', cCode)
          ..add('cAbbrev', cAbbrev)
          ..add('deviceToken', deviceToken))
        .toString();
  }
}

class GRegisterUserVarsBuilder
    implements Builder<GRegisterUserVars, GRegisterUserVarsBuilder> {
  _$GRegisterUserVars? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _confirmPassword;
  String? get confirmPassword => _$this._confirmPassword;
  set confirmPassword(String? confirmPassword) =>
      _$this._confirmPassword = confirmPassword;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _nationalId;
  String? get nationalId => _$this._nationalId;
  set nationalId(String? nationalId) => _$this._nationalId = nationalId;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _town;
  String? get town => _$this._town;
  set town(String? town) => _$this._town = town;

  String? _cName;
  String? get cName => _$this._cName;
  set cName(String? cName) => _$this._cName = cName;

  String? _cCode;
  String? get cCode => _$this._cCode;
  set cCode(String? cCode) => _$this._cCode = cCode;

  String? _cAbbrev;
  String? get cAbbrev => _$this._cAbbrev;
  set cAbbrev(String? cAbbrev) => _$this._cAbbrev = cAbbrev;

  String? _deviceToken;
  String? get deviceToken => _$this._deviceToken;
  set deviceToken(String? deviceToken) => _$this._deviceToken = deviceToken;

  GRegisterUserVarsBuilder();

  GRegisterUserVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _password = $v.password;
      _confirmPassword = $v.confirmPassword;
      _phoneNumber = $v.phoneNumber;
      _nationalId = $v.nationalId;
      _email = $v.email;
      _role = $v.role;
      _userName = $v.userName;
      _town = $v.town;
      _cName = $v.cName;
      _cCode = $v.cCode;
      _cAbbrev = $v.cAbbrev;
      _deviceToken = $v.deviceToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRegisterUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRegisterUserVars;
  }

  @override
  void update(void Function(GRegisterUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRegisterUserVars build() => _build();

  _$GRegisterUserVars _build() {
    final _$result = _$v ??
        new _$GRegisterUserVars._(
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'GRegisterUserVars', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'GRegisterUserVars', 'lastName'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'GRegisterUserVars', 'password'),
            confirmPassword: BuiltValueNullFieldError.checkNotNull(
                confirmPassword, r'GRegisterUserVars', 'confirmPassword'),
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'GRegisterUserVars', 'phoneNumber'),
            nationalId: BuiltValueNullFieldError.checkNotNull(
                nationalId, r'GRegisterUserVars', 'nationalId'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GRegisterUserVars', 'email'),
            role: BuiltValueNullFieldError.checkNotNull(
                role, r'GRegisterUserVars', 'role'),
            userName: BuiltValueNullFieldError.checkNotNull(userName, r'GRegisterUserVars', 'userName'),
            town: BuiltValueNullFieldError.checkNotNull(town, r'GRegisterUserVars', 'town'),
            cName: BuiltValueNullFieldError.checkNotNull(cName, r'GRegisterUserVars', 'cName'),
            cCode: BuiltValueNullFieldError.checkNotNull(cCode, r'GRegisterUserVars', 'cCode'),
            cAbbrev: BuiltValueNullFieldError.checkNotNull(cAbbrev, r'GRegisterUserVars', 'cAbbrev'),
            deviceToken: BuiltValueNullFieldError.checkNotNull(deviceToken, r'GRegisterUserVars', 'deviceToken'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserLoginVars extends GUserLoginVars {
  @override
  final String email;
  @override
  final String password;

  factory _$GUserLoginVars([void Function(GUserLoginVarsBuilder)? updates]) =>
      (new GUserLoginVarsBuilder()..update(updates))._build();

  _$GUserLoginVars._({required this.email, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'GUserLoginVars', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'GUserLoginVars', 'password');
  }

  @override
  GUserLoginVars rebuild(void Function(GUserLoginVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserLoginVarsBuilder toBuilder() =>
      new GUserLoginVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserLoginVars &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserLoginVars')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class GUserLoginVarsBuilder
    implements Builder<GUserLoginVars, GUserLoginVarsBuilder> {
  _$GUserLoginVars? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  GUserLoginVarsBuilder();

  GUserLoginVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserLoginVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserLoginVars;
  }

  @override
  void update(void Function(GUserLoginVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserLoginVars build() => _build();

  _$GUserLoginVars _build() {
    final _$result = _$v ??
        new _$GUserLoginVars._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GUserLoginVars', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'GUserLoginVars', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateLicenceDocumentsVars extends GUpdateLicenceDocumentsVars {
  @override
  final String email;
  @override
  final String updatedBy;
  @override
  final String licenseFront;
  @override
  final String licenseRear;
  @override
  final String nationalIdFront;
  @override
  final String nationalIdBack;
  @override
  final int id;

  factory _$GUpdateLicenceDocumentsVars(
          [void Function(GUpdateLicenceDocumentsVarsBuilder)? updates]) =>
      (new GUpdateLicenceDocumentsVarsBuilder()..update(updates))._build();

  _$GUpdateLicenceDocumentsVars._(
      {required this.email,
      required this.updatedBy,
      required this.licenseFront,
      required this.licenseRear,
      required this.nationalIdFront,
      required this.nationalIdBack,
      required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        email, r'GUpdateLicenceDocumentsVars', 'email');
    BuiltValueNullFieldError.checkNotNull(
        updatedBy, r'GUpdateLicenceDocumentsVars', 'updatedBy');
    BuiltValueNullFieldError.checkNotNull(
        licenseFront, r'GUpdateLicenceDocumentsVars', 'licenseFront');
    BuiltValueNullFieldError.checkNotNull(
        licenseRear, r'GUpdateLicenceDocumentsVars', 'licenseRear');
    BuiltValueNullFieldError.checkNotNull(
        nationalIdFront, r'GUpdateLicenceDocumentsVars', 'nationalIdFront');
    BuiltValueNullFieldError.checkNotNull(
        nationalIdBack, r'GUpdateLicenceDocumentsVars', 'nationalIdBack');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateLicenceDocumentsVars', 'id');
  }

  @override
  GUpdateLicenceDocumentsVars rebuild(
          void Function(GUpdateLicenceDocumentsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateLicenceDocumentsVarsBuilder toBuilder() =>
      new GUpdateLicenceDocumentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateLicenceDocumentsVars &&
        email == other.email &&
        updatedBy == other.updatedBy &&
        licenseFront == other.licenseFront &&
        licenseRear == other.licenseRear &&
        nationalIdFront == other.nationalIdFront &&
        nationalIdBack == other.nationalIdBack &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, updatedBy.hashCode);
    _$hash = $jc(_$hash, licenseFront.hashCode);
    _$hash = $jc(_$hash, licenseRear.hashCode);
    _$hash = $jc(_$hash, nationalIdFront.hashCode);
    _$hash = $jc(_$hash, nationalIdBack.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateLicenceDocumentsVars')
          ..add('email', email)
          ..add('updatedBy', updatedBy)
          ..add('licenseFront', licenseFront)
          ..add('licenseRear', licenseRear)
          ..add('nationalIdFront', nationalIdFront)
          ..add('nationalIdBack', nationalIdBack)
          ..add('id', id))
        .toString();
  }
}

class GUpdateLicenceDocumentsVarsBuilder
    implements
        Builder<GUpdateLicenceDocumentsVars,
            GUpdateLicenceDocumentsVarsBuilder> {
  _$GUpdateLicenceDocumentsVars? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _updatedBy;
  String? get updatedBy => _$this._updatedBy;
  set updatedBy(String? updatedBy) => _$this._updatedBy = updatedBy;

  String? _licenseFront;
  String? get licenseFront => _$this._licenseFront;
  set licenseFront(String? licenseFront) => _$this._licenseFront = licenseFront;

  String? _licenseRear;
  String? get licenseRear => _$this._licenseRear;
  set licenseRear(String? licenseRear) => _$this._licenseRear = licenseRear;

  String? _nationalIdFront;
  String? get nationalIdFront => _$this._nationalIdFront;
  set nationalIdFront(String? nationalIdFront) =>
      _$this._nationalIdFront = nationalIdFront;

  String? _nationalIdBack;
  String? get nationalIdBack => _$this._nationalIdBack;
  set nationalIdBack(String? nationalIdBack) =>
      _$this._nationalIdBack = nationalIdBack;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GUpdateLicenceDocumentsVarsBuilder();

  GUpdateLicenceDocumentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _updatedBy = $v.updatedBy;
      _licenseFront = $v.licenseFront;
      _licenseRear = $v.licenseRear;
      _nationalIdFront = $v.nationalIdFront;
      _nationalIdBack = $v.nationalIdBack;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateLicenceDocumentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateLicenceDocumentsVars;
  }

  @override
  void update(void Function(GUpdateLicenceDocumentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateLicenceDocumentsVars build() => _build();

  _$GUpdateLicenceDocumentsVars _build() {
    final _$result = _$v ??
        new _$GUpdateLicenceDocumentsVars._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GUpdateLicenceDocumentsVars', 'email'),
            updatedBy: BuiltValueNullFieldError.checkNotNull(
                updatedBy, r'GUpdateLicenceDocumentsVars', 'updatedBy'),
            licenseFront: BuiltValueNullFieldError.checkNotNull(
                licenseFront, r'GUpdateLicenceDocumentsVars', 'licenseFront'),
            licenseRear: BuiltValueNullFieldError.checkNotNull(
                licenseRear, r'GUpdateLicenceDocumentsVars', 'licenseRear'),
            nationalIdFront: BuiltValueNullFieldError.checkNotNull(
                nationalIdFront,
                r'GUpdateLicenceDocumentsVars',
                'nationalIdFront'),
            nationalIdBack: BuiltValueNullFieldError.checkNotNull(
                nationalIdBack, r'GUpdateLicenceDocumentsVars', 'nationalIdBack'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateLicenceDocumentsVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateARideVars extends GCreateARideVars {
  @override
  final String placeOfStart;
  @override
  final double estimatePrice;
  @override
  final String name;
  @override
  final String destination;
  @override
  final String departureDate;
  @override
  final String estimateTime;
  @override
  final String estimateDistance;
  @override
  final int numberOfPeople;
  @override
  final int maxCarry;
  @override
  final String carId;
  @override
  final String? backCentre;
  @override
  final String? backRight;
  @override
  final String? backLeft;
  @override
  final String? frontLeft;
  @override
  final String? middleCentre;
  @override
  final String? middleLeft;
  @override
  final String? middleRight;
  @override
  final String departureTime;
  @override
  final int? rideIndex;

  factory _$GCreateARideVars(
          [void Function(GCreateARideVarsBuilder)? updates]) =>
      (new GCreateARideVarsBuilder()..update(updates))._build();

  _$GCreateARideVars._(
      {required this.placeOfStart,
      required this.estimatePrice,
      required this.name,
      required this.destination,
      required this.departureDate,
      required this.estimateTime,
      required this.estimateDistance,
      required this.numberOfPeople,
      required this.maxCarry,
      required this.carId,
      this.backCentre,
      this.backRight,
      this.backLeft,
      this.frontLeft,
      this.middleCentre,
      this.middleLeft,
      this.middleRight,
      required this.departureTime,
      this.rideIndex})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        placeOfStart, r'GCreateARideVars', 'placeOfStart');
    BuiltValueNullFieldError.checkNotNull(
        estimatePrice, r'GCreateARideVars', 'estimatePrice');
    BuiltValueNullFieldError.checkNotNull(name, r'GCreateARideVars', 'name');
    BuiltValueNullFieldError.checkNotNull(
        destination, r'GCreateARideVars', 'destination');
    BuiltValueNullFieldError.checkNotNull(
        departureDate, r'GCreateARideVars', 'departureDate');
    BuiltValueNullFieldError.checkNotNull(
        estimateTime, r'GCreateARideVars', 'estimateTime');
    BuiltValueNullFieldError.checkNotNull(
        estimateDistance, r'GCreateARideVars', 'estimateDistance');
    BuiltValueNullFieldError.checkNotNull(
        numberOfPeople, r'GCreateARideVars', 'numberOfPeople');
    BuiltValueNullFieldError.checkNotNull(
        maxCarry, r'GCreateARideVars', 'maxCarry');
    BuiltValueNullFieldError.checkNotNull(carId, r'GCreateARideVars', 'carId');
    BuiltValueNullFieldError.checkNotNull(
        departureTime, r'GCreateARideVars', 'departureTime');
  }

  @override
  GCreateARideVars rebuild(void Function(GCreateARideVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateARideVarsBuilder toBuilder() =>
      new GCreateARideVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateARideVars &&
        placeOfStart == other.placeOfStart &&
        estimatePrice == other.estimatePrice &&
        name == other.name &&
        destination == other.destination &&
        departureDate == other.departureDate &&
        estimateTime == other.estimateTime &&
        estimateDistance == other.estimateDistance &&
        numberOfPeople == other.numberOfPeople &&
        maxCarry == other.maxCarry &&
        carId == other.carId &&
        backCentre == other.backCentre &&
        backRight == other.backRight &&
        backLeft == other.backLeft &&
        frontLeft == other.frontLeft &&
        middleCentre == other.middleCentre &&
        middleLeft == other.middleLeft &&
        middleRight == other.middleRight &&
        departureTime == other.departureTime &&
        rideIndex == other.rideIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, placeOfStart.hashCode);
    _$hash = $jc(_$hash, estimatePrice.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, destination.hashCode);
    _$hash = $jc(_$hash, departureDate.hashCode);
    _$hash = $jc(_$hash, estimateTime.hashCode);
    _$hash = $jc(_$hash, estimateDistance.hashCode);
    _$hash = $jc(_$hash, numberOfPeople.hashCode);
    _$hash = $jc(_$hash, maxCarry.hashCode);
    _$hash = $jc(_$hash, carId.hashCode);
    _$hash = $jc(_$hash, backCentre.hashCode);
    _$hash = $jc(_$hash, backRight.hashCode);
    _$hash = $jc(_$hash, backLeft.hashCode);
    _$hash = $jc(_$hash, frontLeft.hashCode);
    _$hash = $jc(_$hash, middleCentre.hashCode);
    _$hash = $jc(_$hash, middleLeft.hashCode);
    _$hash = $jc(_$hash, middleRight.hashCode);
    _$hash = $jc(_$hash, departureTime.hashCode);
    _$hash = $jc(_$hash, rideIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateARideVars')
          ..add('placeOfStart', placeOfStart)
          ..add('estimatePrice', estimatePrice)
          ..add('name', name)
          ..add('destination', destination)
          ..add('departureDate', departureDate)
          ..add('estimateTime', estimateTime)
          ..add('estimateDistance', estimateDistance)
          ..add('numberOfPeople', numberOfPeople)
          ..add('maxCarry', maxCarry)
          ..add('carId', carId)
          ..add('backCentre', backCentre)
          ..add('backRight', backRight)
          ..add('backLeft', backLeft)
          ..add('frontLeft', frontLeft)
          ..add('middleCentre', middleCentre)
          ..add('middleLeft', middleLeft)
          ..add('middleRight', middleRight)
          ..add('departureTime', departureTime)
          ..add('rideIndex', rideIndex))
        .toString();
  }
}

class GCreateARideVarsBuilder
    implements Builder<GCreateARideVars, GCreateARideVarsBuilder> {
  _$GCreateARideVars? _$v;

  String? _placeOfStart;
  String? get placeOfStart => _$this._placeOfStart;
  set placeOfStart(String? placeOfStart) => _$this._placeOfStart = placeOfStart;

  double? _estimatePrice;
  double? get estimatePrice => _$this._estimatePrice;
  set estimatePrice(double? estimatePrice) =>
      _$this._estimatePrice = estimatePrice;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _destination;
  String? get destination => _$this._destination;
  set destination(String? destination) => _$this._destination = destination;

  String? _departureDate;
  String? get departureDate => _$this._departureDate;
  set departureDate(String? departureDate) =>
      _$this._departureDate = departureDate;

  String? _estimateTime;
  String? get estimateTime => _$this._estimateTime;
  set estimateTime(String? estimateTime) => _$this._estimateTime = estimateTime;

  String? _estimateDistance;
  String? get estimateDistance => _$this._estimateDistance;
  set estimateDistance(String? estimateDistance) =>
      _$this._estimateDistance = estimateDistance;

  int? _numberOfPeople;
  int? get numberOfPeople => _$this._numberOfPeople;
  set numberOfPeople(int? numberOfPeople) =>
      _$this._numberOfPeople = numberOfPeople;

  int? _maxCarry;
  int? get maxCarry => _$this._maxCarry;
  set maxCarry(int? maxCarry) => _$this._maxCarry = maxCarry;

  String? _carId;
  String? get carId => _$this._carId;
  set carId(String? carId) => _$this._carId = carId;

  String? _backCentre;
  String? get backCentre => _$this._backCentre;
  set backCentre(String? backCentre) => _$this._backCentre = backCentre;

  String? _backRight;
  String? get backRight => _$this._backRight;
  set backRight(String? backRight) => _$this._backRight = backRight;

  String? _backLeft;
  String? get backLeft => _$this._backLeft;
  set backLeft(String? backLeft) => _$this._backLeft = backLeft;

  String? _frontLeft;
  String? get frontLeft => _$this._frontLeft;
  set frontLeft(String? frontLeft) => _$this._frontLeft = frontLeft;

  String? _middleCentre;
  String? get middleCentre => _$this._middleCentre;
  set middleCentre(String? middleCentre) => _$this._middleCentre = middleCentre;

  String? _middleLeft;
  String? get middleLeft => _$this._middleLeft;
  set middleLeft(String? middleLeft) => _$this._middleLeft = middleLeft;

  String? _middleRight;
  String? get middleRight => _$this._middleRight;
  set middleRight(String? middleRight) => _$this._middleRight = middleRight;

  String? _departureTime;
  String? get departureTime => _$this._departureTime;
  set departureTime(String? departureTime) =>
      _$this._departureTime = departureTime;

  int? _rideIndex;
  int? get rideIndex => _$this._rideIndex;
  set rideIndex(int? rideIndex) => _$this._rideIndex = rideIndex;

  GCreateARideVarsBuilder();

  GCreateARideVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _placeOfStart = $v.placeOfStart;
      _estimatePrice = $v.estimatePrice;
      _name = $v.name;
      _destination = $v.destination;
      _departureDate = $v.departureDate;
      _estimateTime = $v.estimateTime;
      _estimateDistance = $v.estimateDistance;
      _numberOfPeople = $v.numberOfPeople;
      _maxCarry = $v.maxCarry;
      _carId = $v.carId;
      _backCentre = $v.backCentre;
      _backRight = $v.backRight;
      _backLeft = $v.backLeft;
      _frontLeft = $v.frontLeft;
      _middleCentre = $v.middleCentre;
      _middleLeft = $v.middleLeft;
      _middleRight = $v.middleRight;
      _departureTime = $v.departureTime;
      _rideIndex = $v.rideIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateARideVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateARideVars;
  }

  @override
  void update(void Function(GCreateARideVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateARideVars build() => _build();

  _$GCreateARideVars _build() {
    final _$result = _$v ??
        new _$GCreateARideVars._(
            placeOfStart: BuiltValueNullFieldError.checkNotNull(
                placeOfStart, r'GCreateARideVars', 'placeOfStart'),
            estimatePrice: BuiltValueNullFieldError.checkNotNull(
                estimatePrice, r'GCreateARideVars', 'estimatePrice'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GCreateARideVars', 'name'),
            destination: BuiltValueNullFieldError.checkNotNull(
                destination, r'GCreateARideVars', 'destination'),
            departureDate: BuiltValueNullFieldError.checkNotNull(
                departureDate, r'GCreateARideVars', 'departureDate'),
            estimateTime: BuiltValueNullFieldError.checkNotNull(
                estimateTime, r'GCreateARideVars', 'estimateTime'),
            estimateDistance: BuiltValueNullFieldError.checkNotNull(
                estimateDistance, r'GCreateARideVars', 'estimateDistance'),
            numberOfPeople: BuiltValueNullFieldError.checkNotNull(
                numberOfPeople, r'GCreateARideVars', 'numberOfPeople'),
            maxCarry: BuiltValueNullFieldError.checkNotNull(maxCarry, r'GCreateARideVars', 'maxCarry'),
            carId: BuiltValueNullFieldError.checkNotNull(carId, r'GCreateARideVars', 'carId'),
            backCentre: backCentre,
            backRight: backRight,
            backLeft: backLeft,
            frontLeft: frontLeft,
            middleCentre: middleCentre,
            middleLeft: middleLeft,
            middleRight: middleRight,
            departureTime: BuiltValueNullFieldError.checkNotNull(departureTime, r'GCreateARideVars', 'departureTime'),
            rideIndex: rideIndex);
    replace(_$result);
    return _$result;
  }
}

class _$GTransactionVars extends GTransactionVars {
  @override
  final String phoneNumber;
  @override
  final String amount;
  @override
  final String callBackUrl;

  factory _$GTransactionVars(
          [void Function(GTransactionVarsBuilder)? updates]) =>
      (new GTransactionVarsBuilder()..update(updates))._build();

  _$GTransactionVars._(
      {required this.phoneNumber,
      required this.amount,
      required this.callBackUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'GTransactionVars', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GTransactionVars', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        callBackUrl, r'GTransactionVars', 'callBackUrl');
  }

  @override
  GTransactionVars rebuild(void Function(GTransactionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTransactionVarsBuilder toBuilder() =>
      new GTransactionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTransactionVars &&
        phoneNumber == other.phoneNumber &&
        amount == other.amount &&
        callBackUrl == other.callBackUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, callBackUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTransactionVars')
          ..add('phoneNumber', phoneNumber)
          ..add('amount', amount)
          ..add('callBackUrl', callBackUrl))
        .toString();
  }
}

class GTransactionVarsBuilder
    implements Builder<GTransactionVars, GTransactionVarsBuilder> {
  _$GTransactionVars? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  String? _callBackUrl;
  String? get callBackUrl => _$this._callBackUrl;
  set callBackUrl(String? callBackUrl) => _$this._callBackUrl = callBackUrl;

  GTransactionVarsBuilder();

  GTransactionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _amount = $v.amount;
      _callBackUrl = $v.callBackUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTransactionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTransactionVars;
  }

  @override
  void update(void Function(GTransactionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTransactionVars build() => _build();

  _$GTransactionVars _build() {
    final _$result = _$v ??
        new _$GTransactionVars._(
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'GTransactionVars', 'phoneNumber'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GTransactionVars', 'amount'),
            callBackUrl: BuiltValueNullFieldError.checkNotNull(
                callBackUrl, r'GTransactionVars', 'callBackUrl'));
    replace(_$result);
    return _$result;
  }
}

class _$GSaveUserFileVars extends GSaveUserFileVars {
  @override
  final String fileName;
  @override
  final String fileExtension;
  @override
  final _i2.GUploadType uploadType;
  @override
  final String data;

  factory _$GSaveUserFileVars(
          [void Function(GSaveUserFileVarsBuilder)? updates]) =>
      (new GSaveUserFileVarsBuilder()..update(updates))._build();

  _$GSaveUserFileVars._(
      {required this.fileName,
      required this.fileExtension,
      required this.uploadType,
      required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fileName, r'GSaveUserFileVars', 'fileName');
    BuiltValueNullFieldError.checkNotNull(
        fileExtension, r'GSaveUserFileVars', 'fileExtension');
    BuiltValueNullFieldError.checkNotNull(
        uploadType, r'GSaveUserFileVars', 'uploadType');
    BuiltValueNullFieldError.checkNotNull(data, r'GSaveUserFileVars', 'data');
  }

  @override
  GSaveUserFileVars rebuild(void Function(GSaveUserFileVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSaveUserFileVarsBuilder toBuilder() =>
      new GSaveUserFileVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSaveUserFileVars &&
        fileName == other.fileName &&
        fileExtension == other.fileExtension &&
        uploadType == other.uploadType &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, fileExtension.hashCode);
    _$hash = $jc(_$hash, uploadType.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSaveUserFileVars')
          ..add('fileName', fileName)
          ..add('fileExtension', fileExtension)
          ..add('uploadType', uploadType)
          ..add('data', data))
        .toString();
  }
}

class GSaveUserFileVarsBuilder
    implements Builder<GSaveUserFileVars, GSaveUserFileVarsBuilder> {
  _$GSaveUserFileVars? _$v;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _fileExtension;
  String? get fileExtension => _$this._fileExtension;
  set fileExtension(String? fileExtension) =>
      _$this._fileExtension = fileExtension;

  _i2.GUploadType? _uploadType;
  _i2.GUploadType? get uploadType => _$this._uploadType;
  set uploadType(_i2.GUploadType? uploadType) =>
      _$this._uploadType = uploadType;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  GSaveUserFileVarsBuilder();

  GSaveUserFileVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fileName = $v.fileName;
      _fileExtension = $v.fileExtension;
      _uploadType = $v.uploadType;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSaveUserFileVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSaveUserFileVars;
  }

  @override
  void update(void Function(GSaveUserFileVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSaveUserFileVars build() => _build();

  _$GSaveUserFileVars _build() {
    final _$result = _$v ??
        new _$GSaveUserFileVars._(
            fileName: BuiltValueNullFieldError.checkNotNull(
                fileName, r'GSaveUserFileVars', 'fileName'),
            fileExtension: BuiltValueNullFieldError.checkNotNull(
                fileExtension, r'GSaveUserFileVars', 'fileExtension'),
            uploadType: BuiltValueNullFieldError.checkNotNull(
                uploadType, r'GSaveUserFileVars', 'uploadType'),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'GSaveUserFileVars', 'data'));
    replace(_$result);
    return _$result;
  }
}

class _$GSaveUserFileStringVars extends GSaveUserFileStringVars {
  @override
  final String fileName;
  @override
  final String fileExtension;
  @override
  final _i2.GUploadType uploadType;
  @override
  final String data;

  factory _$GSaveUserFileStringVars(
          [void Function(GSaveUserFileStringVarsBuilder)? updates]) =>
      (new GSaveUserFileStringVarsBuilder()..update(updates))._build();

  _$GSaveUserFileStringVars._(
      {required this.fileName,
      required this.fileExtension,
      required this.uploadType,
      required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fileName, r'GSaveUserFileStringVars', 'fileName');
    BuiltValueNullFieldError.checkNotNull(
        fileExtension, r'GSaveUserFileStringVars', 'fileExtension');
    BuiltValueNullFieldError.checkNotNull(
        uploadType, r'GSaveUserFileStringVars', 'uploadType');
    BuiltValueNullFieldError.checkNotNull(
        data, r'GSaveUserFileStringVars', 'data');
  }

  @override
  GSaveUserFileStringVars rebuild(
          void Function(GSaveUserFileStringVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSaveUserFileStringVarsBuilder toBuilder() =>
      new GSaveUserFileStringVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSaveUserFileStringVars &&
        fileName == other.fileName &&
        fileExtension == other.fileExtension &&
        uploadType == other.uploadType &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, fileExtension.hashCode);
    _$hash = $jc(_$hash, uploadType.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSaveUserFileStringVars')
          ..add('fileName', fileName)
          ..add('fileExtension', fileExtension)
          ..add('uploadType', uploadType)
          ..add('data', data))
        .toString();
  }
}

class GSaveUserFileStringVarsBuilder
    implements
        Builder<GSaveUserFileStringVars, GSaveUserFileStringVarsBuilder> {
  _$GSaveUserFileStringVars? _$v;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _fileExtension;
  String? get fileExtension => _$this._fileExtension;
  set fileExtension(String? fileExtension) =>
      _$this._fileExtension = fileExtension;

  _i2.GUploadType? _uploadType;
  _i2.GUploadType? get uploadType => _$this._uploadType;
  set uploadType(_i2.GUploadType? uploadType) =>
      _$this._uploadType = uploadType;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  GSaveUserFileStringVarsBuilder();

  GSaveUserFileStringVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fileName = $v.fileName;
      _fileExtension = $v.fileExtension;
      _uploadType = $v.uploadType;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSaveUserFileStringVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSaveUserFileStringVars;
  }

  @override
  void update(void Function(GSaveUserFileStringVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSaveUserFileStringVars build() => _build();

  _$GSaveUserFileStringVars _build() {
    final _$result = _$v ??
        new _$GSaveUserFileStringVars._(
            fileName: BuiltValueNullFieldError.checkNotNull(
                fileName, r'GSaveUserFileStringVars', 'fileName'),
            fileExtension: BuiltValueNullFieldError.checkNotNull(
                fileExtension, r'GSaveUserFileStringVars', 'fileExtension'),
            uploadType: BuiltValueNullFieldError.checkNotNull(
                uploadType, r'GSaveUserFileStringVars', 'uploadType'),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'GSaveUserFileStringVars', 'data'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateCarVars extends GCreateCarVars {
  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final bool active;
  @override
  final String color;
  @override
  final String licensePlate;
  @override
  final String model;
  @override
  final String ownerId;

  factory _$GCreateCarVars([void Function(GCreateCarVarsBuilder)? updates]) =>
      (new GCreateCarVarsBuilder()..update(updates))._build();

  _$GCreateCarVars._(
      {required this.id,
      required this.imageUrl,
      required this.active,
      required this.color,
      required this.licensePlate,
      required this.model,
      required this.ownerId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GCreateCarVars', 'id');
    BuiltValueNullFieldError.checkNotNull(
        imageUrl, r'GCreateCarVars', 'imageUrl');
    BuiltValueNullFieldError.checkNotNull(active, r'GCreateCarVars', 'active');
    BuiltValueNullFieldError.checkNotNull(color, r'GCreateCarVars', 'color');
    BuiltValueNullFieldError.checkNotNull(
        licensePlate, r'GCreateCarVars', 'licensePlate');
    BuiltValueNullFieldError.checkNotNull(model, r'GCreateCarVars', 'model');
    BuiltValueNullFieldError.checkNotNull(
        ownerId, r'GCreateCarVars', 'ownerId');
  }

  @override
  GCreateCarVars rebuild(void Function(GCreateCarVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCarVarsBuilder toBuilder() =>
      new GCreateCarVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCarVars &&
        id == other.id &&
        imageUrl == other.imageUrl &&
        active == other.active &&
        color == other.color &&
        licensePlate == other.licensePlate &&
        model == other.model &&
        ownerId == other.ownerId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, licensePlate.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, ownerId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateCarVars')
          ..add('id', id)
          ..add('imageUrl', imageUrl)
          ..add('active', active)
          ..add('color', color)
          ..add('licensePlate', licensePlate)
          ..add('model', model)
          ..add('ownerId', ownerId))
        .toString();
  }
}

class GCreateCarVarsBuilder
    implements Builder<GCreateCarVars, GCreateCarVarsBuilder> {
  _$GCreateCarVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _licensePlate;
  String? get licensePlate => _$this._licensePlate;
  set licensePlate(String? licensePlate) => _$this._licensePlate = licensePlate;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _ownerId;
  String? get ownerId => _$this._ownerId;
  set ownerId(String? ownerId) => _$this._ownerId = ownerId;

  GCreateCarVarsBuilder();

  GCreateCarVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _imageUrl = $v.imageUrl;
      _active = $v.active;
      _color = $v.color;
      _licensePlate = $v.licensePlate;
      _model = $v.model;
      _ownerId = $v.ownerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCarVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateCarVars;
  }

  @override
  void update(void Function(GCreateCarVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCarVars build() => _build();

  _$GCreateCarVars _build() {
    final _$result = _$v ??
        new _$GCreateCarVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateCarVars', 'id'),
            imageUrl: BuiltValueNullFieldError.checkNotNull(
                imageUrl, r'GCreateCarVars', 'imageUrl'),
            active: BuiltValueNullFieldError.checkNotNull(
                active, r'GCreateCarVars', 'active'),
            color: BuiltValueNullFieldError.checkNotNull(
                color, r'GCreateCarVars', 'color'),
            licensePlate: BuiltValueNullFieldError.checkNotNull(
                licensePlate, r'GCreateCarVars', 'licensePlate'),
            model: BuiltValueNullFieldError.checkNotNull(
                model, r'GCreateCarVars', 'model'),
            ownerId: BuiltValueNullFieldError.checkNotNull(
                ownerId, r'GCreateCarVars', 'ownerId'));
    replace(_$result);
    return _$result;
  }
}

class _$GAddChatVars extends GAddChatVars {
  @override
  final String id;
  @override
  final String deviceRegToken;
  @override
  final String from;
  @override
  final String to;
  @override
  final String topic;
  @override
  final String message;

  factory _$GAddChatVars([void Function(GAddChatVarsBuilder)? updates]) =>
      (new GAddChatVarsBuilder()..update(updates))._build();

  _$GAddChatVars._(
      {required this.id,
      required this.deviceRegToken,
      required this.from,
      required this.to,
      required this.topic,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GAddChatVars', 'id');
    BuiltValueNullFieldError.checkNotNull(
        deviceRegToken, r'GAddChatVars', 'deviceRegToken');
    BuiltValueNullFieldError.checkNotNull(from, r'GAddChatVars', 'from');
    BuiltValueNullFieldError.checkNotNull(to, r'GAddChatVars', 'to');
    BuiltValueNullFieldError.checkNotNull(topic, r'GAddChatVars', 'topic');
    BuiltValueNullFieldError.checkNotNull(message, r'GAddChatVars', 'message');
  }

  @override
  GAddChatVars rebuild(void Function(GAddChatVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddChatVarsBuilder toBuilder() => new GAddChatVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddChatVars &&
        id == other.id &&
        deviceRegToken == other.deviceRegToken &&
        from == other.from &&
        to == other.to &&
        topic == other.topic &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, deviceRegToken.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, topic.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddChatVars')
          ..add('id', id)
          ..add('deviceRegToken', deviceRegToken)
          ..add('from', from)
          ..add('to', to)
          ..add('topic', topic)
          ..add('message', message))
        .toString();
  }
}

class GAddChatVarsBuilder
    implements Builder<GAddChatVars, GAddChatVarsBuilder> {
  _$GAddChatVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _deviceRegToken;
  String? get deviceRegToken => _$this._deviceRegToken;
  set deviceRegToken(String? deviceRegToken) =>
      _$this._deviceRegToken = deviceRegToken;

  String? _from;
  String? get from => _$this._from;
  set from(String? from) => _$this._from = from;

  String? _to;
  String? get to => _$this._to;
  set to(String? to) => _$this._to = to;

  String? _topic;
  String? get topic => _$this._topic;
  set topic(String? topic) => _$this._topic = topic;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  GAddChatVarsBuilder();

  GAddChatVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _deviceRegToken = $v.deviceRegToken;
      _from = $v.from;
      _to = $v.to;
      _topic = $v.topic;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddChatVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddChatVars;
  }

  @override
  void update(void Function(GAddChatVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddChatVars build() => _build();

  _$GAddChatVars _build() {
    final _$result = _$v ??
        new _$GAddChatVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAddChatVars', 'id'),
            deviceRegToken: BuiltValueNullFieldError.checkNotNull(
                deviceRegToken, r'GAddChatVars', 'deviceRegToken'),
            from: BuiltValueNullFieldError.checkNotNull(
                from, r'GAddChatVars', 'from'),
            to: BuiltValueNullFieldError.checkNotNull(
                to, r'GAddChatVars', 'to'),
            topic: BuiltValueNullFieldError.checkNotNull(
                topic, r'GAddChatVars', 'topic'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'GAddChatVars', 'message'));
    replace(_$result);
    return _$result;
  }
}

class _$GChangeUserPasswordVars extends GChangeUserPasswordVars {
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String phoneNumber;

  factory _$GChangeUserPasswordVars(
          [void Function(GChangeUserPasswordVarsBuilder)? updates]) =>
      (new GChangeUserPasswordVarsBuilder()..update(updates))._build();

  _$GChangeUserPasswordVars._(
      {required this.password,
      required this.confirmPassword,
      required this.phoneNumber})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        password, r'GChangeUserPasswordVars', 'password');
    BuiltValueNullFieldError.checkNotNull(
        confirmPassword, r'GChangeUserPasswordVars', 'confirmPassword');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'GChangeUserPasswordVars', 'phoneNumber');
  }

  @override
  GChangeUserPasswordVars rebuild(
          void Function(GChangeUserPasswordVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChangeUserPasswordVarsBuilder toBuilder() =>
      new GChangeUserPasswordVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChangeUserPasswordVars &&
        password == other.password &&
        confirmPassword == other.confirmPassword &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, confirmPassword.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GChangeUserPasswordVars')
          ..add('password', password)
          ..add('confirmPassword', confirmPassword)
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class GChangeUserPasswordVarsBuilder
    implements
        Builder<GChangeUserPasswordVars, GChangeUserPasswordVarsBuilder> {
  _$GChangeUserPasswordVars? _$v;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _confirmPassword;
  String? get confirmPassword => _$this._confirmPassword;
  set confirmPassword(String? confirmPassword) =>
      _$this._confirmPassword = confirmPassword;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  GChangeUserPasswordVarsBuilder();

  GChangeUserPasswordVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _password = $v.password;
      _confirmPassword = $v.confirmPassword;
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChangeUserPasswordVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChangeUserPasswordVars;
  }

  @override
  void update(void Function(GChangeUserPasswordVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChangeUserPasswordVars build() => _build();

  _$GChangeUserPasswordVars _build() {
    final _$result = _$v ??
        new _$GChangeUserPasswordVars._(
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'GChangeUserPasswordVars', 'password'),
            confirmPassword: BuiltValueNullFieldError.checkNotNull(
                confirmPassword, r'GChangeUserPasswordVars', 'confirmPassword'),
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'GChangeUserPasswordVars', 'phoneNumber'));
    replace(_$result);
    return _$result;
  }
}

class _$GSendOTPVars extends GSendOTPVars {
  @override
  final String phone;
  @override
  final String email;

  factory _$GSendOTPVars([void Function(GSendOTPVarsBuilder)? updates]) =>
      (new GSendOTPVarsBuilder()..update(updates))._build();

  _$GSendOTPVars._({required this.phone, required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(phone, r'GSendOTPVars', 'phone');
    BuiltValueNullFieldError.checkNotNull(email, r'GSendOTPVars', 'email');
  }

  @override
  GSendOTPVars rebuild(void Function(GSendOTPVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSendOTPVarsBuilder toBuilder() => new GSendOTPVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSendOTPVars &&
        phone == other.phone &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSendOTPVars')
          ..add('phone', phone)
          ..add('email', email))
        .toString();
  }
}

class GSendOTPVarsBuilder
    implements Builder<GSendOTPVars, GSendOTPVarsBuilder> {
  _$GSendOTPVars? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  GSendOTPVarsBuilder();

  GSendOTPVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSendOTPVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSendOTPVars;
  }

  @override
  void update(void Function(GSendOTPVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSendOTPVars build() => _build();

  _$GSendOTPVars _build() {
    final _$result = _$v ??
        new _$GSendOTPVars._(
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'GSendOTPVars', 'phone'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GSendOTPVars', 'email'));
    replace(_$result);
    return _$result;
  }
}

class _$GLNMStatusVars extends GLNMStatusVars {
  @override
  final String requestId;

  factory _$GLNMStatusVars([void Function(GLNMStatusVarsBuilder)? updates]) =>
      (new GLNMStatusVarsBuilder()..update(updates))._build();

  _$GLNMStatusVars._({required this.requestId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        requestId, r'GLNMStatusVars', 'requestId');
  }

  @override
  GLNMStatusVars rebuild(void Function(GLNMStatusVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLNMStatusVarsBuilder toBuilder() =>
      new GLNMStatusVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLNMStatusVars && requestId == other.requestId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, requestId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GLNMStatusVars')
          ..add('requestId', requestId))
        .toString();
  }
}

class GLNMStatusVarsBuilder
    implements Builder<GLNMStatusVars, GLNMStatusVarsBuilder> {
  _$GLNMStatusVars? _$v;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  GLNMStatusVarsBuilder();

  GLNMStatusVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requestId = $v.requestId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLNMStatusVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLNMStatusVars;
  }

  @override
  void update(void Function(GLNMStatusVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLNMStatusVars build() => _build();

  _$GLNMStatusVars _build() {
    final _$result = _$v ??
        new _$GLNMStatusVars._(
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, r'GLNMStatusVars', 'requestId'));
    replace(_$result);
    return _$result;
  }
}

class _$GTransactB2CVars extends GTransactB2CVars {
  @override
  final String phoneNumber;
  @override
  final String amount;
  @override
  final String callbackUrl;
  @override
  final String occasion;
  @override
  final String remarks;
  @override
  final String queueTimeoutUrl;
  @override
  final int rideId;
  @override
  final String userId;

  factory _$GTransactB2CVars(
          [void Function(GTransactB2CVarsBuilder)? updates]) =>
      (new GTransactB2CVarsBuilder()..update(updates))._build();

  _$GTransactB2CVars._(
      {required this.phoneNumber,
      required this.amount,
      required this.callbackUrl,
      required this.occasion,
      required this.remarks,
      required this.queueTimeoutUrl,
      required this.rideId,
      required this.userId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'GTransactB2CVars', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GTransactB2CVars', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        callbackUrl, r'GTransactB2CVars', 'callbackUrl');
    BuiltValueNullFieldError.checkNotNull(
        occasion, r'GTransactB2CVars', 'occasion');
    BuiltValueNullFieldError.checkNotNull(
        remarks, r'GTransactB2CVars', 'remarks');
    BuiltValueNullFieldError.checkNotNull(
        queueTimeoutUrl, r'GTransactB2CVars', 'queueTimeoutUrl');
    BuiltValueNullFieldError.checkNotNull(
        rideId, r'GTransactB2CVars', 'rideId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GTransactB2CVars', 'userId');
  }

  @override
  GTransactB2CVars rebuild(void Function(GTransactB2CVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTransactB2CVarsBuilder toBuilder() =>
      new GTransactB2CVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTransactB2CVars &&
        phoneNumber == other.phoneNumber &&
        amount == other.amount &&
        callbackUrl == other.callbackUrl &&
        occasion == other.occasion &&
        remarks == other.remarks &&
        queueTimeoutUrl == other.queueTimeoutUrl &&
        rideId == other.rideId &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, callbackUrl.hashCode);
    _$hash = $jc(_$hash, occasion.hashCode);
    _$hash = $jc(_$hash, remarks.hashCode);
    _$hash = $jc(_$hash, queueTimeoutUrl.hashCode);
    _$hash = $jc(_$hash, rideId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTransactB2CVars')
          ..add('phoneNumber', phoneNumber)
          ..add('amount', amount)
          ..add('callbackUrl', callbackUrl)
          ..add('occasion', occasion)
          ..add('remarks', remarks)
          ..add('queueTimeoutUrl', queueTimeoutUrl)
          ..add('rideId', rideId)
          ..add('userId', userId))
        .toString();
  }
}

class GTransactB2CVarsBuilder
    implements Builder<GTransactB2CVars, GTransactB2CVarsBuilder> {
  _$GTransactB2CVars? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  String? _callbackUrl;
  String? get callbackUrl => _$this._callbackUrl;
  set callbackUrl(String? callbackUrl) => _$this._callbackUrl = callbackUrl;

  String? _occasion;
  String? get occasion => _$this._occasion;
  set occasion(String? occasion) => _$this._occasion = occasion;

  String? _remarks;
  String? get remarks => _$this._remarks;
  set remarks(String? remarks) => _$this._remarks = remarks;

  String? _queueTimeoutUrl;
  String? get queueTimeoutUrl => _$this._queueTimeoutUrl;
  set queueTimeoutUrl(String? queueTimeoutUrl) =>
      _$this._queueTimeoutUrl = queueTimeoutUrl;

  int? _rideId;
  int? get rideId => _$this._rideId;
  set rideId(int? rideId) => _$this._rideId = rideId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GTransactB2CVarsBuilder();

  GTransactB2CVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _amount = $v.amount;
      _callbackUrl = $v.callbackUrl;
      _occasion = $v.occasion;
      _remarks = $v.remarks;
      _queueTimeoutUrl = $v.queueTimeoutUrl;
      _rideId = $v.rideId;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTransactB2CVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTransactB2CVars;
  }

  @override
  void update(void Function(GTransactB2CVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTransactB2CVars build() => _build();

  _$GTransactB2CVars _build() {
    final _$result = _$v ??
        new _$GTransactB2CVars._(
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'GTransactB2CVars', 'phoneNumber'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GTransactB2CVars', 'amount'),
            callbackUrl: BuiltValueNullFieldError.checkNotNull(
                callbackUrl, r'GTransactB2CVars', 'callbackUrl'),
            occasion: BuiltValueNullFieldError.checkNotNull(
                occasion, r'GTransactB2CVars', 'occasion'),
            remarks: BuiltValueNullFieldError.checkNotNull(
                remarks, r'GTransactB2CVars', 'remarks'),
            queueTimeoutUrl: BuiltValueNullFieldError.checkNotNull(
                queueTimeoutUrl, r'GTransactB2CVars', 'queueTimeoutUrl'),
            rideId: BuiltValueNullFieldError.checkNotNull(
                rideId, r'GTransactB2CVars', 'rideId'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GTransactB2CVars', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserPhoneNumberVars extends GUpdateUserPhoneNumberVars {
  @override
  final String email;
  @override
  final String phoneNumber;

  factory _$GUpdateUserPhoneNumberVars(
          [void Function(GUpdateUserPhoneNumberVarsBuilder)? updates]) =>
      (new GUpdateUserPhoneNumberVarsBuilder()..update(updates))._build();

  _$GUpdateUserPhoneNumberVars._(
      {required this.email, required this.phoneNumber})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        email, r'GUpdateUserPhoneNumberVars', 'email');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'GUpdateUserPhoneNumberVars', 'phoneNumber');
  }

  @override
  GUpdateUserPhoneNumberVars rebuild(
          void Function(GUpdateUserPhoneNumberVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserPhoneNumberVarsBuilder toBuilder() =>
      new GUpdateUserPhoneNumberVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserPhoneNumberVars &&
        email == other.email &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateUserPhoneNumberVars')
          ..add('email', email)
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class GUpdateUserPhoneNumberVarsBuilder
    implements
        Builder<GUpdateUserPhoneNumberVars, GUpdateUserPhoneNumberVarsBuilder> {
  _$GUpdateUserPhoneNumberVars? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  GUpdateUserPhoneNumberVarsBuilder();

  GUpdateUserPhoneNumberVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserPhoneNumberVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserPhoneNumberVars;
  }

  @override
  void update(void Function(GUpdateUserPhoneNumberVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserPhoneNumberVars build() => _build();

  _$GUpdateUserPhoneNumberVars _build() {
    final _$result = _$v ??
        new _$GUpdateUserPhoneNumberVars._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GUpdateUserPhoneNumberVars', 'email'),
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'GUpdateUserPhoneNumberVars', 'phoneNumber'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserDetailsVars extends GUpdateUserDetailsVars {
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? userName;
  @override
  final String email;
  @override
  final String aboutMe;
  @override
  final String phoneNumber;

  factory _$GUpdateUserDetailsVars(
          [void Function(GUpdateUserDetailsVarsBuilder)? updates]) =>
      (new GUpdateUserDetailsVarsBuilder()..update(updates))._build();

  _$GUpdateUserDetailsVars._(
      {this.firstName,
      this.lastName,
      this.userName,
      required this.email,
      required this.aboutMe,
      required this.phoneNumber})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        email, r'GUpdateUserDetailsVars', 'email');
    BuiltValueNullFieldError.checkNotNull(
        aboutMe, r'GUpdateUserDetailsVars', 'aboutMe');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'GUpdateUserDetailsVars', 'phoneNumber');
  }

  @override
  GUpdateUserDetailsVars rebuild(
          void Function(GUpdateUserDetailsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserDetailsVarsBuilder toBuilder() =>
      new GUpdateUserDetailsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserDetailsVars &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        userName == other.userName &&
        email == other.email &&
        aboutMe == other.aboutMe &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, aboutMe.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateUserDetailsVars')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('userName', userName)
          ..add('email', email)
          ..add('aboutMe', aboutMe)
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class GUpdateUserDetailsVarsBuilder
    implements Builder<GUpdateUserDetailsVars, GUpdateUserDetailsVarsBuilder> {
  _$GUpdateUserDetailsVars? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _aboutMe;
  String? get aboutMe => _$this._aboutMe;
  set aboutMe(String? aboutMe) => _$this._aboutMe = aboutMe;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  GUpdateUserDetailsVarsBuilder();

  GUpdateUserDetailsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _userName = $v.userName;
      _email = $v.email;
      _aboutMe = $v.aboutMe;
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserDetailsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserDetailsVars;
  }

  @override
  void update(void Function(GUpdateUserDetailsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserDetailsVars build() => _build();

  _$GUpdateUserDetailsVars _build() {
    final _$result = _$v ??
        new _$GUpdateUserDetailsVars._(
            firstName: firstName,
            lastName: lastName,
            userName: userName,
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GUpdateUserDetailsVars', 'email'),
            aboutMe: BuiltValueNullFieldError.checkNotNull(
                aboutMe, r'GUpdateUserDetailsVars', 'aboutMe'),
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'GUpdateUserDetailsVars', 'phoneNumber'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateCarDetailsVars extends GUpdateCarDetailsVars {
  @override
  final bool active;
  @override
  final String? color;
  @override
  final String? imageUrl;
  @override
  final String? licensePlate;
  @override
  final String? model;
  @override
  final String? ownerId;

  factory _$GUpdateCarDetailsVars(
          [void Function(GUpdateCarDetailsVarsBuilder)? updates]) =>
      (new GUpdateCarDetailsVarsBuilder()..update(updates))._build();

  _$GUpdateCarDetailsVars._(
      {required this.active,
      this.color,
      this.imageUrl,
      this.licensePlate,
      this.model,
      this.ownerId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        active, r'GUpdateCarDetailsVars', 'active');
  }

  @override
  GUpdateCarDetailsVars rebuild(
          void Function(GUpdateCarDetailsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateCarDetailsVarsBuilder toBuilder() =>
      new GUpdateCarDetailsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateCarDetailsVars &&
        active == other.active &&
        color == other.color &&
        imageUrl == other.imageUrl &&
        licensePlate == other.licensePlate &&
        model == other.model &&
        ownerId == other.ownerId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, licensePlate.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, ownerId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateCarDetailsVars')
          ..add('active', active)
          ..add('color', color)
          ..add('imageUrl', imageUrl)
          ..add('licensePlate', licensePlate)
          ..add('model', model)
          ..add('ownerId', ownerId))
        .toString();
  }
}

class GUpdateCarDetailsVarsBuilder
    implements Builder<GUpdateCarDetailsVars, GUpdateCarDetailsVarsBuilder> {
  _$GUpdateCarDetailsVars? _$v;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _licensePlate;
  String? get licensePlate => _$this._licensePlate;
  set licensePlate(String? licensePlate) => _$this._licensePlate = licensePlate;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _ownerId;
  String? get ownerId => _$this._ownerId;
  set ownerId(String? ownerId) => _$this._ownerId = ownerId;

  GUpdateCarDetailsVarsBuilder();

  GUpdateCarDetailsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _active = $v.active;
      _color = $v.color;
      _imageUrl = $v.imageUrl;
      _licensePlate = $v.licensePlate;
      _model = $v.model;
      _ownerId = $v.ownerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateCarDetailsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateCarDetailsVars;
  }

  @override
  void update(void Function(GUpdateCarDetailsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateCarDetailsVars build() => _build();

  _$GUpdateCarDetailsVars _build() {
    final _$result = _$v ??
        new _$GUpdateCarDetailsVars._(
            active: BuiltValueNullFieldError.checkNotNull(
                active, r'GUpdateCarDetailsVars', 'active'),
            color: color,
            imageUrl: imageUrl,
            licensePlate: licensePlate,
            model: model,
            ownerId: ownerId);
    replace(_$result);
    return _$result;
  }
}

class _$GupdateFMCTokenVars extends GupdateFMCTokenVars {
  @override
  final String userId;
  @override
  final String fcmToken;

  factory _$GupdateFMCTokenVars(
          [void Function(GupdateFMCTokenVarsBuilder)? updates]) =>
      (new GupdateFMCTokenVarsBuilder()..update(updates))._build();

  _$GupdateFMCTokenVars._({required this.userId, required this.fcmToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GupdateFMCTokenVars', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        fcmToken, r'GupdateFMCTokenVars', 'fcmToken');
  }

  @override
  GupdateFMCTokenVars rebuild(
          void Function(GupdateFMCTokenVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GupdateFMCTokenVarsBuilder toBuilder() =>
      new GupdateFMCTokenVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GupdateFMCTokenVars &&
        userId == other.userId &&
        fcmToken == other.fcmToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GupdateFMCTokenVars')
          ..add('userId', userId)
          ..add('fcmToken', fcmToken))
        .toString();
  }
}

class GupdateFMCTokenVarsBuilder
    implements Builder<GupdateFMCTokenVars, GupdateFMCTokenVarsBuilder> {
  _$GupdateFMCTokenVars? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  GupdateFMCTokenVarsBuilder();

  GupdateFMCTokenVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _fcmToken = $v.fcmToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GupdateFMCTokenVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GupdateFMCTokenVars;
  }

  @override
  void update(void Function(GupdateFMCTokenVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GupdateFMCTokenVars build() => _build();

  _$GupdateFMCTokenVars _build() {
    final _$result = _$v ??
        new _$GupdateFMCTokenVars._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GupdateFMCTokenVars', 'userId'),
            fcmToken: BuiltValueNullFieldError.checkNotNull(
                fcmToken, r'GupdateFMCTokenVars', 'fcmToken'));
    replace(_$result);
    return _$result;
  }
}

class _$GCheckIfUserIsDriverVars extends GCheckIfUserIsDriverVars {
  @override
  final String driverRoleId;
  @override
  final String userId;

  factory _$GCheckIfUserIsDriverVars(
          [void Function(GCheckIfUserIsDriverVarsBuilder)? updates]) =>
      (new GCheckIfUserIsDriverVarsBuilder()..update(updates))._build();

  _$GCheckIfUserIsDriverVars._(
      {required this.driverRoleId, required this.userId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        driverRoleId, r'GCheckIfUserIsDriverVars', 'driverRoleId');
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GCheckIfUserIsDriverVars', 'userId');
  }

  @override
  GCheckIfUserIsDriverVars rebuild(
          void Function(GCheckIfUserIsDriverVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCheckIfUserIsDriverVarsBuilder toBuilder() =>
      new GCheckIfUserIsDriverVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCheckIfUserIsDriverVars &&
        driverRoleId == other.driverRoleId &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, driverRoleId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCheckIfUserIsDriverVars')
          ..add('driverRoleId', driverRoleId)
          ..add('userId', userId))
        .toString();
  }
}

class GCheckIfUserIsDriverVarsBuilder
    implements
        Builder<GCheckIfUserIsDriverVars, GCheckIfUserIsDriverVarsBuilder> {
  _$GCheckIfUserIsDriverVars? _$v;

  String? _driverRoleId;
  String? get driverRoleId => _$this._driverRoleId;
  set driverRoleId(String? driverRoleId) => _$this._driverRoleId = driverRoleId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GCheckIfUserIsDriverVarsBuilder();

  GCheckIfUserIsDriverVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _driverRoleId = $v.driverRoleId;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCheckIfUserIsDriverVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCheckIfUserIsDriverVars;
  }

  @override
  void update(void Function(GCheckIfUserIsDriverVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCheckIfUserIsDriverVars build() => _build();

  _$GCheckIfUserIsDriverVars _build() {
    final _$result = _$v ??
        new _$GCheckIfUserIsDriverVars._(
            driverRoleId: BuiltValueNullFieldError.checkNotNull(
                driverRoleId, r'GCheckIfUserIsDriverVars', 'driverRoleId'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GCheckIfUserIsDriverVars', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetAllRolesVars extends GGetAllRolesVars {
  factory _$GGetAllRolesVars(
          [void Function(GGetAllRolesVarsBuilder)? updates]) =>
      (new GGetAllRolesVarsBuilder()..update(updates))._build();

  _$GGetAllRolesVars._() : super._();

  @override
  GGetAllRolesVars rebuild(void Function(GGetAllRolesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllRolesVarsBuilder toBuilder() =>
      new GGetAllRolesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllRolesVars;
  }

  @override
  int get hashCode {
    return 690939072;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetAllRolesVars').toString();
  }
}

class GGetAllRolesVarsBuilder
    implements Builder<GGetAllRolesVars, GGetAllRolesVarsBuilder> {
  _$GGetAllRolesVars? _$v;

  GGetAllRolesVarsBuilder();

  @override
  void replace(GGetAllRolesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllRolesVars;
  }

  @override
  void update(void Function(GGetAllRolesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllRolesVars build() => _build();

  _$GGetAllRolesVars _build() {
    final _$result = _$v ?? new _$GGetAllRolesVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GGetDriverTripsVars extends GGetDriverTripsVars {
  @override
  final String? UserId;
  @override
  final String? status;

  factory _$GGetDriverTripsVars(
          [void Function(GGetDriverTripsVarsBuilder)? updates]) =>
      (new GGetDriverTripsVarsBuilder()..update(updates))._build();

  _$GGetDriverTripsVars._({this.UserId, this.status}) : super._();

  @override
  GGetDriverTripsVars rebuild(
          void Function(GGetDriverTripsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDriverTripsVarsBuilder toBuilder() =>
      new GGetDriverTripsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDriverTripsVars &&
        UserId == other.UserId &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, UserId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetDriverTripsVars')
          ..add('UserId', UserId)
          ..add('status', status))
        .toString();
  }
}

class GGetDriverTripsVarsBuilder
    implements Builder<GGetDriverTripsVars, GGetDriverTripsVarsBuilder> {
  _$GGetDriverTripsVars? _$v;

  String? _UserId;
  String? get UserId => _$this._UserId;
  set UserId(String? UserId) => _$this._UserId = UserId;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  GGetDriverTripsVarsBuilder();

  GGetDriverTripsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _UserId = $v.UserId;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDriverTripsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDriverTripsVars;
  }

  @override
  void update(void Function(GGetDriverTripsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDriverTripsVars build() => _build();

  _$GGetDriverTripsVars _build() {
    final _$result =
        _$v ?? new _$GGetDriverTripsVars._(UserId: UserId, status: status);
    replace(_$result);
    return _$result;
  }
}

class _$GGetPaidTripsVars extends GGetPaidTripsVars {
  @override
  final String? status;

  factory _$GGetPaidTripsVars(
          [void Function(GGetPaidTripsVarsBuilder)? updates]) =>
      (new GGetPaidTripsVarsBuilder()..update(updates))._build();

  _$GGetPaidTripsVars._({this.status}) : super._();

  @override
  GGetPaidTripsVars rebuild(void Function(GGetPaidTripsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPaidTripsVarsBuilder toBuilder() =>
      new GGetPaidTripsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPaidTripsVars && status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetPaidTripsVars')
          ..add('status', status))
        .toString();
  }
}

class GGetPaidTripsVarsBuilder
    implements Builder<GGetPaidTripsVars, GGetPaidTripsVarsBuilder> {
  _$GGetPaidTripsVars? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  GGetPaidTripsVarsBuilder();

  GGetPaidTripsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPaidTripsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPaidTripsVars;
  }

  @override
  void update(void Function(GGetPaidTripsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPaidTripsVars build() => _build();

  _$GGetPaidTripsVars _build() {
    final _$result = _$v ?? new _$GGetPaidTripsVars._(status: status);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserByUserNameVars extends GGetUserByUserNameVars {
  @override
  final String? userName;

  factory _$GGetUserByUserNameVars(
          [void Function(GGetUserByUserNameVarsBuilder)? updates]) =>
      (new GGetUserByUserNameVarsBuilder()..update(updates))._build();

  _$GGetUserByUserNameVars._({this.userName}) : super._();

  @override
  GGetUserByUserNameVars rebuild(
          void Function(GGetUserByUserNameVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserByUserNameVarsBuilder toBuilder() =>
      new GGetUserByUserNameVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserByUserNameVars && userName == other.userName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserByUserNameVars')
          ..add('userName', userName))
        .toString();
  }
}

class GGetUserByUserNameVarsBuilder
    implements Builder<GGetUserByUserNameVars, GGetUserByUserNameVarsBuilder> {
  _$GGetUserByUserNameVars? _$v;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  GGetUserByUserNameVarsBuilder();

  GGetUserByUserNameVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userName = $v.userName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserByUserNameVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserByUserNameVars;
  }

  @override
  void update(void Function(GGetUserByUserNameVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserByUserNameVars build() => _build();

  _$GGetUserByUserNameVars _build() {
    final _$result = _$v ?? new _$GGetUserByUserNameVars._(userName: userName);
    replace(_$result);
    return _$result;
  }
}

class _$GFilterToAndFromRidesVars extends GFilterToAndFromRidesVars {
  @override
  final String? searchText;

  factory _$GFilterToAndFromRidesVars(
          [void Function(GFilterToAndFromRidesVarsBuilder)? updates]) =>
      (new GFilterToAndFromRidesVarsBuilder()..update(updates))._build();

  _$GFilterToAndFromRidesVars._({this.searchText}) : super._();

  @override
  GFilterToAndFromRidesVars rebuild(
          void Function(GFilterToAndFromRidesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterToAndFromRidesVarsBuilder toBuilder() =>
      new GFilterToAndFromRidesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterToAndFromRidesVars && searchText == other.searchText;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, searchText.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterToAndFromRidesVars')
          ..add('searchText', searchText))
        .toString();
  }
}

class GFilterToAndFromRidesVarsBuilder
    implements
        Builder<GFilterToAndFromRidesVars, GFilterToAndFromRidesVarsBuilder> {
  _$GFilterToAndFromRidesVars? _$v;

  String? _searchText;
  String? get searchText => _$this._searchText;
  set searchText(String? searchText) => _$this._searchText = searchText;

  GFilterToAndFromRidesVarsBuilder();

  GFilterToAndFromRidesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _searchText = $v.searchText;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterToAndFromRidesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterToAndFromRidesVars;
  }

  @override
  void update(void Function(GFilterToAndFromRidesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterToAndFromRidesVars build() => _build();

  _$GFilterToAndFromRidesVars _build() {
    final _$result =
        _$v ?? new _$GFilterToAndFromRidesVars._(searchText: searchText);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserCarsVars extends GGetUserCarsVars {
  @override
  final String email;

  factory _$GGetUserCarsVars(
          [void Function(GGetUserCarsVarsBuilder)? updates]) =>
      (new GGetUserCarsVarsBuilder()..update(updates))._build();

  _$GGetUserCarsVars._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'GGetUserCarsVars', 'email');
  }

  @override
  GGetUserCarsVars rebuild(void Function(GGetUserCarsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserCarsVarsBuilder toBuilder() =>
      new GGetUserCarsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserCarsVars && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserCarsVars')
          ..add('email', email))
        .toString();
  }
}

class GGetUserCarsVarsBuilder
    implements Builder<GGetUserCarsVars, GGetUserCarsVarsBuilder> {
  _$GGetUserCarsVars? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  GGetUserCarsVarsBuilder();

  GGetUserCarsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserCarsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserCarsVars;
  }

  @override
  void update(void Function(GGetUserCarsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserCarsVars build() => _build();

  _$GGetUserCarsVars _build() {
    final _$result = _$v ??
        new _$GGetUserCarsVars._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GGetUserCarsVars', 'email'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserWithFilterVars extends GGetUserWithFilterVars {
  @override
  final String userName;

  factory _$GGetUserWithFilterVars(
          [void Function(GGetUserWithFilterVarsBuilder)? updates]) =>
      (new GGetUserWithFilterVarsBuilder()..update(updates))._build();

  _$GGetUserWithFilterVars._({required this.userName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userName, r'GGetUserWithFilterVars', 'userName');
  }

  @override
  GGetUserWithFilterVars rebuild(
          void Function(GGetUserWithFilterVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWithFilterVarsBuilder toBuilder() =>
      new GGetUserWithFilterVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserWithFilterVars && userName == other.userName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserWithFilterVars')
          ..add('userName', userName))
        .toString();
  }
}

class GGetUserWithFilterVarsBuilder
    implements Builder<GGetUserWithFilterVars, GGetUserWithFilterVarsBuilder> {
  _$GGetUserWithFilterVars? _$v;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  GGetUserWithFilterVarsBuilder();

  GGetUserWithFilterVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userName = $v.userName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserWithFilterVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWithFilterVars;
  }

  @override
  void update(void Function(GGetUserWithFilterVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWithFilterVars build() => _build();

  _$GGetUserWithFilterVars _build() {
    final _$result = _$v ??
        new _$GGetUserWithFilterVars._(
            userName: BuiltValueNullFieldError.checkNotNull(
                userName, r'GGetUserWithFilterVars', 'userName'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserByIdVars extends GGetUserByIdVars {
  @override
  final String id;

  factory _$GGetUserByIdVars(
          [void Function(GGetUserByIdVarsBuilder)? updates]) =>
      (new GGetUserByIdVarsBuilder()..update(updates))._build();

  _$GGetUserByIdVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GGetUserByIdVars', 'id');
  }

  @override
  GGetUserByIdVars rebuild(void Function(GGetUserByIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserByIdVarsBuilder toBuilder() =>
      new GGetUserByIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserByIdVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserByIdVars')..add('id', id))
        .toString();
  }
}

class GGetUserByIdVarsBuilder
    implements Builder<GGetUserByIdVars, GGetUserByIdVarsBuilder> {
  _$GGetUserByIdVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetUserByIdVarsBuilder();

  GGetUserByIdVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserByIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserByIdVars;
  }

  @override
  void update(void Function(GGetUserByIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserByIdVars build() => _build();

  _$GGetUserByIdVars _build() {
    final _$result = _$v ??
        new _$GGetUserByIdVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetUserByIdVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetOnGoingUserBookingsVars extends GGetOnGoingUserBookingsVars {
  @override
  final String userId;

  factory _$GGetOnGoingUserBookingsVars(
          [void Function(GGetOnGoingUserBookingsVarsBuilder)? updates]) =>
      (new GGetOnGoingUserBookingsVarsBuilder()..update(updates))._build();

  _$GGetOnGoingUserBookingsVars._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GGetOnGoingUserBookingsVars', 'userId');
  }

  @override
  GGetOnGoingUserBookingsVars rebuild(
          void Function(GGetOnGoingUserBookingsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetOnGoingUserBookingsVarsBuilder toBuilder() =>
      new GGetOnGoingUserBookingsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetOnGoingUserBookingsVars && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetOnGoingUserBookingsVars')
          ..add('userId', userId))
        .toString();
  }
}

class GGetOnGoingUserBookingsVarsBuilder
    implements
        Builder<GGetOnGoingUserBookingsVars,
            GGetOnGoingUserBookingsVarsBuilder> {
  _$GGetOnGoingUserBookingsVars? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GGetOnGoingUserBookingsVarsBuilder();

  GGetOnGoingUserBookingsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetOnGoingUserBookingsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetOnGoingUserBookingsVars;
  }

  @override
  void update(void Function(GGetOnGoingUserBookingsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetOnGoingUserBookingsVars build() => _build();

  _$GGetOnGoingUserBookingsVars _build() {
    final _$result = _$v ??
        new _$GGetOnGoingUserBookingsVars._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GGetOnGoingUserBookingsVars', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetPastUserBookingsVars extends GGetPastUserBookingsVars {
  @override
  final String userId;

  factory _$GGetPastUserBookingsVars(
          [void Function(GGetPastUserBookingsVarsBuilder)? updates]) =>
      (new GGetPastUserBookingsVarsBuilder()..update(updates))._build();

  _$GGetPastUserBookingsVars._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GGetPastUserBookingsVars', 'userId');
  }

  @override
  GGetPastUserBookingsVars rebuild(
          void Function(GGetPastUserBookingsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPastUserBookingsVarsBuilder toBuilder() =>
      new GGetPastUserBookingsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPastUserBookingsVars && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetPastUserBookingsVars')
          ..add('userId', userId))
        .toString();
  }
}

class GGetPastUserBookingsVarsBuilder
    implements
        Builder<GGetPastUserBookingsVars, GGetPastUserBookingsVarsBuilder> {
  _$GGetPastUserBookingsVars? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GGetPastUserBookingsVarsBuilder();

  GGetPastUserBookingsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPastUserBookingsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPastUserBookingsVars;
  }

  @override
  void update(void Function(GGetPastUserBookingsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPastUserBookingsVars build() => _build();

  _$GGetPastUserBookingsVars _build() {
    final _$result = _$v ??
        new _$GGetPastUserBookingsVars._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GGetPastUserBookingsVars', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetRidesVars extends GGetRidesVars {
  @override
  final int? from;
  @override
  final int? to;
  @override
  final String? placeOfStartFilter;
  @override
  final String? destinationFilter;

  factory _$GGetRidesVars([void Function(GGetRidesVarsBuilder)? updates]) =>
      (new GGetRidesVarsBuilder()..update(updates))._build();

  _$GGetRidesVars._(
      {this.from, this.to, this.placeOfStartFilter, this.destinationFilter})
      : super._();

  @override
  GGetRidesVars rebuild(void Function(GGetRidesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRidesVarsBuilder toBuilder() => new GGetRidesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRidesVars &&
        from == other.from &&
        to == other.to &&
        placeOfStartFilter == other.placeOfStartFilter &&
        destinationFilter == other.destinationFilter;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, placeOfStartFilter.hashCode);
    _$hash = $jc(_$hash, destinationFilter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetRidesVars')
          ..add('from', from)
          ..add('to', to)
          ..add('placeOfStartFilter', placeOfStartFilter)
          ..add('destinationFilter', destinationFilter))
        .toString();
  }
}

class GGetRidesVarsBuilder
    implements Builder<GGetRidesVars, GGetRidesVarsBuilder> {
  _$GGetRidesVars? _$v;

  int? _from;
  int? get from => _$this._from;
  set from(int? from) => _$this._from = from;

  int? _to;
  int? get to => _$this._to;
  set to(int? to) => _$this._to = to;

  String? _placeOfStartFilter;
  String? get placeOfStartFilter => _$this._placeOfStartFilter;
  set placeOfStartFilter(String? placeOfStartFilter) =>
      _$this._placeOfStartFilter = placeOfStartFilter;

  String? _destinationFilter;
  String? get destinationFilter => _$this._destinationFilter;
  set destinationFilter(String? destinationFilter) =>
      _$this._destinationFilter = destinationFilter;

  GGetRidesVarsBuilder();

  GGetRidesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from;
      _to = $v.to;
      _placeOfStartFilter = $v.placeOfStartFilter;
      _destinationFilter = $v.destinationFilter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetRidesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRidesVars;
  }

  @override
  void update(void Function(GGetRidesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRidesVars build() => _build();

  _$GGetRidesVars _build() {
    final _$result = _$v ??
        new _$GGetRidesVars._(
            from: from,
            to: to,
            placeOfStartFilter: placeOfStartFilter,
            destinationFilter: destinationFilter);
    replace(_$result);
    return _$result;
  }
}

class _$GGetLatestRidesVars extends GGetLatestRidesVars {
  @override
  final int count;

  factory _$GGetLatestRidesVars(
          [void Function(GGetLatestRidesVarsBuilder)? updates]) =>
      (new GGetLatestRidesVarsBuilder()..update(updates))._build();

  _$GGetLatestRidesVars._({required this.count}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        count, r'GGetLatestRidesVars', 'count');
  }

  @override
  GGetLatestRidesVars rebuild(
          void Function(GGetLatestRidesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetLatestRidesVarsBuilder toBuilder() =>
      new GGetLatestRidesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetLatestRidesVars && count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetLatestRidesVars')
          ..add('count', count))
        .toString();
  }
}

class GGetLatestRidesVarsBuilder
    implements Builder<GGetLatestRidesVars, GGetLatestRidesVarsBuilder> {
  _$GGetLatestRidesVars? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GGetLatestRidesVarsBuilder();

  GGetLatestRidesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetLatestRidesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetLatestRidesVars;
  }

  @override
  void update(void Function(GGetLatestRidesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetLatestRidesVars build() => _build();

  _$GGetLatestRidesVars _build() {
    final _$result = _$v ??
        new _$GGetLatestRidesVars._(
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'GGetLatestRidesVars', 'count'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetRideInfoVars extends GGetRideInfoVars {
  @override
  final int? rideId;

  factory _$GGetRideInfoVars(
          [void Function(GGetRideInfoVarsBuilder)? updates]) =>
      (new GGetRideInfoVarsBuilder()..update(updates))._build();

  _$GGetRideInfoVars._({this.rideId}) : super._();

  @override
  GGetRideInfoVars rebuild(void Function(GGetRideInfoVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRideInfoVarsBuilder toBuilder() =>
      new GGetRideInfoVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRideInfoVars && rideId == other.rideId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rideId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetRideInfoVars')
          ..add('rideId', rideId))
        .toString();
  }
}

class GGetRideInfoVarsBuilder
    implements Builder<GGetRideInfoVars, GGetRideInfoVarsBuilder> {
  _$GGetRideInfoVars? _$v;

  int? _rideId;
  int? get rideId => _$this._rideId;
  set rideId(int? rideId) => _$this._rideId = rideId;

  GGetRideInfoVarsBuilder();

  GGetRideInfoVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rideId = $v.rideId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetRideInfoVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRideInfoVars;
  }

  @override
  void update(void Function(GGetRideInfoVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRideInfoVars build() => _build();

  _$GGetRideInfoVars _build() {
    final _$result = _$v ?? new _$GGetRideInfoVars._(rideId: rideId);
    replace(_$result);
    return _$result;
  }
}

class _$GGetRideVars extends GGetRideVars {
  @override
  final int? rideId;

  factory _$GGetRideVars([void Function(GGetRideVarsBuilder)? updates]) =>
      (new GGetRideVarsBuilder()..update(updates))._build();

  _$GGetRideVars._({this.rideId}) : super._();

  @override
  GGetRideVars rebuild(void Function(GGetRideVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRideVarsBuilder toBuilder() => new GGetRideVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRideVars && rideId == other.rideId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rideId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetRideVars')..add('rideId', rideId))
        .toString();
  }
}

class GGetRideVarsBuilder
    implements Builder<GGetRideVars, GGetRideVarsBuilder> {
  _$GGetRideVars? _$v;

  int? _rideId;
  int? get rideId => _$this._rideId;
  set rideId(int? rideId) => _$this._rideId = rideId;

  GGetRideVarsBuilder();

  GGetRideVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rideId = $v.rideId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetRideVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRideVars;
  }

  @override
  void update(void Function(GGetRideVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRideVars build() => _build();

  _$GGetRideVars _build() {
    final _$result = _$v ?? new _$GGetRideVars._(rideId: rideId);
    replace(_$result);
    return _$result;
  }
}

class _$GGetRidesWithFilterVars extends GGetRidesWithFilterVars {
  @override
  final int? from;
  @override
  final int? to;

  factory _$GGetRidesWithFilterVars(
          [void Function(GGetRidesWithFilterVarsBuilder)? updates]) =>
      (new GGetRidesWithFilterVarsBuilder()..update(updates))._build();

  _$GGetRidesWithFilterVars._({this.from, this.to}) : super._();

  @override
  GGetRidesWithFilterVars rebuild(
          void Function(GGetRidesWithFilterVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRidesWithFilterVarsBuilder toBuilder() =>
      new GGetRidesWithFilterVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRidesWithFilterVars &&
        from == other.from &&
        to == other.to;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetRidesWithFilterVars')
          ..add('from', from)
          ..add('to', to))
        .toString();
  }
}

class GGetRidesWithFilterVarsBuilder
    implements
        Builder<GGetRidesWithFilterVars, GGetRidesWithFilterVarsBuilder> {
  _$GGetRidesWithFilterVars? _$v;

  int? _from;
  int? get from => _$this._from;
  set from(int? from) => _$this._from = from;

  int? _to;
  int? get to => _$this._to;
  set to(int? to) => _$this._to = to;

  GGetRidesWithFilterVarsBuilder();

  GGetRidesWithFilterVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from;
      _to = $v.to;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetRidesWithFilterVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRidesWithFilterVars;
  }

  @override
  void update(void Function(GGetRidesWithFilterVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRidesWithFilterVars build() => _build();

  _$GGetRidesWithFilterVars _build() {
    final _$result = _$v ?? new _$GGetRidesWithFilterVars._(from: from, to: to);
    replace(_$result);
    return _$result;
  }
}

class _$GGetDestinationRidesVars extends GGetDestinationRidesVars {
  @override
  final String placeOfStart;
  @override
  final String destination;

  factory _$GGetDestinationRidesVars(
          [void Function(GGetDestinationRidesVarsBuilder)? updates]) =>
      (new GGetDestinationRidesVarsBuilder()..update(updates))._build();

  _$GGetDestinationRidesVars._(
      {required this.placeOfStart, required this.destination})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        placeOfStart, r'GGetDestinationRidesVars', 'placeOfStart');
    BuiltValueNullFieldError.checkNotNull(
        destination, r'GGetDestinationRidesVars', 'destination');
  }

  @override
  GGetDestinationRidesVars rebuild(
          void Function(GGetDestinationRidesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDestinationRidesVarsBuilder toBuilder() =>
      new GGetDestinationRidesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDestinationRidesVars &&
        placeOfStart == other.placeOfStart &&
        destination == other.destination;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, placeOfStart.hashCode);
    _$hash = $jc(_$hash, destination.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetDestinationRidesVars')
          ..add('placeOfStart', placeOfStart)
          ..add('destination', destination))
        .toString();
  }
}

class GGetDestinationRidesVarsBuilder
    implements
        Builder<GGetDestinationRidesVars, GGetDestinationRidesVarsBuilder> {
  _$GGetDestinationRidesVars? _$v;

  String? _placeOfStart;
  String? get placeOfStart => _$this._placeOfStart;
  set placeOfStart(String? placeOfStart) => _$this._placeOfStart = placeOfStart;

  String? _destination;
  String? get destination => _$this._destination;
  set destination(String? destination) => _$this._destination = destination;

  GGetDestinationRidesVarsBuilder();

  GGetDestinationRidesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _placeOfStart = $v.placeOfStart;
      _destination = $v.destination;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDestinationRidesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDestinationRidesVars;
  }

  @override
  void update(void Function(GGetDestinationRidesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDestinationRidesVars build() => _build();

  _$GGetDestinationRidesVars _build() {
    final _$result = _$v ??
        new _$GGetDestinationRidesVars._(
            placeOfStart: BuiltValueNullFieldError.checkNotNull(
                placeOfStart, r'GGetDestinationRidesVars', 'placeOfStart'),
            destination: BuiltValueNullFieldError.checkNotNull(
                destination, r'GGetDestinationRidesVars', 'destination'));
    replace(_$result);
    return _$result;
  }
}

class _$GOnGetMessageVars extends GOnGetMessageVars {
  factory _$GOnGetMessageVars(
          [void Function(GOnGetMessageVarsBuilder)? updates]) =>
      (new GOnGetMessageVarsBuilder()..update(updates))._build();

  _$GOnGetMessageVars._() : super._();

  @override
  GOnGetMessageVars rebuild(void Function(GOnGetMessageVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GOnGetMessageVarsBuilder toBuilder() =>
      new GOnGetMessageVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GOnGetMessageVars;
  }

  @override
  int get hashCode {
    return 444617830;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GOnGetMessageVars').toString();
  }
}

class GOnGetMessageVarsBuilder
    implements Builder<GOnGetMessageVars, GOnGetMessageVarsBuilder> {
  _$GOnGetMessageVars? _$v;

  GOnGetMessageVarsBuilder();

  @override
  void replace(GOnGetMessageVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GOnGetMessageVars;
  }

  @override
  void update(void Function(GOnGetMessageVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GOnGetMessageVars build() => _build();

  _$GOnGetMessageVars _build() {
    final _$result = _$v ?? new _$GOnGetMessageVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
