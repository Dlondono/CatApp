import 'package:cat_app/data/datasource/cat_datasource.dart';
import 'package:cat_app/presentation/blocs/cat_bloc.dart';
import 'package:cat_app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CatBloc>(
          create: (_) => CatBloc(catDatasource: CatDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Cat app',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.orange,
          ),
          primaryColor: Colors.orange,
          useMaterial3: false,
          textTheme: GoogleFonts.nunitoTextTheme(),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
