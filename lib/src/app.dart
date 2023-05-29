import 'package:belajar_edspert/src/utilities/utilities.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
