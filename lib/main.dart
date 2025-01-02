import 'package:flutter/material.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beat My Squad',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFD700),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD700),
        ),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
    );
  }
}
