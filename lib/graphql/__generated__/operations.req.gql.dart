// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:pamride/graphql/__generated__/operations.ast.gql.dart' as _i5;
import 'package:pamride/graphql/__generated__/operations.data.gql.dart' as _i2;
import 'package:pamride/graphql/__generated__/operations.var.gql.dart' as _i3;
import 'package:pamride/graphql/__generated__/serializers.gql.dart' as _i6;

part 'operations.req.gql.g.dart';

abstract class GRegisterUserReq
    implements
        Built<GRegisterUserReq, GRegisterUserReqBuilder>,
        _i1.OperationRequest<_i2.GRegisterUserData, _i3.GRegisterUserVars> {
  GRegisterUserReq._();

  factory GRegisterUserReq([Function(GRegisterUserReqBuilder b) updates]) =
      _$GRegisterUserReq;

  static void _initializeBuilder(GRegisterUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'RegisterUser',
    )
    ..executeOnListen = true;
  @override
  _i3.GRegisterUserVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GRegisterUserData? Function(
    _i2.GRegisterUserData?,
    _i2.GRegisterUserData?,
  )? get updateResult;
  @override
  _i2.GRegisterUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GRegisterUserData? parseData(Map<String, dynamic> json) =>
      _i2.GRegisterUserData.fromJson(json);
  static Serializer<GRegisterUserReq> get serializer =>
      _$gRegisterUserReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GRegisterUserReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRegisterUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GRegisterUserReq.serializer,
        json,
      );
}

abstract class GUserLoginReq
    implements
        Built<GUserLoginReq, GUserLoginReqBuilder>,
        _i1.OperationRequest<_i2.GUserLoginData, _i3.GUserLoginVars> {
  GUserLoginReq._();

  factory GUserLoginReq([Function(GUserLoginReqBuilder b) updates]) =
      _$GUserLoginReq;

  static void _initializeBuilder(GUserLoginReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserLogin',
    )
    ..executeOnListen = true;
  @override
  _i3.GUserLoginVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GUserLoginData? Function(
    _i2.GUserLoginData?,
    _i2.GUserLoginData?,
  )? get updateResult;
  @override
  _i2.GUserLoginData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUserLoginData? parseData(Map<String, dynamic> json) =>
      _i2.GUserLoginData.fromJson(json);
  static Serializer<GUserLoginReq> get serializer => _$gUserLoginReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserLoginReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLoginReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserLoginReq.serializer,
        json,
      );
}

abstract class GUpdateLicenceDocumentsReq
    implements
        Built<GUpdateLicenceDocumentsReq, GUpdateLicenceDocumentsReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateLicenceDocumentsData,
            _i3.GUpdateLicenceDocumentsVars> {
  GUpdateLicenceDocumentsReq._();

  factory GUpdateLicenceDocumentsReq(
          [Function(GUpdateLicenceDocumentsReqBuilder b) updates]) =
      _$GUpdateLicenceDocumentsReq;

  static void _initializeBuilder(GUpdateLicenceDocumentsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UpdateLicenceDocuments',
    )
    ..executeOnListen = true;
  @override
  _i3.GUpdateLicenceDocumentsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GUpdateLicenceDocumentsData? Function(
    _i2.GUpdateLicenceDocumentsData?,
    _i2.GUpdateLicenceDocumentsData?,
  )? get updateResult;
  @override
  _i2.GUpdateLicenceDocumentsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUpdateLicenceDocumentsData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateLicenceDocumentsData.fromJson(json);
  static Serializer<GUpdateLicenceDocumentsReq> get serializer =>
      _$gUpdateLicenceDocumentsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUpdateLicenceDocumentsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateLicenceDocumentsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUpdateLicenceDocumentsReq.serializer,
        json,
      );
}

abstract class GCreateARideReq
    implements
        Built<GCreateARideReq, GCreateARideReqBuilder>,
        _i1.OperationRequest<_i2.GCreateARideData, _i3.GCreateARideVars> {
  GCreateARideReq._();

  factory GCreateARideReq([Function(GCreateARideReqBuilder b) updates]) =
      _$GCreateARideReq;

  static void _initializeBuilder(GCreateARideReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateARide',
    )
    ..executeOnListen = true;
  @override
  _i3.GCreateARideVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GCreateARideData? Function(
    _i2.GCreateARideData?,
    _i2.GCreateARideData?,
  )? get updateResult;
  @override
  _i2.GCreateARideData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateARideData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateARideData.fromJson(json);
  static Serializer<GCreateARideReq> get serializer =>
      _$gCreateARideReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateARideReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateARideReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateARideReq.serializer,
        json,
      );
}

