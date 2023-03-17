import 'package:coreapp1/providers/facilities/facilities_bloc.dart';
import 'package:coreapp1/providers/login/login_bloc.dart';
import 'package:coreapp1/ui/login/login_screen.dart';
import 'package:coreapp1/utils/constants/string_constants.dart';
import 'package:coreapp1/utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  var app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginBloc()),
      ChangeNotifierProvider(create: (_) => FacilitesBloc()),
    ],
    child: const MyApp(),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: StringConstants.appTitle,
        theme: appTheme(context),
        home: LoginScreen());
  }
}
