import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }

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
        child: Text(
          dotenv.get('API_URL', fallback: 'API_URL not found'),
        ),
      ),
    );
  }
}
