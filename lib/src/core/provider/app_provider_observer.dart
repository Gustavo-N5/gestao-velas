import 'package:gestao_velas/src/core/toast/toast_service.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AppProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (newValue is AsyncError) {
      final error = newValue.error;
      if (error is Failure) {
        ToastService.showError(error.message);
      }
    }
  }
}
