// lib/src/core/toast/toast_service.dart
import 'package:gestao_velas/ds/components/alert/ds_alert_types.dart';
import 'package:gestao_velas/src/core/toast/toast_wrapper.dart';
import 'package:flutter/material.dart';

class ToastService {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void _show({
    required DsAlertStatus status,
    required String text,
    required String description,
    Duration duration = const Duration(seconds: 3),
  }) {
    messengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: ToastWrapper(
            status: status,
            text: text,
            description: description,
            messengerKey: messengerKey,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          duration: duration,
          margin: const EdgeInsets.all(16),
        ),
      );
  }

  static void showError(String message) => _show(
    status: DsAlertStatus.error,
    text: 'Ocorreu um erro!',
    description: message,
  );

  static void showSuccess(String message) => _show(
    status: DsAlertStatus.success,
    text: 'Sucesso!',
    description: message,
  );

  static void showWarning(String message) => _show(
    status: DsAlertStatus.warning,
    text: 'Atenção!',
    description: message,
  );

  static void showInfo(String message) => _show(
    status: DsAlertStatus.information,
    text: 'Informação',
    description: message,
  );
}
