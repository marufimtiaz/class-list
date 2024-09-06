import 'package:classes/pages/classes_page.dart';
import 'package:classes/pages/login_page.dart';
import 'package:classes/pages/selector_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SelectorPage(),
        '/login': (context) => const LoginPage(),
        '/classes': (context) => const ClassesList(),
      },
    );
  }
}
