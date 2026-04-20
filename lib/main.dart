import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/core/provider/app_provider_observer.dart';
import 'package:gestao_velas/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();

  runApp(ProviderScope(observers: [AppProviderObserver()], child: const App()));
}
