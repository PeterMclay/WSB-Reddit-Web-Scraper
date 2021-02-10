import 'package:flutter/material.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
//import 'package:flutter_front_end/routing/route_names.dart';
//import 'package:flutter_front_end/routing/router.dart';
import 'package:flutter_front_end/widgets/layout_template/layout_template.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_front_end/services/database.dart';
import 'package:flutter_front_end/models/wsbdb.dart';
import 'package:flutter_front_end/widgets/layout_builder.dart';

void main() async {
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
        ChangeNotifierProvider<WSBDbProvider>(
            create: (context) => WSBDbProvider()),
        ChangeNotifierProvider<Day5Provider>(
            create: (context) => Day5Provider()),
        ChangeNotifierProvider<StocksDbProvider>(
            create: (context) => StocksDbProvider()),
        ChangeNotifierProvider<StocksDbTotalProvider>(
            create: (context) => StocksDbTotalProvider()),
        ChangeNotifierProvider<InvestingDbProvider>(
            create: (context) => InvestingDbProvider()),
        ChangeNotifierProvider<InvestingDbTotalProvider>(
            create: (context) => InvestingDbTotalProvider()),
        ChangeNotifierProvider<StockMarketDbProvider>(
            create: (context) => StockMarketDbProvider()),
        ChangeNotifierProvider<StockMarketDbTotalProvider>(
            create: (context) => StockMarketDbTotalProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //onGenerateRoute: generateRoute,
        //initialRoute: LayoutRoute,
        home: LayoutBuild(),
      ),
    );
  }
}
