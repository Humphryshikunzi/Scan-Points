/* // Android/Windows
import 'package:flutter_autoupdate/flutter_autoupdate.dart';

void updateManager() async {
  var updater = UpdateManager(versionUrl: 'versionUrl');

  var result = await updater.fetchUpdates();
  print(result?.latestVersion);
  print(result?.downloadUrl);
  print(result?.releaseNotes);
  print(result?.releaseDate);

  if (result?.latestVersion.toString() != '1.0.0') {
    var update = await result?.initializeUpdate();
    update?.stream.listen((event) async {
      print(event.receivedBytes);
      print(event.totalBytes);
      if (event.completed) {
        print('Download completed');
        await update.close();
        await result?.runUpdate(event.path, autoExit: true, exitDelay: 5000);
      }
    });
  }
}
 */
