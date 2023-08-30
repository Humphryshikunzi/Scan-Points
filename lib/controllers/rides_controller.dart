import 'package:get/get.dart';

class RidesController extends GetxController {
  RxString searchFrom = 'Nairobi'.obs;
  RxString searchTo = 'Nyeri'.obs;
  RxString searchDate = ''.obs;
  RxList searchFilter = RxList([]);
  RxString searchName = RxString("");
  late var box;
  late var store;
  late var cache;
  filterResult() async {
    // var result=GraphQLResponse()
//     var box = await Hive.openBox("graphql");
//    var store = HiveStore(box);
//     HttpLink link = HttpLink("");
//     GraphQLClient response = GraphQLClient(
//       link: link,
//       cache: GraphQLCache(store: store),
//     );

//     QueryResult result = await response.query(QueryOptions(document: gql("""
// query {
// 	rides(
// 		where: {
//			or: [
//				{ placeofStart: { contains: ${searchName} } }
//				{ destination: { contains: ${searchName} } }
//			]
//			isActive: { eq: true }
//		}
//	)
// {
// 		id
// 		name
// 		departureDate
// 		destination
// 		placeofStart
// 		estimatedDistance
// 		numberOfPeople
// 		maximumCarryWeight
// 		isActive
// 		estimatedHour
// 		departureTime
// 		seat {
// 			id
// 			backLeft
// 			frontLeft
// 			backCentre
// 			backRight
// 			middleLeft
// 			middleRight
// 			middleCentre
// 		}
// 		totalPay
// 		maxTotalPay
// 		seatCount
// 		seatCapacity
// 		estimatePrice
// 	}
// }
//  """)));
  }
}
