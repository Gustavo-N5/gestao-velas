import 'package:gestao_velas/ds/components/alert/ds_alert_types.dart';
import 'package:gestao_velas/ds/components/alert/ds_alert.dart';
import 'package:flutter/material.dart';

class ToastService {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showError(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: DsAlert(
          status: DsAlertStatus.error,
          style: DsAlertStyle.filled,
          size: DsAlertSize.large,
          text: "Ocorreu um erro!",
          description: message,
          dismissIcon: true,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showSuccess(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: DsAlert(
          status: DsAlertStatus.success,
          style: DsAlertStyle.filled,
          size: DsAlertSize.large,
          text: "Sucesso!",
          description: message,
          dismissIcon: true,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showInfo(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: DsAlert(
          status: DsAlertStatus.information,
          style: DsAlertStyle.filled,
          size: DsAlertSize.large,
          text: "Informação",
          description: message,
          dismissIcon: true,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showWarning(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: DsAlert(
          status: DsAlertStatus.warning,
          style: DsAlertStyle.filled,
          size: DsAlertSize.large,
          text: "Atenção!",
          description: message,
          dismissIcon: true,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
