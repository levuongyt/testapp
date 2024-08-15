import 'package:btvn_buoi11/getX/binding/my_binding.dart';
import 'package:btvn_buoi11/getX/binding/ui_getx_binding.dart';
import 'package:btvn_buoi11/provider/counter.dart';
import 'package:btvn_buoi11/provider/counter_page.dart';
import 'package:btvn_buoi11/riverpod/couter_page_riverpod.dart';
import 'package:btvn_buoi11/widget_common/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bai2/Screen_Bai2.dart';
import 'bai3/Screen_bai3.dart';
import 'bottom_sheet/demo_bottom_sheet.dart';
import 'btvn_timkiem/giao_dien.dart';
import 'dart_concurrency/btvn/btvn_stream/lab_1.dart';
import 'dart_concurrency/btvn/btvn_stream/lab_2.dart';
import 'dart_concurrency/btvn/btvn_stream/lab_3.dart';
import 'dart_concurrency/btvn/btvn_stream/lab_4.dart';
import 'dart_concurrency/btvn/btvn_stream/lab_5.dart';
import 'dart_concurrency/btvn/btvn_stream/views/lab1_view.dart';
import 'dart_concurrency/btvn/btvn_stream/views/lab2_view.dart';
import 'dart_concurrency/btvn/btvn_stream/views/lab3_view.dart';
import 'dart_concurrency/btvn/btvn_stream/views/lab4_view.dart';
import 'dart_concurrency/btvn/show_image.dart';
import 'dart_concurrency/stream_buider.dart';
import 'getX/counter_page.dart';
import 'getX/presentations/btvn/ui_dangnhap.dart';
import 'getX/presentations/ui_screen.dart';
import 'grid_view/co_vua.dart';
import 'grid_view/demo_grid_view.dart';
import 'list_view/list_view_demo_screen.dart';
import 'mvvm_mini_demo/view/mvvm_demo_view.dart';

void main() {
  //runApp(const MyApp());
  runApp(const GetMyApp());

  ///Provider
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => Counter(),
  //     child: MyApp(),
  //   ),
  // );

  ///Riverpod
  // runApp(
  //   ProviderScope(
  //     child: MyApp(),
  //   ),
  // );
}

class GetMyApp extends StatelessWidget {
  const GetMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: MyBinding(),
      // getPages: [
      //   GetPage(
      //       name: '/home', page: () => GetUIBinding(), binding: MyBinding()),
      //   GetPage(
      //     name: '/state',
      //     page: () => const GetUIBinding(),
      //   )
      // ],
      // home: const GetUIBinding(),
      home: DangNhap(),
    );
  }
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
          // bodyMedium: GoogleFonts.merriweather(),
          bodyMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      //home: BanCoVua(),
      home: GetXUI(),
    );
  }
}
