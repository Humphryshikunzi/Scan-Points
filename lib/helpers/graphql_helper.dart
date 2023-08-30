import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pamride/controllers/account_controller.dart';
import 'package:pamride/widgets/user_utlities.dart';

Future<bool> updateUserProfileImage(String imagename) async {
  AccountController _accountController = Get.find();
  String username = _accountController.userName.value.toString();

  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: await getLinkAndToken(),
  );

  String query = '''
         mutation {
  updateProfilePicture(username: "$username", imagename: "$imagename") {
    succeeded
    messages
  }
}
  ''';

  final MutationOptions options = MutationOptions(
    document: gql(query),
  );

  final QueryResult result = await client.mutate(options);
  if (result.hasException) {
    return false;
  } else {
    return true;
  }
}
