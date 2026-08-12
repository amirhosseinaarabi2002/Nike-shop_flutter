import 'package:flutter/material.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
      fontFamily: 'IranYekan',
      color: LightThemeColors.primaryTextColor,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineSmall: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
          bodySmall: defaultTextStyle.copyWith(
            color: LightThemeColors.secondryTextColor,
          ),
          bodyMedium: defaultTextStyle,
        ),
        colorScheme: ColorScheme.light(
          primary: LightThemeColors.primaryColor,
          secondary: LightThemeColors.secondryColor,
          onSecondary: Colors.white,
        ),
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: const HomeScreen(),
      ),
    );
  }
}

