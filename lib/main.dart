import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_salo/pages/WrapperPage.dart';

import 'misc/services/Provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Settings(),
        ),
      ],
      child: MaterialApp(
        title: 'BitCubeEVAL Platform',
        debugShowCheckedModeBanner: false,
        home: WrapperPage(),
      ),
    );
  }
}

// Classes moved to external file.
