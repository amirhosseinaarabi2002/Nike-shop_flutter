import 'package:flutter/material.dart';
import 'package:nike/theme.dart';

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
        child: const MyHomePage(title: 'فروشگاه نایک'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,

        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'هر کلیک یک جایزه برای توست!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'هر کلیک یک جایزه برای توست!',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text('$_counter', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
