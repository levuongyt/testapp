import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bai2/Screen_Bai2.dart';
import 'bai3/Screen_bai3.dart';
import 'grid_view/co_vua.dart';
import 'grid_view/demo_grid_view.dart';
import 'list_view/list_view_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // ···
          brightness: Brightness.light,
        ),

        textTheme: TextTheme(
          displayLarge: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
          ),
          // ···
         // titleLarge: GoogleFonts.oswald(
          //  fontSize: 30,
         //   fontStyle: FontStyle.italic,
         // ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: BanCoVua(),
     //home: DemoGridView(),
    );
  }
}