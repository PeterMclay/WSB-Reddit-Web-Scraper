import 'package:flutter/material.dart';
import 'package:flutter_front_end/locator.dart';
import 'package:flutter_front_end/providers/app_provider.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
import 'package:flutter_front_end/routing/route_names.dart';
import 'package:flutter_front_end/routing/router.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_front_end/services/database.dart';
import 'package:flutter_front_end/models/wsbdb.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider.init()),
        ChangeNotifierProvider<WSBDbProvider>(
            create: (context) => WSBDbProvider()),
        ChangeNotifierProvider<Day5Provider>(
            create: (context) => Day5Provider()),
      ],
      child: MaterialApp(
        onGenerateRoute: generateRoute,
        initialRoute: LayoutRoute,
        //home: HomeView(),
      ),
    );
  }
}
