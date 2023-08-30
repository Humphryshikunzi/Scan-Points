// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAPIRequestFilterInput.serializer)
      ..add(GAPIRequestSortInput.serializer)
      ..add(GAddChatData.serializer)
      ..add(GAddChatData_addChart.serializer)
      ..add(GAddChatReq.serializer)
      ..add(GAddChatVars.serializer)
      ..add(GApplyPolicy.serializer)
      ..add(GBooleanOperationFilterInput.serializer)
      ..add(GByte.serializer)
      ..add(GCarFilterInput.serializer)
      ..add(GCarInput.serializer)
      ..add(GCarSortInput.serializer)
      ..add(GCarUpdateDtoInput.serializer)
      ..add(GChangePasswordRequestInput.serializer)
      ..add(GChangeUserPasswordData.serializer)
      ..add(GChangeUserPasswordData_passwordResetRequestByPhone.serializer)
      ..add(GChangeUserPasswordReq.serializer)
      ..add(GChangeUserPasswordVars.serializer)
      ..add(GChartDtoInput.serializer)
      ..add(GCheckIfUserIsDriverData.serializer)
      ..add(GCheckIfUserIsDriverData_usersInRole.serializer)
      ..add(GCheckIfUserIsDriverReq.serializer)
      ..add(GCheckIfUserIsDriverVars.serializer)
      ..add(GColorCustomFilterInput.serializer)
      ..add(GColorCustomInput.serializer)
      ..add(GCommandType.serializer)
      ..add(GComparableDateTimeOperationFilterInput.serializer)
      ..add(GComparableDecimalOperationFilterInput.serializer)
      ..add(GComparableDoubleOperationFilterInput.serializer)
      ..add(GComparableInt32OperationFilterInput.serializer)
      ..add(GComparableNullableOfDateTimeOffsetOperationFilterInput.serializer)
      ..add(GComparableNullableOfDateTimeOperationFilterInput.serializer)
      ..add(GComparableNullableOfInt32OperationFilterInput.serializer)
      ..add(GComparableNullableOfTimeSpanOperationFilterInput.serializer)
      ..add(GComparableSingleOperationFilterInput.serializer)
      ..add(GComparableTimeSpanOperationFilterInput.serializer)
      ..add(GContactUsRequestInput.serializer)
      ..add(GCountryDtoInput.serializer)
      ..add(GCountryFilterInput.serializer)
      ..add(GCountryInput.serializer)
      ..add(GCountrySortInput.serializer)
      ..add(GCreateARideData.serializer)
      ..add(GCreateARideData_createARide.serializer)
      ..add(GCreateARideData_createARide_users.serializer)
      ..add(GCreateARideReq.serializer)
      ..add(GCreateARideVars.serializer)
      ..add(GCreateCarData.serializer)
      ..add(GCreateCarData_createCar.serializer)
      ..add(GCreateCarReq.serializer)
      ..add(GCreateCarVars.serializer)
      ..add(GCreateRideRequestInput.serializer)
      ..add(GDateTime.serializer)
      ..add(GDecimal.serializer)
      ..add(GDeviceDtoInput.serializer)
      ..add(GDeviceFilterInput.serializer)
      ..add(GDeviceInput.serializer)
      ..add(GDeviceSortInput.serializer)
      ..add(GDownloadRequestInput.serializer)
      ..add(GFilterToAndFromRidesData.serializer)
      ..add(GFilterToAndFromRidesData_rides.serializer)
      ..add(GFilterToAndFromRidesData_rides_car.serializer)
      ..add(GFilterToAndFromRidesData_rides_seat.serializer)
      ..add(GFilterToAndFromRidesData_rides_users.serializer)
      ..add(GFilterToAndFromRidesData_rides_users_user.serializer)
      ..add(GFilterToAndFromRidesReq.serializer)
      ..add(GFilterToAndFromRidesVars.serializer)
      ..add(GForgotPasswordRequestInput.serializer)
      ..add(GFrequentRouteFilterInput.serializer)
      ..add(GFrequentRouteInput.serializer)
      ..add(GGetAllRolesData.serializer)
      ..add(GGetAllRolesData_roles.serializer)
      ..add(GGetAllRolesData_roles_data.serializer)
      ..add(GGetAllRolesReq.serializer)
      ..add(GGetAllRolesVars.serializer)
      ..add(GGetDestinationRidesData.serializer)
      ..add(GGetDestinationRidesData_rides.serializer)
      ..add(GGetDestinationRidesData_rides_car.serializer)
      ..add(GGetDestinationRidesData_rides_car_owner.serializer)
      ..add(GGetDestinationRidesData_rides_seat.serializer)
      ..add(GGetDestinationRidesData_rides_users.serializer)
      ..add(GGetDestinationRidesData_rides_users_user.serializer)
      ..add(GGetDestinationRidesReq.serializer)
      ..add(GGetDestinationRidesVars.serializer)
      ..add(GGetDriverTripsData.serializer)
      ..add(GGetDriverTripsData_rides.serializer)
      ..add(GGetDriverTripsData_rides_car.serializer)
      ..add(GGetDriverTripsReq.serializer)
      ..add(GGetDriverTripsVars.serializer)
      ..add(GGetLatestRidesData.serializer)
      ..add(GGetLatestRidesData_latestRides.serializer)
      ..add(GGetLatestRidesData_latestRides_car.serializer)
      ..add(GGetLatestRidesData_latestRides_car_owner.serializer)
      ..add(GGetLatestRidesData_latestRides_seat.serializer)
      ..add(GGetLatestRidesData_latestRides_users.serializer)
      ..add(GGetLatestRidesData_latestRides_users_user.serializer)
      ..add(GGetLatestRidesReq.serializer)
      ..add(GGetLatestRidesVars.serializer)
      ..add(GGetOnGoingUserBookingsData.serializer)
      ..add(GGetOnGoingUserBookingsData_rides.serializer)
      ..add(GGetOnGoingUserBookingsData_rides_car.serializer)
      ..add(GGetOnGoingUserBookingsData_rides_car_owner.serializer)
      ..add(GGetOnGoingUserBookingsData_rides_seat.serializer)
      ..add(GGetOnGoingUserBookingsData_rides_transactions.serializer)
      ..add(GGetOnGoingUserBookingsData_rides_users.serializer)
      ..add(GGetOnGoingUserBookingsData_rides_users_user.serializer)
      ..add(GGetOnGoingUserBookingsReq.serializer)
      ..add(GGetOnGoingUserBookingsVars.serializer)
      ..add(GGetPaidTripsData.serializer)
      ..add(GGetPaidTripsData_rides.serializer)
      ..add(GGetPaidTripsData_rides_car.serializer)
      ..add(GGetPaidTripsReq.serializer)
      ..add(GGetPaidTripsVars.serializer)
      ..add(GGetPastUserBookingsData.serializer)
      ..add(GGetPastUserBookingsData_rides.serializer)
      ..add(GGetPastUserBookingsData_rides_car.serializer)
      ..add(GGetPastUserBookingsData_rides_car_owner.serializer)
      ..add(GGetPastUserBookingsData_rides_seat.serializer)
      ..add(GGetPastUserBookingsData_rides_transactions.serializer)
      ..add(GGetPastUserBookingsData_rides_users.serializer)
      ..add(GGetPastUserBookingsData_rides_users_user.serializer)
      ..add(GGetPastUserBookingsReq.serializer)
      ..add(GGetPastUserBookingsVars.serializer)
      ..add(GGetRideData.serializer)
      ..add(GGetRideData_rides.serializer)
      ..add(GGetRideData_rides_car.serializer)
      ..add(GGetRideData_rides_car_owner.serializer)
      ..add(GGetRideData_rides_seat.serializer)
      ..add(GGetRideData_rides_users.serializer)
      ..add(GGetRideData_rides_users_user.serializer)
      ..add(GGetRideInfoData.serializer)
      ..add(GGetRideInfoData_rides.serializer)
      ..add(GGetRideInfoData_rides_car.serializer)
      ..add(GGetRideInfoData_rides_car_owner.serializer)
      ..add(GGetRideInfoData_rides_seat.serializer)
      ..add(GGetRideInfoData_rides_users.serializer)
      ..add(GGetRideInfoData_rides_users_user.serializer)
      ..add(GGetRideInfoReq.serializer)
      ..add(GGetRideInfoVars.serializer)
      ..add(GGetRideReq.serializer)
      ..add(GGetRideVars.serializer)
      ..add(GGetRidesData.serializer)
      ..add(GGetRidesData_rides.serializer)
      ..add(GGetRidesData_rides_car.serializer)
      ..add(GGetRidesData_rides_car_owner.serializer)
      ..add(GGetRidesData_rides_seat.serializer)
      ..add(GGetRidesData_rides_users.serializer)
      ..add(GGetRidesData_rides_users_user.serializer)
      ..add(GGetRidesReq.serializer)
      ..add(GGetRidesVars.serializer)
      ..add(GGetRidesWithFilterData.serializer)
      ..add(GGetRidesWithFilterData_rides.serializer)
      ..add(GGetRidesWithFilterData_rides_car.serializer)
      ..add(GGetRidesWithFilterData_rides_car_owner.serializer)
      ..add(GGetRidesWithFilterData_rides_seat.serializer)
      ..add(GGetRidesWithFilterData_rides_users.serializer)
      ..add(GGetRidesWithFilterData_rides_users_user.serializer)
      ..add(GGetRidesWithFilterReq.serializer)
      ..add(GGetRidesWithFilterVars.serializer)
      ..add(GGetUserByIdData.serializer)
      ..add(GGetUserByIdData_users.serializer)
      ..add(GGetUserByIdData_users_device.serializer)
      ..add(GGetUserByIdData_users_ownedCars.serializer)
      ..add(GGetUserByIdData_users_userRatings.serializer)
      ..add(GGetUserByIdData_users_userRatings_reviewer.serializer)
      ..add(GGetUserByIdReq.serializer)
      ..add(GGetUserByIdVars.serializer)
      ..add(GGetUserByUserNameData.serializer)
      ..add(GGetUserByUserNameData_users.serializer)
      ..add(GGetUserByUserNameData_users_identificationDocument.serializer)
      ..add(GGetUserByUserNameData_users_ownedCars.serializer)
      ..add(GGetUserByUserNameReq.serializer)
      ..add(GGetUserByUserNameVars.serializer)
      ..add(GGetUserCarsData.serializer)
      ..add(GGetUserCarsData_users.serializer)
      ..add(GGetUserCarsData_users_ownedCars.serializer)
      ..add(GGetUserCarsReq.serializer)
      ..add(GGetUserCarsVars.serializer)
      ..add(GGetUserWithFilterData.serializer)
      ..add(GGetUserWithFilterData_users.serializer)
      ..add(GGetUserWithFilterData_users_frequentRoutes.serializer)
      ..add(GGetUserWithFilterData_users_frequentRoutes_color.serializer)
      ..add(GGetUserWithFilterData_users_location.serializer)
      ..add(GGetUserWithFilterData_users_location_country.serializer)
      ..add(GGetUserWithFilterData_users_ownedCars.serializer)
      ..add(GGetUserWithFilterReq.serializer)
      ..add(GGetUserWithFilterVars.serializer)
      ..add(GIdentificationDocumentFilterInput.serializer)
      ..add(GIdentificationDocumentInput.serializer)
      ..add(GIdentificationDocumentSortInput.serializer)
      ..add(GLNMStatusData.serializer)
      ..add(GLNMStatusData_lNMPesaStatus.serializer)
      ..add(GLNMStatusReq.serializer)
      ..add(GLNMStatusVars.serializer)
      ..add(GListFilterInputTypeOfCarFilterInput.serializer)
      ..add(GListFilterInputTypeOfFrequentRouteFilterInput.serializer)
      ..add(GListFilterInputTypeOfRideFilterInput.serializer)
      ..add(GListFilterInputTypeOfRideTransactionFilterInput.serializer)
      ..add(GListFilterInputTypeOfSafiriCarUserFilterInput.serializer)
      ..add(GListFilterInputTypeOfUserRatingFilterInput.serializer)
      ..add(GListFilterInputTypeOfUserRidesFilterInput.serializer)
      ..add(GLocationDtoInput.serializer)
      ..add(GLocationFilterInput.serializer)
      ..add(GLocationInput.serializer)
      ..add(GLocationSortInput.serializer)
      ..add(GOnGetMessageData.serializer)
      ..add(GOnGetMessageData_onGetMessage.serializer)
      ..add(GOnGetMessageReq.serializer)
      ..add(GOnGetMessageVars.serializer)
      ..add(GPamrideMessageFilterInput.serializer)
      ..add(GPamrideMessageSortInput.serializer)
      ..add(GPasswordResetRequestByPhoneInput.serializer)
      ..add(GPermissionRequestInput.serializer)
      ..add(GRegisterRequestInput.serializer)
      ..add(GRegisterUserData.serializer)
      ..add(GRegisterUserData_registerUser.serializer)
      ..add(GRegisterUserReq.serializer)
      ..add(GRegisterUserVars.serializer)
      ..add(GResetPasswordRequestInput.serializer)
      ..add(GResfreshTokenRequestInput.serializer)
      ..add(GReverseRequestInput.serializer)
      ..add(GRideFilterInput.serializer)
      ..add(GRideInput.serializer)
      ..add(GRideSortInput.serializer)
      ..add(GRideTransactionFilterInput.serializer)
      ..add(GRideTransactionInput.serializer)
      ..add(GRideTransactionSortInput.serializer)
      ..add(GRoleClaimRequestInput.serializer)
      ..add(GRoleRequestInput.serializer)
      ..add(GSafiriCarUserFilterInput.serializer)
      ..add(GSafiriCarUserInput.serializer)
      ..add(GSafiriCarUserSortInput.serializer)
      ..add(GSaveUserFileData.serializer)
      ..add(GSaveUserFileReq.serializer)
      ..add(GSaveUserFileStringData.serializer)
      ..add(GSaveUserFileStringReq.serializer)
      ..add(GSaveUserFileStringVars.serializer)
      ..add(GSaveUserFileVars.serializer)
      ..add(GSeatFilterInput.serializer)
      ..add(GSeatInput.serializer)
      ..add(GSeatSortInput.serializer)
      ..add(GSendOTPData.serializer)
      ..add(GSendOTPReq.serializer)
      ..add(GSendOTPVars.serializer)
      ..add(GSortEnumType.serializer)
      ..add(GStringOperationFilterInput.serializer)
      ..add(GSubscriberEmailInput.serializer)
      ..add(GTimeSpan.serializer)
      ..add(GToggleUserStatusRequestInput.serializer)
      ..add(GTokenRequestInput.serializer)
      ..add(GTransactB2CData.serializer)
      ..add(GTransactB2CData_transactB2C.serializer)
      ..add(GTransactB2CReq.serializer)
      ..add(GTransactB2CRequestInput.serializer)
      ..add(GTransactB2CVars.serializer)
      ..add(GTransactRequestInput.serializer)
      ..add(GTransactionData.serializer)
      ..add(GTransactionData_transact.serializer)
      ..add(GTransactionReq.serializer)
      ..add(GTransactionStatusRequestDtoInput.serializer)
      ..add(GTransactionVars.serializer)
      ..add(GUpdateCarDetailsData.serializer)
      ..add(GUpdateCarDetailsData_updateCar.serializer)
      ..add(GUpdateCarDetailsReq.serializer)
      ..add(GUpdateCarDetailsVars.serializer)
      ..add(GUpdateIdentificationDocumentRequestInput.serializer)
      ..add(GUpdateLicenceDocumentsData.serializer)
      ..add(GUpdateLicenceDocumentsData_updateUserDocuments.serializer)
      ..add(GUpdateLicenceDocumentsReq.serializer)
      ..add(GUpdateLicenceDocumentsVars.serializer)
      ..add(GUpdateProfileRequestInput.serializer)
      ..add(GUpdateRequestInput.serializer)
      ..add(GUpdateUserDetailsData.serializer)
      ..add(GUpdateUserDetailsData_updateUser.serializer)
      ..add(GUpdateUserDetailsReq.serializer)
      ..add(GUpdateUserDetailsVars.serializer)
      ..add(GUpdateUserPhoneNumberData.serializer)
      ..add(GUpdateUserPhoneNumberData_updateUserPhoneNumber.serializer)
      ..add(GUpdateUserPhoneNumberReq.serializer)
      ..add(GUpdateUserPhoneNumberVars.serializer)
      ..add(GUpdateUserRolesRequestInput.serializer)
      ..add(GUploadRequestFlInput.serializer)
      ..add(GUploadRequestInput.serializer)
      ..add(GUploadType.serializer)
      ..add(GUserLoginData.serializer)
      ..add(GUserLoginData_login.serializer)
      ..add(GUserLoginData_login_data.serializer)
      ..add(GUserLoginReq.serializer)
      ..add(GUserLoginVars.serializer)
      ..add(GUserRatingFilterInput.serializer)
      ..add(GUserRatingInput.serializer)
      ..add(GUserRidesFilterInput.serializer)
      ..add(GUserRidesInput.serializer)
      ..add(GUserRidesSortInput.serializer)
      ..add(GUserRoleModelInput.serializer)
      ..add(GupdateFMCTokenData.serializer)
      ..add(GupdateFMCTokenData_updateFMCToken.serializer)
      ..add(GupdateFMCTokenReq.serializer)
      ..add(GupdateFMCTokenVars.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GAPIRequestFilterInput)]),
          () => new ListBuilder<GAPIRequestFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GAPIRequestFilterInput)]),
          () => new ListBuilder<GAPIRequestFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GByte)]),
          () => new ListBuilder<GByte>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GCarFilterInput)]),
          () => new ListBuilder<GCarFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GCarFilterInput)]),
          () => new ListBuilder<GCarFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GCarInput)]),
          () => new ListBuilder<GCarInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GUserRidesInput)]),
          () => new ListBuilder<GUserRidesInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GUserRatingInput)]),
          () => new ListBuilder<GUserRatingInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFrequentRouteInput)]),
          () => new ListBuilder<GFrequentRouteInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GSafiriCarUserInput)]),
          () => new ListBuilder<GSafiriCarUserInput>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GCheckIfUserIsDriverData_usersInRole)]),
          () => new ListBuilder<GCheckIfUserIsDriverData_usersInRole>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GColorCustomFilterInput)]),
          () => new ListBuilder<GColorCustomFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GColorCustomFilterInput)]),
          () => new ListBuilder<GColorCustomFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GCountryFilterInput)]),
          () => new ListBuilder<GCountryFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GCountryFilterInput)]),
          () => new ListBuilder<GCountryFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GCreateARideData_createARide_users)]),
          () => new ListBuilder<GCreateARideData_createARide_users>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDateTime)]),
          () => new ListBuilder<GDateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDateTime)]),
          () => new ListBuilder<GDateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDateTime)]),
          () => new ListBuilder<GDateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDateTime)]),
          () => new ListBuilder<GDateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDateTime)]),
          () => new ListBuilder<GDateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDateTime)]),
          () => new ListBuilder<GDateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDecimal)]),
          () => new ListBuilder<GDecimal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDecimal)]),
          () => new ListBuilder<GDecimal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDeviceFilterInput)]),
          () => new ListBuilder<GDeviceFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GDeviceFilterInput)]),
          () => new ListBuilder<GDeviceFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFilterToAndFromRidesData_rides)]),
          () => new ListBuilder<GFilterToAndFromRidesData_rides>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFilterToAndFromRidesData_rides_users)]),
          () => new ListBuilder<GFilterToAndFromRidesData_rides_users>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFrequentRouteFilterInput)]),
          () => new ListBuilder<GFrequentRouteFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFrequentRouteFilterInput)]),
          () => new ListBuilder<GFrequentRouteFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetAllRolesData_roles_data)]),
          () => new ListBuilder<GGetAllRolesData_roles_data>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetDestinationRidesData_rides)]),
          () => new ListBuilder<GGetDestinationRidesData_rides>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetDestinationRidesData_rides_users)]),
          () => new ListBuilder<GGetDestinationRidesData_rides_users>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetDriverTripsData_rides)]),
          () => new ListBuilder<GGetDriverTripsData_rides>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetLatestRidesData_latestRides)]),
          () => new ListBuilder<GGetLatestRidesData_latestRides>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetLatestRidesData_latestRides_users)]),
          () => new ListBuilder<GGetLatestRidesData_latestRides_users>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetOnGoingUserBookingsData_rides)]),
          () => new ListBuilder<GGetOnGoingUserBookingsData_rides>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GGetOnGoingUserBookingsData_rides_transactions)
          ]),
          () =>
              new ListBuilder<GGetOnGoingUserBookingsData_rides_transactions>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetOnGoingUserBookingsData_rides_users)]),
          () => new ListBuilder<GGetOnGoingUserBookingsData_rides_users>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetPaidTripsData_rides)]),
          () => new ListBuilder<GGetPaidTripsData_rides>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetPastUserBookingsData_rides)]),
          () => new ListBuilder<GGetPastUserBookingsData_rides>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GGetPastUserBookingsData_rides_transactions)
          ]),
          () => new ListBuilder<GGetPastUserBookingsData_rides_transactions>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetPastUserBookingsData_rides_users)]),
          () => new ListBuilder<GGetPastUserBookingsData_rides_users>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GGetRideData_rides)]),
          () => new ListBuilder<GGetRideData_rides>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetRideData_rides_users)]),
          () => new ListBuilder<GGetRideData_rides_users>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetRideInfoData_rides)]),
          () => new ListBuilder<GGetRideInfoData_rides>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetRideInfoData_rides_users)]),
          () => new ListBuilder<GGetRideInfoData_rides_users>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetRidesData_rides)]),
          () => new ListBuilder<GGetRidesData_rides>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetRidesData_rides_users)]),
          () => new ListBuilder<GGetRidesData_rides_users>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetRidesWithFilterData_rides)]),
          () => new ListBuilder<GGetRidesWithFilterData_rides>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetRidesWithFilterData_rides_users)]),
          () => new ListBuilder<GGetRidesWithFilterData_rides_users>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetUserByIdData_users)]),
          () => new ListBuilder<GGetUserByIdData_users>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetUserByIdData_users_userRatings)]),
          () => new ListBuilder<GGetUserByIdData_users_userRatings>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetUserByIdData_users_ownedCars)]),
          () => new ListBuilder<GGetUserByIdData_users_ownedCars>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetUserByUserNameData_users)]),
          () => new ListBuilder<GGetUserByUserNameData_users>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetUserByUserNameData_users_ownedCars)]),
          () => new ListBuilder<GGetUserByUserNameData_users_ownedCars>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetUserCarsData_users)]),
          () => new ListBuilder<GGetUserCarsData_users>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetUserCarsData_users_ownedCars)]),
          () => new ListBuilder<GGetUserCarsData_users_ownedCars>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GGetUserWithFilterData_users)]),
          () => new ListBuilder<GGetUserWithFilterData_users>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GGetUserWithFilterData_users_frequentRoutes)
          ]),
          () => new ListBuilder<GGetUserWithFilterData_users_frequentRoutes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GGetUserWithFilterData_users_ownedCars)]),
          () => new ListBuilder<GGetUserWithFilterData_users_ownedCars>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GIdentificationDocumentFilterInput)]),
          () => new ListBuilder<GIdentificationDocumentFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GIdentificationDocumentFilterInput)]),
          () => new ListBuilder<GIdentificationDocumentFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GLocationFilterInput)]),
          () => new ListBuilder<GLocationFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GLocationFilterInput)]),
          () => new ListBuilder<GLocationFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GPamrideMessageFilterInput)]),
          () => new ListBuilder<GPamrideMessageFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GPamrideMessageFilterInput)]),
          () => new ListBuilder<GPamrideMessageFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GRideFilterInput)]),
          () => new ListBuilder<GRideFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GRideFilterInput)]),
          () => new ListBuilder<GRideFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GRideInput)]),
          () => new ListBuilder<GRideInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GRideTransactionFilterInput)]),
          () => new ListBuilder<GRideTransactionFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GRideTransactionFilterInput)]),
          () => new ListBuilder<GRideTransactionFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GRideTransactionInput)]),
          () => new ListBuilder<GRideTransactionInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GRoleClaimRequestInput)]),
          () => new ListBuilder<GRoleClaimRequestInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GSafiriCarUserFilterInput)]),
          () => new ListBuilder<GSafiriCarUserFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GSafiriCarUserFilterInput)]),
          () => new ListBuilder<GSafiriCarUserFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GSeatFilterInput)]),
          () => new ListBuilder<GSeatFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GSeatFilterInput)]),
          () => new ListBuilder<GSeatFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GStringOperationFilterInput)]),
          () => new ListBuilder<GStringOperationFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GStringOperationFilterInput)]),
          () => new ListBuilder<GStringOperationFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GTimeSpan)]),
          () => new ListBuilder<GTimeSpan>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GTimeSpan)]),
          () => new ListBuilder<GTimeSpan>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GTimeSpan)]),
          () => new ListBuilder<GTimeSpan>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GTimeSpan)]),
          () => new ListBuilder<GTimeSpan>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserRatingFilterInput)]),
          () => new ListBuilder<GUserRatingFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserRatingFilterInput)]),
          () => new ListBuilder<GUserRatingFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserRidesFilterInput)]),
          () => new ListBuilder<GUserRidesFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserRidesFilterInput)]),
          () => new ListBuilder<GUserRidesFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GUserRidesInput)]),
          () => new ListBuilder<GUserRidesInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GRideTransactionInput)]),
          () => new ListBuilder<GRideTransactionInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserRoleModelInput)]),
          () => new ListBuilder<GUserRoleModelInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