abstract class GTransactionReq
    implements
        Built<GTransactionReq, GTransactionReqBuilder>,
        _i1.OperationRequest<_i2.GTransactionData, _i3.GTransactionVars> {
  GTransactionReq._();

  factory GTransactionReq([Function(GTransactionReqBuilder b) updates]) =
      _$GTransactionReq;

  static void _initializeBuilder(GTransactionReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Transaction',
    )
    ..executeOnListen = true;
  @override
  _i3.GTransactionVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GTransactionData? Function(
    _i2.GTransactionData?,
    _i2.GTransactionData?,
  )? get updateResult;
  @override
  _i2.GTransactionData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GTransactionData? parseData(Map<String, dynamic> json) =>
      _i2.GTransactionData.fromJson(json);
  static Serializer<GTransactionReq> get serializer =>
      _$gTransactionReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GTransactionReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactionReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GTransactionReq.serializer,
        json,
      );
}

abstract class GSaveUserFileReq
    implements
        Built<GSaveUserFileReq, GSaveUserFileReqBuilder>,
        _i1.OperationRequest<_i2.GSaveUserFileData, _i3.GSaveUserFileVars> {
  GSaveUserFileReq._();

  factory GSaveUserFileReq([Function(GSaveUserFileReqBuilder b) updates]) =
      _$GSaveUserFileReq;

  static void _initializeBuilder(GSaveUserFileReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SaveUserFile',
    )
    ..executeOnListen = true;
  @override
  _i3.GSaveUserFileVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GSaveUserFileData? Function(
    _i2.GSaveUserFileData?,
    _i2.GSaveUserFileData?,
  )? get updateResult;
  @override
  _i2.GSaveUserFileData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GSaveUserFileData? parseData(Map<String, dynamic> json) =>
      _i2.GSaveUserFileData.fromJson(json);
  static Serializer<GSaveUserFileReq> get serializer =>
      _$gSaveUserFileReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSaveUserFileReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSaveUserFileReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSaveUserFileReq.serializer,
        json,
      );
}

abstract class GSaveUserFileStringReq
    implements
        Built<GSaveUserFileStringReq, GSaveUserFileStringReqBuilder>,
        _i1.OperationRequest<_i2.GSaveUserFileStringData,
            _i3.GSaveUserFileStringVars> {
  GSaveUserFileStringReq._();

  factory GSaveUserFileStringReq(
          [Function(GSaveUserFileStringReqBuilder b) updates]) =
      _$GSaveUserFileStringReq;

  static void _initializeBuilder(GSaveUserFileStringReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SaveUserFileString',
    )
    ..executeOnListen = true;
  @override
  _i3.GSaveUserFileStringVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GSaveUserFileStringData? Function(
    _i2.GSaveUserFileStringData?,
    _i2.GSaveUserFileStringData?,
  )? get updateResult;
  @override
  _i2.GSaveUserFileStringData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GSaveUserFileStringData? parseData(Map<String, dynamic> json) =>
      _i2.GSaveUserFileStringData.fromJson(json);
  static Serializer<GSaveUserFileStringReq> get serializer =>
      _$gSaveUserFileStringReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSaveUserFileStringReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSaveUserFileStringReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSaveUserFileStringReq.serializer,
        json,
      );
}

abstract class GCreateCarReq
    implements
        Built<GCreateCarReq, GCreateCarReqBuilder>,
        _i1.OperationRequest<_i2.GCreateCarData, _i3.GCreateCarVars> {
  GCreateCarReq._();

  factory GCreateCarReq([Function(GCreateCarReqBuilder b) updates]) =
      _$GCreateCarReq;

  static void _initializeBuilder(GCreateCarReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateCar',
    )
    ..executeOnListen = true;
  @override
  _i3.GCreateCarVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GCreateCarData? Function(
    _i2.GCreateCarData?,
    _i2.GCreateCarData?,
  )? get updateResult;
  @override
  _i2.GCreateCarData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateCarData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateCarData.fromJson(json);
  static Serializer<GCreateCarReq> get serializer => _$gCreateCarReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateCarReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateCarReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateCarReq.serializer,
        json,
      );
}

abstract class GAddChatReq
    implements
        Built<GAddChatReq, GAddChatReqBuilder>,
        _i1.OperationRequest<_i2.GAddChatData, _i3.GAddChatVars> {
  GAddChatReq._();

  factory GAddChatReq([Function(GAddChatReqBuilder b) updates]) = _$GAddChatReq;

  static void _initializeBuilder(GAddChatReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AddChat',
    )
    ..executeOnListen = true;
  @override
  _i3.GAddChatVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GAddChatData? Function(
    _i2.GAddChatData?,
    _i2.GAddChatData?,
  )? get updateResult;
  @override
  _i2.GAddChatData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAddChatData? parseData(Map<String, dynamic> json) =>
      _i2.GAddChatData.fromJson(json);
  static Serializer<GAddChatReq> get serializer => _$gAddChatReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAddChatReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddChatReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAddChatReq.serializer,
        json,
      );
}

