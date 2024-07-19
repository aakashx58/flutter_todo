import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';

Future<bool> isNetworkAvailable() async {
  FlutterNetworkConnectivity flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp:
        true, // optional, false if you cont want continous lookup
    lookUpDuration: const Duration(
        seconds: 5), // optional, to override default lookup duration
    // lookUpUrl: 'example.com', // optional, to override default lookup url
  );

  bool isNetworkConnectedOnCall =
      await flutterNetworkConnectivity.isInternetConnectionAvailable();

  return isNetworkConnectedOnCall;
}
