// lib/src/core/toast/toast_wrapper.dart
// ignore_for_file: deprecated_member_use

import 'package:gestao_velas/ds/components/alert/ds_alert_types.dart';
import 'package:gestao_velas/ds/components/alert/ds_alert.dart';
import 'package:flutter/material.dart';

class ToastWrapper extends StatelessWidget {
  final DsAlertStatus status;
  final String text;
  final String description;
  final GlobalKey<ScaffoldMessengerState> messengerKey;

  const ToastWrapper({
    super.key,
    required this.status,
    required this.text,
    required this.description,
    required this.messengerKey,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        messengerKey.currentState?.hideCurrentSnackBar();
        return route.didPop(result);
      },
      pages: [
        MaterialPage(
          child: DsAlert(
            status: status,
            style: DsAlertStyle.filled,
            size: DsAlertSize.large,
            text: text,
            description: description,
            dismissIcon: true,
          ),
        ),
      ],
    );
  }
}