abstract class GChangeUserPasswordReq
    implements
        Built<GChangeUserPasswordReq, GChangeUserPasswordReqBuilder>,
        _i1.OperationRequest<_i2.GChangeUserPasswordData,
            _i3.GChangeUserPasswordVars> {
  GChangeUserPasswordReq._();

  factory GChangeUserPasswordReq(
          [Function(GChangeUserPasswordReqBuilder b) updates]) =
      _$GChangeUserPasswordReq;

  static void _initializeBuilder(GChangeUserPasswordReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ChangeUserPassword',
    )
    ..executeOnListen = true;
  @override
  _i3.GChangeUserPasswordVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GChangeUserPasswordData? Function(
    _i2.GChangeUserPasswordData?,
    _i2.GChangeUserPasswordData?,
  )? get updateResult;
  @override
  _i2.GChangeUserPasswordData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GChangeUserPasswordData? parseData(Map<String, dynamic> json) =>
      _i2.GChangeUserPasswordData.fromJson(json);
  static Serializer<GChangeUserPasswordReq> get serializer =>
      _$gChangeUserPasswordReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GChangeUserPasswordReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GChangeUserPasswordReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GChangeUserPasswordReq.serializer,
        json,
      );
}

abstract class GSendOTPReq
    implements
        Built<GSendOTPReq, GSendOTPReqBuilder>,
        _i1.OperationRequest<_i2.GSendOTPData, _i3.GSendOTPVars> {
  GSendOTPReq._();

  factory GSendOTPReq([Function(GSendOTPReqBuilder b) updates]) = _$GSendOTPReq;

  static void _initializeBuilder(GSendOTPReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SendOTP',
    )
    ..executeOnListen = true;
  @override
  _i3.GSendOTPVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GSendOTPData? Function(
    _i2.GSendOTPData?,
    _i2.GSendOTPData?,
  )? get updateResult;
  @override
  _i2.GSendOTPData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GSendOTPData? parseData(Map<String, dynamic> json) =>
      _i2.GSendOTPData.fromJson(json);
  static Serializer<GSendOTPReq> get serializer => _$gSendOTPReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSendOTPReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSendOTPReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSendOTPReq.serializer,
        json,
      );
}

abstract class GLNMStatusReq
    implements
        Built<GLNMStatusReq, GLNMStatusReqBuilder>,
        _i1.OperationRequest<_i2.GLNMStatusData, _i3.GLNMStatusVars> {
  GLNMStatusReq._();

  factory GLNMStatusReq([Function(GLNMStatusReqBuilder b) updates]) =
      _$GLNMStatusReq;

  static void _initializeBuilder(GLNMStatusReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'LNMStatus',
    )
    ..executeOnListen = true;
  @override
  _i3.GLNMStatusVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GLNMStatusData? Function(
    _i2.GLNMStatusData?,
    _i2.GLNMStatusData?,
  )? get updateResult;
  @override
  _i2.GLNMStatusData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GLNMStatusData? parseData(Map<String, dynamic> json) =>
      _i2.GLNMStatusData.fromJson(json);
  static Serializer<GLNMStatusReq> get serializer => _$gLNMStatusReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GLNMStatusReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLNMStatusReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GLNMStatusReq.serializer,
        json,
      );
}

abstract class GTransactB2CReq
    implements
        Built<GTransactB2CReq, GTransactB2CReqBuilder>,
        _i1.OperationRequest<_i2.GTransactB2CData, _i3.GTransactB2CVars> {
  GTransactB2CReq._();

  factory GTransactB2CReq([Function(GTransactB2CReqBuilder b) updates]) =
      _$GTransactB2CReq;

  static void _initializeBuilder(GTransactB2CReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'TransactB2C',
    )
    ..executeOnListen = true;
  @override
  _i3.GTransactB2CVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GTransactB2CData? Function(
    _i2.GTransactB2CData?,
    _i2.GTransactB2CData?,
  )? get updateResult;
  @override
  _i2.GTransactB2CData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GTransactB2CData? parseData(Map<String, dynamic> json) =>
      _i2.GTransactB2CData.fromJson(json);
  static Serializer<GTransactB2CReq> get serializer =>
      _$gTransactB2CReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GTransactB2CReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransactB2CReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GTransactB2CReq.serializer,
        json,
      );
}

