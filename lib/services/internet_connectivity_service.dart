import 'dart:async';

import 'package:chat_ui/components/custom_snack_bar.dart';
import 'package:chat_ui/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

class InternetConnectivityService {
  StreamSubscription<ConnectivityResult> _subscription;

  /*
    * This function check if the device has internet connectivity.
    * With the help of DataConnectionChecker it checks for actual internet connectivity. 
  */
  Future<bool> _checkConnectivity() async {
    if (await DataConnectionChecker().hasConnection) {
      return true;
    } else {
      return false;
    }
  }

  /*
    * This function is invoked to on each connection change request.
    * Using Connectivity package it will check for connectivity and connection type.
    * This function has return type of Future<bool> which perform async request to check connectivity.
    * After checking connection type it check for divice has internet accesssible or not.
  */
  Future<bool> _hasInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return _checkConnectivity();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return _checkConnectivity();
    } else {
      return false;
    }
  }

  StreamSubscription<ConnectivityResult> initInterNetConnectivitySubscription(
      BuildContext context) {
    // * Subscribe to connectivity changes
    _subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        _hasInternet().then(
          (result) {
            // * When internet is disconnected
            Size size = MediaQuery.of(context).size;
            if (!result) {
              Scaffold.of(context).showSnackBar(
                snackBarBuilder(
                    color: kErrorColor,
                    text: 'Connection Lost',
                    context: context),
              );
            } else {
              Scaffold.of(context).showSnackBar(
                snackBarBuilder(
                    color: kSuccessColor, text: 'Connected', context: context),
              );
            }
          },
        );
      },
    );
    return _subscription;
  }

  disposeSubscription() {
    _subscription.cancel();
  }
}
