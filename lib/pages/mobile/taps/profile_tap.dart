import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pamride/widgets/images.dart';
import 'package:pamride/widgets/user_utlities.dart';
import '../../../components/constant.dart';
import '../../../controllers/client_controller.dart';
import '../../../graphql/__generated__/operations.data.gql.dart';
import '../../../graphql/__generated__/operations.req.gql.dart';
import '../../../graphql/__generated__/operations.var.gql.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class ProfileTap extends StatelessWidget {
  final String userId;
  final bool isDriver;
  ProfileTap(
      {Key? key,
      this.showFollowBottomInProfile = false,
      required this.userId,
      required this.isDriver})
      : super(key: key);

  bool showFollowBottomInProfile;
  String tripsCreated = "";
  String tripsCompleted = "";
  String tripsCancelled = "";
  String? userName;
  String? aboutMe;
  String? userRateValue;
  String? profileImageUrl;

  ClientController _clientController = Get.find<ClientController>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Widget build(BuildContext context) {
    analytics.setCurrentScreen(screenName: 'ProfileTap');
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: mainText,
                )),
          ),
        ),
        body: Operation(
            client: _clientController.client,
            operationRequest: GGetUserByIdReq((b) => b..vars.id = userId),
            builder: (BuildContext context,
                OperationResponse<GGetUserByIdData, GGetUserByIdVars>? response,
                Object? error) {
              if (response!.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                profileImageUrl =
                    response.data!.users.first.profilePictureDataUrl.toString();
                userName = response.data!.users.first.userName.toString();
                double currentUserRating =
                    response.data!.users.first.averageRating;
                aboutMe = response.data!.users.first.aboutMe ?? "";
                String currentUserRatingStr =
                    currentUserRating.toStringAsFixed(1);
                userRateValue = currentUserRating > 0.0
                    ? "$currentUserRatingStr/5.0"
                    : "5.0/5.0";
                tripsCreated =
                    response.data!.users.first.tripsCreated.toString();
                tripsCompleted =
                    response.data!.users.first.tripsCompleted.toString();
                tripsCancelled =
                    response.data!.users.first.tripsCancelled.toString();
              }

              var reviews = [];
              var ratings = response.data!.users.first.userRatings;
              for (var rating in ratings) {
                reviews.add(ReviewItem(
                    reviewerName: rating.reviewer.firstName! +
                        " " +
                        rating.reviewer.lastName,
                    reviewContent: rating.comment!,
                    starRating: rating.ratingValue,
                    date: DateFormat.yMMMd()
                        .add_jm()
                        .format(DateTime.parse(rating.dateOfRating.value))));
              }
              ;

              reviews = reviews.reversed.toList();

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                profilePhoto(context),
                                showFollowBottomInProfile == false
                                    ? InkWell(
                                        child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.blue,
                                          child: Icon(
                                            Icons.verified,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 10, left: 20, right: 20),
                              child: Text(
                                userName!,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, left: 20, right: 20),
                              child: Text(
                                aboutMe!,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Visibility(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        tripsCreated,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Trips\ Created",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: SecondaryText),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        tripsCompleted,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Trips\n Completed",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: SecondaryText),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        tripsCancelled,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Trips\n  Cancelled",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: SecondaryText),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              visible: isDriver,
                            ),
                            Visibility(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(""),
                              ),
                              visible: isDriver,
                            ),
                            Visibility(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        userRateValue!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Overall Rating",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: SecondaryText),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              visible: isDriver,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Visibility(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Recent Reviews",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(height: 5),
                                  ListView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      for (var review in reviews)
                                        ReviewContainer(
                                          review: review.reviewContent,
                                          reviewer: review.reviewerName,
                                          ratingValue: review.starRating,
                                          date: review.date,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              visible: isDriver,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              );
            }));
  }

  profilePhoto(BuildContext context) {
    return CircleAvatar(
        radius: 91,
        backgroundColor: Color(0xFFFFCD00),
        child: Container(
          height: 180,
          width: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Stack(
              children: [
                Positioned.fill(
                    child: CachedNetworkImage(
                  imageUrl: getProfileImageUrl(profileImageUrl!),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fill,
                )),
              ],
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ));
  }
}