abstract class GUpdateUserPhoneNumberReq
    implements
        Built<GUpdateUserPhoneNumberReq, GUpdateUserPhoneNumberReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateUserPhoneNumberData,
            _i3.GUpdateUserPhoneNumberVars> {
  GUpdateUserPhoneNumberReq._();

  factory GUpdateUserPhoneNumberReq(
          [Function(GUpdateUserPhoneNumberReqBuilder b) updates]) =
      _$GUpdateUserPhoneNumberReq;

  static void _initializeBuilder(GUpdateUserPhoneNumberReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UpdateUserPhoneNumber',
    )
    ..executeOnListen = true;
  @override
  _i3.GUpdateUserPhoneNumberVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GUpdateUserPhoneNumberData? Function(
    _i2.GUpdateUserPhoneNumberData?,
    _i2.GUpdateUserPhoneNumberData?,
  )? get updateResult;
  @override
  _i2.GUpdateUserPhoneNumberData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUpdateUserPhoneNumberData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateUserPhoneNumberData.fromJson(json);
  static Serializer<GUpdateUserPhoneNumberReq> get serializer =>
      _$gUpdateUserPhoneNumberReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUpdateUserPhoneNumberReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserPhoneNumberReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUpdateUserPhoneNumberReq.serializer,
        json,
      );
}

abstract class GUpdateUserDetailsReq
    implements
        Built<GUpdateUserDetailsReq, GUpdateUserDetailsReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateUserDetailsData,
            _i3.GUpdateUserDetailsVars> {
  GUpdateUserDetailsReq._();

  factory GUpdateUserDetailsReq(
          [Function(GUpdateUserDetailsReqBuilder b) updates]) =
      _$GUpdateUserDetailsReq;

  static void _initializeBuilder(GUpdateUserDetailsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UpdateUserDetails',
    )
    ..executeOnListen = true;
  @override
  _i3.GUpdateUserDetailsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GUpdateUserDetailsData? Function(
    _i2.GUpdateUserDetailsData?,
    _i2.GUpdateUserDetailsData?,
  )? get updateResult;
  @override
  _i2.GUpdateUserDetailsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUpdateUserDetailsData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateUserDetailsData.fromJson(json);
  static Serializer<GUpdateUserDetailsReq> get serializer =>
      _$gUpdateUserDetailsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUpdateUserDetailsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserDetailsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUpdateUserDetailsReq.serializer,
        json,
      );
}

abstract class GUpdateCarDetailsReq
    implements
        Built<GUpdateCarDetailsReq, GUpdateCarDetailsReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateCarDetailsData,
            _i3.GUpdateCarDetailsVars> {
  GUpdateCarDetailsReq._();

  factory GUpdateCarDetailsReq(
          [Function(GUpdateCarDetailsReqBuilder b) updates]) =
      _$GUpdateCarDetailsReq;

  static void _initializeBuilder(GUpdateCarDetailsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UpdateCarDetails',
    )
    ..executeOnListen = true;
  @override
  _i3.GUpdateCarDetailsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GUpdateCarDetailsData? Function(
    _i2.GUpdateCarDetailsData?,
    _i2.GUpdateCarDetailsData?,
  )? get updateResult;
  @override
  _i2.GUpdateCarDetailsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUpdateCarDetailsData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateCarDetailsData.fromJson(json);
  static Serializer<GUpdateCarDetailsReq> get serializer =>
      _$gUpdateCarDetailsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUpdateCarDetailsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateCarDetailsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUpdateCarDetailsReq.serializer,
        json,
      );
}

abstract class GupdateFMCTokenReq
    implements
        Built<GupdateFMCTokenReq, GupdateFMCTokenReqBuilder>,
        _i1.OperationRequest<_i2.GupdateFMCTokenData, _i3.GupdateFMCTokenVars> {
  GupdateFMCTokenReq._();

  factory GupdateFMCTokenReq([Function(GupdateFMCTokenReqBuilder b) updates]) =
      _$GupdateFMCTokenReq;

  static void _initializeBuilder(GupdateFMCTokenReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'updateFMCToken',
    )
    ..executeOnListen = true;
  @override
  _i3.GupdateFMCTokenVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GupdateFMCTokenData? Function(
    _i2.GupdateFMCTokenData?,
    _i2.GupdateFMCTokenData?,
  )? get updateResult;
  @override
  _i2.GupdateFMCTokenData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GupdateFMCTokenData? parseData(Map<String, dynamic> json) =>
      _i2.GupdateFMCTokenData.fromJson(json);
  static Serializer<GupdateFMCTokenReq> get serializer =>
      _$gupdateFMCTokenReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GupdateFMCTokenReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GupdateFMCTokenReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GupdateFMCTokenReq.serializer,
        json,
      );
}

