import 'package:github/server.dart';

import '../common/config.dart';
import 'base.dart';

Future<bool> login(String username, String password) async {
  defaultClient = createGitHubClient(auth: Authentication.basic(username, password));
  try {
    currentUser = await defaultClient.users.getCurrentUser();
  } catch (e) {
    print(e);
    return false;
  }
  return true;
}
