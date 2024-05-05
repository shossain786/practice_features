import 'package:flutter/material.dart';
import 'package:practice_features/practice_widgets/provider_practice.dart';
import 'package:practice_features/provider/user_provider.dart';
import 'package:provider/provider.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: kColorScheme,
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              color: kColorScheme.onPrimaryContainer.withOpacity(0.8),
              foregroundColor: kColorScheme.onSecondary,
            )),
        home: MyProvider(),
      ),
    );
  }
}
