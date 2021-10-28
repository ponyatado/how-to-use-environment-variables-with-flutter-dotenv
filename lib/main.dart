import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
  static String get apiUrl => dotenv.env['API_URL'] ?? 'MY_FALLBACK';
}

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Environment Variables',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EnvironmentVariablePage());
  }
}

class EnvironmentVariablePage extends StatelessWidget {
  const EnvironmentVariablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment Variables'),
      ),
      body: Center(
        child: Text(Environment.apiUrl),
      ),
    );
  }
}
