import 'package:btvn_buoi11/resources/image_app.dart';
import 'package:flutter/material.dart';

class BottomSheetEX extends StatefulWidget {
  const BottomSheetEX(
      {super.key, required this.quality, required this.callBack});
  final int quality;
  final void Function(int kq) callBack;
  @override
  State<BottomSheetEX> createState() => _BottomSheetEXState();
}

class _BottomSheetEXState extends State<BottomSheetEX> {
  late int quality;
  @override
  void initState() {
    super.initState();
    quality = widget.quality;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 40),
                    height: 50,
                    child: Image.asset(ImageApp.imageIphone15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Chọn số lượng'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                       quality++;
                      //  widget.callBack(quality);
                      });
                    },
                    child: Text(
                      '+',
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
                Text('$quality'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (quality > 0) {
                          quality--;
                       //   widget.callBack(quality);
                        }
                      });
                    },
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Xác Nhận'),
              //onPressed: () => Navigator.pop(context),

              //onPressed: () => Navigator.pop(context,quality),
              onPressed: (){
               // print('when back $quality');
                Navigator.pop(context);
                widget.callBack(quality);
              },
            ),
          ],
        ),
      ),
    );
  }
}
