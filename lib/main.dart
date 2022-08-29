import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/view/main_screen.dart';
import 'package:tec/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Solidcolors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Solidcolors.systemNAvigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', ''), // farsi
        ],
        theme: ThemeData(
            //for textfield
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2)),
              filled: true,
              fillColor: Colors.white,
            ),
            //for bottomNAv
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const TextStyle(fontSize: 25);
                  }
                  return const TextStyle(fontSize: 20);
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Solidcolors.seeMore;
                  }
                  return Solidcolors.primaryColor;
                }),
              ),
            ),
            fontFamily: 'dana',
            textTheme: const TextTheme(
                headline1: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 16,
                    color: Solidcolors.posterTitle,
                    fontWeight: FontWeight.w700),
                subtitle1: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Solidcolors.posterSubTitle,
                    fontWeight: FontWeight.w300),
                bodyText1: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                headline2: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
                headline3: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Solidcolors.seeMore,
                    fontWeight: FontWeight.w700),
                headline4: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                headline5: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 15,
                    color: Solidcolors.userProfileName,
                    fontWeight: FontWeight.w700),
                headline6: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 15,
                    color: Solidcolors.hintTextColor,
                    fontWeight: FontWeight.w700),
                headlineLarge: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 12,
                    color: Solidcolors.hintTextColor,
                    fontWeight: FontWeight.w700))),
        debugShowCheckedModeBanner: false,
        home: const MainScreen());
  }
}
