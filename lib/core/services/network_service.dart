import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum ConnectionStatus { connected, disconnected }

enum ConnectionType { wifi, mobile, ethernet, disconnected, unknown }

class NetworkService {
  final Connectivity _connectivity = Connectivity();
  final InternetConnectionChecker _connectionChecker =
      InternetConnectionChecker.createInstance();

  Future<ConnectionType> getConnectionType() async {
    try {
      final results = await _connectivity.checkConnectivity();

      if (results.isEmpty || results.contains(ConnectivityResult.none)) {
        return ConnectionType.disconnected;
      }

      final hasInternet = await _connectionChecker.hasConnection;
      if (!hasInternet) return ConnectionType.disconnected;

      if (results.contains(ConnectivityResult.wifi)) {
        return ConnectionType.wifi;
      } else if (results.contains(ConnectivityResult.mobile)) {
        return ConnectionType.mobile;
      } else if (results.contains(ConnectivityResult.ethernet)) {
        return ConnectionType.ethernet;
      } else {
        return ConnectionType.unknown;
      }
    } catch (e) {
      log('NetworkService error: $e');
      return ConnectionType.unknown;
    }
  }

  Stream<ConnectionType> get onConnectionChange async* {
    await for (final results in _connectivity.onConnectivityChanged) {
      final hasInternet = await _connectionChecker.hasConnection;
      if (results.contains(ConnectivityResult.none) || !hasInternet) {
        yield ConnectionType.disconnected;
      } else if (results.contains(ConnectivityResult.wifi)) {
        yield ConnectionType.wifi;
      } else if (results.contains(ConnectivityResult.mobile)) {
        yield ConnectionType.mobile;
      } else if (results.contains(ConnectivityResult.ethernet)) {
        yield ConnectionType.ethernet;
      } else {
        yield ConnectionType.unknown;
      }
    }
  }
}
