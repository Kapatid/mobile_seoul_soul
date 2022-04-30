import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_seoul_soul/flutter_flow/flutter_flow_theme.dart';
import 'package:mobile_seoul_soul/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Cart())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   '/details': (context) => DetailsPage(),
      // },
      title: 'Seoul Soul',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: FlutterFlowTheme.of(context).primaryColor,
                secondary: FlutterFlowTheme.of(context).secondaryColor,
              )),
      home: GestureDetector(
        // Unfocus when tapping outside certain Widgets
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const Scaffold(
          body: HomePageWidget(),
        ),
      ),
    );
  }
}
