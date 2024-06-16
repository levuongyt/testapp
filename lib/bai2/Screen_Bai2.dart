import 'package:btvn_buoi11/bai2/Keno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final List<Keno> statistic = [
    Keno('Chẵn', 5),
    Keno('Lẻ', 2),
    Keno('Hòa CL', 3)
  ];
  //final statistic = [Keno('Chẵn', 5), Keno('Lẻ', 2), Keno('Hòa CL', 8)];
  double widthKeno = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var keno in statistic)
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: Text(keno.text)),
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Container(
                              color: Colors.red,
                              width: widthKeno * keno.count,
                              height: 10,
                            ),
                            const Spacer(),
                            Text('${keno.count.toString()} Lần'),
                          ],
                        ),
                      ),
                     ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
