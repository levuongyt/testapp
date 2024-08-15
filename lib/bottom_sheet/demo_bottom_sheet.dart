import 'package:btvn_buoi11/bottom_sheet/widget/bai_tap.dart';
import 'package:flutter/material.dart';

class DeMoBottomSheet extends StatefulWidget {
  const DeMoBottomSheet({super.key});

  @override
  State<DeMoBottomSheet> createState() => _DeMoBottomSheetState();
}

class _DeMoBottomSheetState extends State<DeMoBottomSheet> {
  // bool isChecked = false;
  int quality = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: TextButton(
            onPressed: () {
              // buildShowModalBottomSheet(context);
              buildShowModalBottomSheet1(context);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: const Center(
                  child: Text(
                'Tính',
                style: TextStyle(color: Colors.white),
              )),
            )),
        body: SafeArea(
          child: Container(
            color: Colors.blueAccent[100],
            padding: const EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Có',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      InkWell(
                          onTap: () {
                            buildShowModalBottomSheet1(context);
                          },
                          child: Text('$quality')),
                      const Text('Sản phẩm')
                    ],
                  ),
                ),
                //     Checkbox(
                //       hoverColor: Colors.red,
                // checkColor: Colors.white,
                //   //fillColor: MaterialStateProperty.resolveWith(getColor),
                //   value: isChecked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       isChecked = value!;
                //     });
                //   },)
              ],
            ),
          ),
        ));
  }

  // Future<void> buildShowModalBottomSheet(BuildContext context) async {
  //   final result= await showModalBottomSheet<int>(
  //     clipBehavior: Clip.antiAliasWithSaveLayer,
  //     context: context,
  //     builder: (BuildContext contextBottomSheet) {
  //       return BottomSheetEX(
  //         quality: quality,
  //         callBack: (int) {
  //         },
  //       );
  //     },
  //   );
  //   if (result != null) {
  //     setState(() {
  //       quality=result;
  //     });
  //   }
  // }
  // }

  Future<void> buildShowModalBottomSheet1(BuildContext context) async{
    await showModalBottomSheet<int>(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext contextBottomSheet) {
        return BottomSheetEX(
          quality: quality,
          callBack: (int kq) {
            setState(() {
              quality = kq;
            });
          },
        );
      },
    );
  }
}