abstract class GCheckIfUserIsDriverReq
    implements
        Built<GCheckIfUserIsDriverReq, GCheckIfUserIsDriverReqBuilder>,
        _i1.OperationRequest<_i2.GCheckIfUserIsDriverData,
            _i3.GCheckIfUserIsDriverVars> {
  GCheckIfUserIsDriverReq._();

  factory GCheckIfUserIsDriverReq(
          [Function(GCheckIfUserIsDriverReqBuilder b) updates]) =
      _$GCheckIfUserIsDriverReq;

  static void _initializeBuilder(GCheckIfUserIsDriverReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CheckIfUserIsDriver',
    )
    ..executeOnListen = true;
  @override
  _i3.GCheckIfUserIsDriverVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GCheckIfUserIsDriverData? Function(
    _i2.GCheckIfUserIsDriverData?,
    _i2.GCheckIfUserIsDriverData?,
  )? get updateResult;
  @override
  _i2.GCheckIfUserIsDriverData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCheckIfUserIsDriverData? parseData(Map<String, dynamic> json) =>
      _i2.GCheckIfUserIsDriverData.fromJson(json);
  static Serializer<GCheckIfUserIsDriverReq> get serializer =>
      _$gCheckIfUserIsDriverReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCheckIfUserIsDriverReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCheckIfUserIsDriverReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCheckIfUserIsDriverReq.serializer,
        json,
      );
}

abstract class GGetAllRolesReq
    implements
        Built<GGetAllRolesReq, GGetAllRolesReqBuilder>,
        _i1.OperationRequest<_i2.GGetAllRolesData, _i3.GGetAllRolesVars> {
  GGetAllRolesReq._();

  factory GGetAllRolesReq([Function(GGetAllRolesReqBuilder b) updates]) =
      _$GGetAllRolesReq;

  static void _initializeBuilder(GGetAllRolesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetAllRoles',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetAllRolesVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetAllRolesData? Function(
    _i2.GGetAllRolesData?,
    _i2.GGetAllRolesData?,
  )? get updateResult;
  @override
  _i2.GGetAllRolesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetAllRolesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetAllRolesData.fromJson(json);
  static Serializer<GGetAllRolesReq> get serializer =>
      _$gGetAllRolesReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetAllRolesReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllRolesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetAllRolesReq.serializer,
        json,
      );
}

abstract class GGetDriverTripsReq
    implements
        Built<GGetDriverTripsReq, GGetDriverTripsReqBuilder>,
        _i1.OperationRequest<_i2.GGetDriverTripsData, _i3.GGetDriverTripsVars> {
  GGetDriverTripsReq._();

  factory GGetDriverTripsReq([Function(GGetDriverTripsReqBuilder b) updates]) =
      _$GGetDriverTripsReq;

  static void _initializeBuilder(GGetDriverTripsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetDriverTrips',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetDriverTripsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetDriverTripsData? Function(
    _i2.GGetDriverTripsData?,
    _i2.GGetDriverTripsData?,
  )? get updateResult;
  @override
  _i2.GGetDriverTripsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetDriverTripsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetDriverTripsData.fromJson(json);
  static Serializer<GGetDriverTripsReq> get serializer =>
      _$gGetDriverTripsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetDriverTripsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDriverTripsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetDriverTripsReq.serializer,
        json,
      );
}

abstract class GGetPaidTripsReq
    implements
        Built<GGetPaidTripsReq, GGetPaidTripsReqBuilder>,
        _i1.OperationRequest<_i2.GGetPaidTripsData, _i3.GGetPaidTripsVars> {
  GGetPaidTripsReq._();

  factory GGetPaidTripsReq([Function(GGetPaidTripsReqBuilder b) updates]) =
      _$GGetPaidTripsReq;

  static void _initializeBuilder(GGetPaidTripsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetPaidTrips',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetPaidTripsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetPaidTripsData? Function(
    _i2.GGetPaidTripsData?,
    _i2.GGetPaidTripsData?,
  )? get updateResult;
  @override
  _i2.GGetPaidTripsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetPaidTripsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetPaidTripsData.fromJson(json);
  static Serializer<GGetPaidTripsReq> get serializer =>
      _$gGetPaidTripsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetPaidTripsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPaidTripsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetPaidTripsReq.serializer,
        json,
      );
}

