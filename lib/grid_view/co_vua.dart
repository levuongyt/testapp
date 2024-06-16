import 'package:flutter/material.dart';

class BanCoVua extends StatefulWidget {
  const BanCoVua({super.key});

  @override
  State<BanCoVua> createState() => _BanCoVuaState();
}

class _BanCoVuaState extends State<BanCoVua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Chess',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 400,
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                    itemCount: 64,
                    itemBuilder: (BuildContext context, int index) {
                      Color mauo = Colors.black;
                      final int rowCV = (index ~/ 8);
                      final int columnCV = (index % 8);
                      (rowCV % 2 == 0 && columnCV % 2 == 0 ||
                              rowCV % 2 != 0 && columnCV % 2 != 0)
                          ? mauo
                          : mauo = Colors.white;

                      ///cách 2
                      // if ((index ~/ 8) % 2 == 0 && index % 2 == 0 ||
                      //     (index ~/ 8) % 2 != 0 && index % 2 != 0) {
                      //   mauo;
                      // } else {
                      //   mauo = Colors.white;
                      // }

                      return Container(
                        color: mauo,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
