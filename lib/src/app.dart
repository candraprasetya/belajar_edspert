import 'package:belajar_edspert/src/blocs/blocs.dart';
import 'package:belajar_edspert/src/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}
