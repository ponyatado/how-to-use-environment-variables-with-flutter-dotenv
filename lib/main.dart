import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;

import 'package:flutter_dotenv/flutter_dotenv.dart';

@JS()
external dynamic get window;

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
  
  static String _getEnvValue(String key, String fallback) {
    if (kIsWeb) {
      try {
        final env = js_util.getProperty(window, 'env');
        if (env != null) {
          final value = js_util.getProperty(env, key);
          if (value != null && value.toString().isNotEmpty) {
            return value.toString();
          }
        }
      } catch (e) {
        // If there's any error accessing the JS properties, return the fallback
      }
    }
    return fallback;
  }

  static String get apiUrl => _getEnvValue('API_URL', 'MY_FALLBACK');
  static String get var01 => _getEnvValue('VAR_01', 'VAR_01_FALLBACK');
  static String get var02 => _getEnvValue('VAR_02', 'VAR_02_FALLBACK');
  static String get var03 => _getEnvValue('VAR_03', 'VAR_03_FALLBACK');
  static String get var04 => _getEnvValue('VAR_04', 'VAR_04_FALLBACK');
  static String get var05 => _getEnvValue('VAR_05', 'VAR_05_FALLBACK');
  static String get var06 => _getEnvValue('VAR_06', 'VAR_06_FALLBACK');
  static String get varPruebaLarga01 => _getEnvValue('VAR_PRUEBA_LARGA_01', 'VAR_PRUEBA_LARGA_01_FALLBACK');
  static String get varPruebaLarga02 => _getEnvValue('VAR_PRUEBA_LARGA_02', 'VAR_PRUEBA_LARGA_02_FALLBACK');
  static String get varPruebaLarga03 => _getEnvValue('VAR_PRUEBA_LARGA_03', 'VAR_PRUEBA_LARGA_03_FALLBACK');
  static String get varPruebaLarga04 => _getEnvValue('VAR_PRUEBA_LARGA_04', 'VAR_PRUEBA_LARGA_04_FALLBACK');
  static String get varPruebaLarga05 => _getEnvValue('VAR_PRUEBA_LARGA_05', 'VAR_PRUEBA_LARGA_05_FALLBACK');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('API URL: ${Environment.apiUrl}'),
            const SizedBox(height: 20),
            Text('VAR 01: ${Environment.var01}'),
            const SizedBox(height: 20),
            Text('VAR 02: ${Environment.var02}'),
            const SizedBox(height: 20),
            Text('VAR 03: ${Environment.var03}'),
            const SizedBox(height: 20),
            Text('VAR 04: ${Environment.var04}'),
            const SizedBox(height: 20),
            Text('VAR 05: ${Environment.var05}'),
            const SizedBox(height: 20),
            Text('VAR 06: ${Environment.var06}'),
            const SizedBox(height: 20),
            Text('PRUEBA LARGA 01: ${Environment.varPruebaLarga01}'),
            const SizedBox(height: 20),
            Text('PRUEBA LARGA 02: ${Environment.varPruebaLarga02}'),
            const SizedBox(height: 20),
            Text('PRUEBA LARGA 03: ${Environment.varPruebaLarga03}'),
            const SizedBox(height: 20),
            Text('PRUEBA LARGA 04: ${Environment.varPruebaLarga04}'),
            const SizedBox(height: 20),
            Text('PRUEBA LARGA 05: ${Environment.varPruebaLarga05}'),
          ],
        ),
      ),
    );
  }
}