abstract class GGetUserByUserNameReq
    implements
        Built<GGetUserByUserNameReq, GGetUserByUserNameReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserByUserNameData,
            _i3.GGetUserByUserNameVars> {
  GGetUserByUserNameReq._();

  factory GGetUserByUserNameReq(
          [Function(GGetUserByUserNameReqBuilder b) updates]) =
      _$GGetUserByUserNameReq;

  static void _initializeBuilder(GGetUserByUserNameReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserByUserName',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetUserByUserNameVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetUserByUserNameData? Function(
    _i2.GGetUserByUserNameData?,
    _i2.GGetUserByUserNameData?,
  )? get updateResult;
  @override
  _i2.GGetUserByUserNameData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserByUserNameData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserByUserNameData.fromJson(json);
  static Serializer<GGetUserByUserNameReq> get serializer =>
      _$gGetUserByUserNameReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserByUserNameReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByUserNameReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserByUserNameReq.serializer,
        json,
      );
}

abstract class GFilterToAndFromRidesReq
    implements
        Built<GFilterToAndFromRidesReq, GFilterToAndFromRidesReqBuilder>,
        _i1.OperationRequest<_i2.GFilterToAndFromRidesData,
            _i3.GFilterToAndFromRidesVars> {
  GFilterToAndFromRidesReq._();

  factory GFilterToAndFromRidesReq(
          [Function(GFilterToAndFromRidesReqBuilder b) updates]) =
      _$GFilterToAndFromRidesReq;

  static void _initializeBuilder(GFilterToAndFromRidesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'FilterToAndFromRides',
    )
    ..executeOnListen = true;
  @override
  _i3.GFilterToAndFromRidesVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GFilterToAndFromRidesData? Function(
    _i2.GFilterToAndFromRidesData?,
    _i2.GFilterToAndFromRidesData?,
  )? get updateResult;
  @override
  _i2.GFilterToAndFromRidesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFilterToAndFromRidesData? parseData(Map<String, dynamic> json) =>
      _i2.GFilterToAndFromRidesData.fromJson(json);
  static Serializer<GFilterToAndFromRidesReq> get serializer =>
      _$gFilterToAndFromRidesReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFilterToAndFromRidesReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterToAndFromRidesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFilterToAndFromRidesReq.serializer,
        json,
      );
}

abstract class GGetUserCarsReq
    implements
        Built<GGetUserCarsReq, GGetUserCarsReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserCarsData, _i3.GGetUserCarsVars> {
  GGetUserCarsReq._();

  factory GGetUserCarsReq([Function(GGetUserCarsReqBuilder b) updates]) =
      _$GGetUserCarsReq;

  static void _initializeBuilder(GGetUserCarsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserCars',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetUserCarsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetUserCarsData? Function(
    _i2.GGetUserCarsData?,
    _i2.GGetUserCarsData?,
  )? get updateResult;
  @override
  _i2.GGetUserCarsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserCarsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserCarsData.fromJson(json);
  static Serializer<GGetUserCarsReq> get serializer =>
      _$gGetUserCarsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserCarsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserCarsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserCarsReq.serializer,
        json,
      );
}

abstract class GGetUserWithFilterReq
    implements
        Built<GGetUserWithFilterReq, GGetUserWithFilterReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserWithFilterData,
            _i3.GGetUserWithFilterVars> {
  GGetUserWithFilterReq._();

  factory GGetUserWithFilterReq(
          [Function(GGetUserWithFilterReqBuilder b) updates]) =
      _$GGetUserWithFilterReq;

  static void _initializeBuilder(GGetUserWithFilterReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserWithFilter',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetUserWithFilterVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetUserWithFilterData? Function(
    _i2.GGetUserWithFilterData?,
    _i2.GGetUserWithFilterData?,
  )? get updateResult;
  @override
  _i2.GGetUserWithFilterData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserWithFilterData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserWithFilterData.fromJson(json);
  static Serializer<GGetUserWithFilterReq> get serializer =>
      _$gGetUserWithFilterReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserWithFilterReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserWithFilterReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserWithFilterReq.serializer,
        json,
      );
}

abstract class GGetUserByIdReq
    implements
        Built<GGetUserByIdReq, GGetUserByIdReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserByIdData, _i3.GGetUserByIdVars> {
  GGetUserByIdReq._();

  factory GGetUserByIdReq([Function(GGetUserByIdReqBuilder b) updates]) =
      _$GGetUserByIdReq;

  static void _initializeBuilder(GGetUserByIdReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserById',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetUserByIdVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetUserByIdData? Function(
    _i2.GGetUserByIdData?,
    _i2.GGetUserByIdData?,
  )? get updateResult;
  @override
  _i2.GGetUserByIdData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserByIdData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserByIdData.fromJson(json);
  static Serializer<GGetUserByIdReq> get serializer =>
      _$gGetUserByIdReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserByIdReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetUserByIdReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserByIdReq.serializer,
        json,
      );
}

