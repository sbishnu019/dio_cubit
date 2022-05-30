import 'dart:async';

import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class DioConnectivityRequestRetry {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetry({
    required this.dio,
    required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    final responseCompleter = Completer<Response>();

    StreamSubscription streamSubscription = connectivity.onConnectivityChanged.listen(
          (connectivityResult) {
            print('network changed');
            print(connectivityResult);
          }
    );
    return responseCompleter.future;
  }
}