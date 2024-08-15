import 'package:btvn_buoi11/resources/image_app.dart';
import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Show Image',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.blueAccent,
                child: FutureBuilder<String>(
                    future: delayed(3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Icon(
                          Icons.question_mark,
                          color: Colors.white,
                        );
                      } else {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return Image.asset(
                            snapshot.data.toString(),
                            fit: BoxFit.fill,
                          );
                        } else {
                          return const Text('khong co data');
                        }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> delayed(int second) async {
    await Future.delayed(Duration(seconds: second));
    // return ImageApp.imageDog;
    return '';
  }
}
void main() {
  Stream stream = Stream.value("value");
  stream.listen((event) {
    print("onEvent -> $event");
  });
}
