import 'package:graphql_flutter/graphql_flutter.dart';

String getUserBookings = '''
  query GetUserBookings(\$userId: String!){
    rideBookings(where: {passengerUserId: {eq: \$userId}},){
        amount
        bookingId
        destination
        from
        id
        mpesaReceiptNumber
        passengerUserId
        passengerPhoneNumber
        rideId
        transactionDate
    }
}
  ''';
final getRidesToFroQuery = gql('''
query getRidesToFro (\$placeOfStartFilter:String, \$destinationFilter: String) {
	rides(
		where: {
			id: { gte: 0, lt: 1000 }
			or: [
				{ placeofStart: { contains:\$placeOfStartFilter } }
				{ destination: { contains:  \$destinationFilter } }
			]
			status: { eq: "Active" }
		}
		order: { id: DESC }
	) {
		allowedBehDesc
		id
		name
		departureDate
		departureTime
		destination
		estimatedDistance
		duration
		numberOfPeople
		maximumCarryWeight
		placeofStart 
    status
		exactPickupLocation
		routeIndex
		seat {
			id
			backLeft
			frontLeft
			backCentre
			backRight
			middleLeft
			middleRight
			middleCentre
		}
		totalPay
		maxTotalPay
		seatCount
		seatCapacity
		estimatePrice
		car {
			licensePlate
			imageUrl
			color
			model
			ownerId
			id
			owner {
				id
				firstName
			}
		}
		users {
			user {
				id
				userName
				profilePictureDataUrl
			}
		}
	}
}
''');
final getRidesQuery = gql('''
  query GetPaidTrips(\$status: Boolean, \$placeOfStartFilter:String, \$destinationFilter: String){
    rides(
    where: {
			status: { eq: \$status }
			placeofStart: { contains: \$placeOfStartFilter }
			destination: { contains: \$destinationFilter }
		}
    order:{estimatePrice:ASC}) {
      allowedBehDesc
        id
        name
        departureDate
        departureTime
        destination
        estimatedDistance
        numberOfPeople
        maximumCarryWeight
        placeofStart 
        status
        duration
        routeIndex
        seat {
            id
            backLeft
            frontLeft
            backCentre
            backRight
            middleLeft
            middleRight
            middleCentre
        }
        totalPay
        maxTotalPay
        seatCount
        seatCapacity
        estimatePrice
        car {
            licensePlate
            imageUrl
            color
            model
            ownerId
            id
            owner{
                firstName
            }
        }
        users {
            user {
                id
                userName
                profilePictureDataUrl
            }
        }
    }
  }
  ''');

String createARideMutation = """mutation CreateRide(
      \$allowedBehDesc: String
      \$placeOfStart: String!
      \$estimatePrice: Float!
      \$name: String!
      \$destination: String!
      \$departureDate: String!
      \$estimateTime: String!
      \$estimateDistance: String!
      \$numberOfPeople: Int!
      \$maxCarry: Int!
      \$carId: String!
      \$backCentre: String
      \$backRight: String
      \$backLeft: String
      \$frontLeft: String
      \$middleCentre: String
      \$middleLeft: String
      \$middleRight: String
      \$departureTime: String!
      \$exactPickupLocation: String
      \$exactDropOffLocation: String
      \$rideIndex:Int!
      \$isRecurring: Boolean
) {
    createARide(
        rideInput: {
            allowedBehDesc: \$allowedBehDesc
            departureDate: \$departureDate
            duration: \$estimateTime
            destination: \$destination
            placeofStart: \$placeOfStart
            estimatePrice: \$estimatePrice
            estimateDistance: \$estimateDistance
            name: \$name
            maximumCarryWeight: \$maxCarry
            exactPickupLocation: \$exactPickupLocation
            exactDropOffLocation: \$exactDropOffLocation
            numberOfPeople: \$numberOfPeople
            carId: \$carId
            departureTime:\$departureTime
            rideIndex:\$rideIndex
            isRecurring: \$isRecurring
            seat: {
                frontLeft: \$frontLeft
                backLeft: \$backLeft
                backCentre: \$backCentre
                backRight: \$backRight
                middleLeft:\$middleLeft
                middleCentre:\$middleCentre
                middleRight: \$middleRight
            }
        }
    ) {
        id
        placeofStart
        destination
        exactPickupLocation
    }
}""";

final filterToAndFromRidesQuery = gql("""
query Rides(\$searchText: Boolean) {
	rides(
		where: {
			status: { eq:  "Active" }
			or: [
        { placeofStart: { contains: \$searchText } }
        { destination: { contains: \$searchText } }
      ]
		}
		order: { id: DESC }
	) {
		id
		name
		departureDate
		destination
		estimatedDistance
		numberOfPeople
		maximumCarryWeight 
    status
		placeofStart
		duration
		departureTime
		exactPickupLocation
		seat {
			id
			backLeft
			frontLeft
			backCentre
			backRight
			middleLeft
			middleRight
			middleCentre
		}
		totalPay
		maxTotalPay
		seatCount
		seatCapacity
		estimatePrice
		car {
			imageUrl
		}
		users {
			user {
				id
				userName
				profilePictureDataUrl
			}
		}
	}
}
""");