abstract class GGetOnGoingUserBookingsReq
    implements
        Built<GGetOnGoingUserBookingsReq, GGetOnGoingUserBookingsReqBuilder>,
        _i1.OperationRequest<_i2.GGetOnGoingUserBookingsData,
            _i3.GGetOnGoingUserBookingsVars> {
  GGetOnGoingUserBookingsReq._();

  factory GGetOnGoingUserBookingsReq(
          [Function(GGetOnGoingUserBookingsReqBuilder b) updates]) =
      _$GGetOnGoingUserBookingsReq;

  static void _initializeBuilder(GGetOnGoingUserBookingsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetOnGoingUserBookings',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetOnGoingUserBookingsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetOnGoingUserBookingsData? Function(
    _i2.GGetOnGoingUserBookingsData?,
    _i2.GGetOnGoingUserBookingsData?,
  )? get updateResult;
  @override
  _i2.GGetOnGoingUserBookingsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetOnGoingUserBookingsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetOnGoingUserBookingsData.fromJson(json);
  static Serializer<GGetOnGoingUserBookingsReq> get serializer =>
      _$gGetOnGoingUserBookingsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetOnGoingUserBookingsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetOnGoingUserBookingsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetOnGoingUserBookingsReq.serializer,
        json,
      );
}

abstract class GGetPastUserBookingsReq
    implements
        Built<GGetPastUserBookingsReq, GGetPastUserBookingsReqBuilder>,
        _i1.OperationRequest<_i2.GGetPastUserBookingsData,
            _i3.GGetPastUserBookingsVars> {
  GGetPastUserBookingsReq._();

  factory GGetPastUserBookingsReq(
          [Function(GGetPastUserBookingsReqBuilder b) updates]) =
      _$GGetPastUserBookingsReq;

  static void _initializeBuilder(GGetPastUserBookingsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetPastUserBookings',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetPastUserBookingsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetPastUserBookingsData? Function(
    _i2.GGetPastUserBookingsData?,
    _i2.GGetPastUserBookingsData?,
  )? get updateResult;
  @override
  _i2.GGetPastUserBookingsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetPastUserBookingsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetPastUserBookingsData.fromJson(json);
  static Serializer<GGetPastUserBookingsReq> get serializer =>
      _$gGetPastUserBookingsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetPastUserBookingsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetPastUserBookingsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetPastUserBookingsReq.serializer,
        json,
      );
}

abstract class GGetRidesReq
    implements
        Built<GGetRidesReq, GGetRidesReqBuilder>,
        _i1.OperationRequest<_i2.GGetRidesData, _i3.GGetRidesVars> {
  GGetRidesReq._();

  factory GGetRidesReq([Function(GGetRidesReqBuilder b) updates]) =
      _$GGetRidesReq;

  static void _initializeBuilder(GGetRidesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetRides',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetRidesVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetRidesData? Function(
    _i2.GGetRidesData?,
    _i2.GGetRidesData?,
  )? get updateResult;
  @override
  _i2.GGetRidesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetRidesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetRidesData.fromJson(json);
  static Serializer<GGetRidesReq> get serializer => _$gGetRidesReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetRidesReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetRidesReq.serializer,
        json,
      );
}

abstract class GGetLatestRidesReq
    implements
        Built<GGetLatestRidesReq, GGetLatestRidesReqBuilder>,
        _i1.OperationRequest<_i2.GGetLatestRidesData, _i3.GGetLatestRidesVars> {
  GGetLatestRidesReq._();

  factory GGetLatestRidesReq([Function(GGetLatestRidesReqBuilder b) updates]) =
      _$GGetLatestRidesReq;

  static void _initializeBuilder(GGetLatestRidesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetLatestRides',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetLatestRidesVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetLatestRidesData? Function(
    _i2.GGetLatestRidesData?,
    _i2.GGetLatestRidesData?,
  )? get updateResult;
  @override
  _i2.GGetLatestRidesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetLatestRidesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetLatestRidesData.fromJson(json);
  static Serializer<GGetLatestRidesReq> get serializer =>
      _$gGetLatestRidesReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetLatestRidesReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetLatestRidesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetLatestRidesReq.serializer,
        json,
      );
}

abstract class GGetRideInfoReq
    implements
        Built<GGetRideInfoReq, GGetRideInfoReqBuilder>,
        _i1.OperationRequest<_i2.GGetRideInfoData, _i3.GGetRideInfoVars> {
  GGetRideInfoReq._();

  factory GGetRideInfoReq([Function(GGetRideInfoReqBuilder b) updates]) =
      _$GGetRideInfoReq;

  static void _initializeBuilder(GGetRideInfoReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetRideInfo',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetRideInfoVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetRideInfoData? Function(
    _i2.GGetRideInfoData?,
    _i2.GGetRideInfoData?,
  )? get updateResult;
  @override
  _i2.GGetRideInfoData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetRideInfoData? parseData(Map<String, dynamic> json) =>
      _i2.GGetRideInfoData.fromJson(json);
  static Serializer<GGetRideInfoReq> get serializer =>
      _$gGetRideInfoReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetRideInfoReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideInfoReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetRideInfoReq.serializer,
        json,
      );
}

