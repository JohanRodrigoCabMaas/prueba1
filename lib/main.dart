import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Obtener variables de entorno desde dart-define
  String get appName => const String.fromEnvironment('APP_NAME', defaultValue: 'Mi App');
  String get apiUrl => const String.fromEnvironment('API_URL', defaultValue: 'https://api.ejemplo.com');
  bool get debugMode => const String.fromEnvironment('DEBUG', defaultValue: 'false') == 'true';

  @override
  Widget build(BuildContext context) {
    // Debug en consola del navegador
    print('🎯 Environment Variables from dart-define:');
    print('APP_NAME: $appName');
    print('API_URL: $apiUrl');
    print('DEBUG: $debugMode');

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: debugMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: appName,
        apiUrl: apiUrl,
        debugMode: debugMode,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.apiUrl,
    required this.debugMode,
  });
  
  final String title;
  final String apiUrl;
  final bool debugMode;

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Mostrar variables de entorno
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueGrey[300]!),
              ),
              child: Column(
                children: [
                  Text(
                    '🛠️ Configuración del Environment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'App Name:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(color: Colors.green[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'API URL:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.apiUrl,
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Debug Mode:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.debugMode ? '✅ ACTIVADO' : '❌ DESACTIVADO',
                        style: TextStyle(
                          color: widget.debugMode ? Colors.green[700] : Colors.red[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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