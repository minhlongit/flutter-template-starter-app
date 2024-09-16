import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/starter_app.dart';
import 'package:starter_app/services/locale_service_provider.dart';
import 'package:starter_app/services/loading_service_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleServiceProvider()),
        ChangeNotifierProvider(create: (context) => LoadingServiceProvider()),
      ],
      child: const StarterApp(),
    ),
  );
}
