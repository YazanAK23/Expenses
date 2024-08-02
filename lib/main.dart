import 'package:expenses/Widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const MyApp()));
}

// Define your color schema or remove if not used
var myColorSchema =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 59, 96, 179));
// Example of a color schema
var myDarkColorSchema = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 59, 96, 179)); // Example of a color schema

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
          colorScheme: myColorSchema,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: myColorSchema.onPrimaryContainer,
            foregroundColor: myColorSchema.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
            color: myColorSchema.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: myColorSchema.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myColorSchema.onSecondaryContainer,
                fontSize: 14,
              ))),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: myDarkColorSchema,
          bottomSheetTheme: BottomSheetThemeData().copyWith(
            backgroundColor: myDarkColorSchema.onPrimaryContainer,
            modalBackgroundColor: myDarkColorSchema.primaryContainer,
          ),
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: myDarkColorSchema.onPrimaryContainer,
            foregroundColor: myDarkColorSchema.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
            color: myDarkColorSchema.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: myDarkColorSchema.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myDarkColorSchema.onSecondaryContainer,
                fontSize: 14,
              ))),
      home: const Expenses(),
    );
  }
}
