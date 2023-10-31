import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wrk/presentation/providers/global_provider.dart';

void main() {
  runApp(const WrkApp());
}

class WrkApp extends StatelessWidget {
  const WrkApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalProvider>(
      create: (context) => GlobalProvider(
        context: context,
      ),
      builder: (context, child) => Consumer<GlobalProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Wrk by Dwi Kurnianto',
            routes: provider.routeUtil.routes,
            initialRoute: provider.routeUtil.initialRoute,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
