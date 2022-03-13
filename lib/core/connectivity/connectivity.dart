import 'package:connectivity/connectivity.dart';

Future<void> checkConnectivity(
    {required Function error, required Function connect}) async {
  Connectivity().onConnectivityChanged.listen(
    (ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        error;
      } else {
        connect;
      }
    },
  );
}