abstract class GGetRideReq
    implements
        Built<GGetRideReq, GGetRideReqBuilder>,
        _i1.OperationRequest<_i2.GGetRideData, _i3.GGetRideVars> {
  GGetRideReq._();

  factory GGetRideReq([Function(GGetRideReqBuilder b) updates]) = _$GGetRideReq;

  static void _initializeBuilder(GGetRideReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetRide',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetRideVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetRideData? Function(
    _i2.GGetRideData?,
    _i2.GGetRideData?,
  )? get updateResult;
  @override
  _i2.GGetRideData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetRideData? parseData(Map<String, dynamic> json) =>
      _i2.GGetRideData.fromJson(json);
  static Serializer<GGetRideReq> get serializer => _$gGetRideReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetRideReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRideReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetRideReq.serializer,
        json,
      );
}

abstract class GGetRidesWithFilterReq
    implements
        Built<GGetRidesWithFilterReq, GGetRidesWithFilterReqBuilder>,
        _i1.OperationRequest<_i2.GGetRidesWithFilterData,
            _i3.GGetRidesWithFilterVars> {
  GGetRidesWithFilterReq._();

  factory GGetRidesWithFilterReq(
          [Function(GGetRidesWithFilterReqBuilder b) updates]) =
      _$GGetRidesWithFilterReq;

  static void _initializeBuilder(GGetRidesWithFilterReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetRidesWithFilter',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetRidesWithFilterVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetRidesWithFilterData? Function(
    _i2.GGetRidesWithFilterData?,
    _i2.GGetRidesWithFilterData?,
  )? get updateResult;
  @override
  _i2.GGetRidesWithFilterData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetRidesWithFilterData? parseData(Map<String, dynamic> json) =>
      _i2.GGetRidesWithFilterData.fromJson(json);
  static Serializer<GGetRidesWithFilterReq> get serializer =>
      _$gGetRidesWithFilterReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetRidesWithFilterReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetRidesWithFilterReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetRidesWithFilterReq.serializer,
        json,
      );
}

abstract class GGetDestinationRidesReq
    implements
        Built<GGetDestinationRidesReq, GGetDestinationRidesReqBuilder>,
        _i1.OperationRequest<_i2.GGetDestinationRidesData,
            _i3.GGetDestinationRidesVars> {
  GGetDestinationRidesReq._();

  factory GGetDestinationRidesReq(
          [Function(GGetDestinationRidesReqBuilder b) updates]) =
      _$GGetDestinationRidesReq;

  static void _initializeBuilder(GGetDestinationRidesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetDestinationRides',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetDestinationRidesVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetDestinationRidesData? Function(
    _i2.GGetDestinationRidesData?,
    _i2.GGetDestinationRidesData?,
  )? get updateResult;
  @override
  _i2.GGetDestinationRidesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetDestinationRidesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetDestinationRidesData.fromJson(json);
  static Serializer<GGetDestinationRidesReq> get serializer =>
      _$gGetDestinationRidesReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetDestinationRidesReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetDestinationRidesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetDestinationRidesReq.serializer,
        json,
      );
}

abstract class GOnGetMessageReq
    implements
        Built<GOnGetMessageReq, GOnGetMessageReqBuilder>,
        _i1.OperationRequest<_i2.GOnGetMessageData, _i3.GOnGetMessageVars> {
  GOnGetMessageReq._();

  factory GOnGetMessageReq([Function(GOnGetMessageReqBuilder b) updates]) =
      _$GOnGetMessageReq;

  static void _initializeBuilder(GOnGetMessageReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'OnGetMessage',
    )
    ..executeOnListen = true;
  @override
  _i3.GOnGetMessageVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GOnGetMessageData? Function(
    _i2.GOnGetMessageData?,
    _i2.GOnGetMessageData?,
  )? get updateResult;
  @override
  _i2.GOnGetMessageData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GOnGetMessageData? parseData(Map<String, dynamic> json) =>
      _i2.GOnGetMessageData.fromJson(json);
  static Serializer<GOnGetMessageReq> get serializer =>
      _$gOnGetMessageReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GOnGetMessageReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOnGetMessageReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GOnGetMessageReq.serializer,
        json,
      );
}
