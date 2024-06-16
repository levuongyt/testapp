import 'package:btvn_buoi11/resources/image_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listView extends StatefulWidget {
  const listView({super.key});
  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  final List<tinMessengerModel> tinmessmodel = [
    tinMessengerModel(ImageApp.imageTinMess, 'Bích'),
    tinMessengerModel(ImageApp.imageChatMess, 'Vương'),
    tinMessengerModel(ImageApp.imageTin, 'Thúy'),
    tinMessengerModel(ImageApp.imageTinMess, 'Quỳnh'),
    tinMessengerModel(ImageApp.imageTinMess, 'Hoài'),
    tinMessengerModel(ImageApp.imageTinMess, 'Hường'),
    tinMessengerModel(ImageApp.imageTinMess, 'Mai'),
    tinMessengerModel(ImageApp.imageTinMess, 'Hồng'),
  ];
  void deleteTinMessenger() {
    if (tinmessmodel.isNotEmpty) {
      setState(() {
        tinmessmodel.removeLast();
      });
      print("ending ${tinmessmodel.length}");

    } else {
      print("ending 1 ${tinmessmodel.length}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Messenger',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: TextButton(
          onPressed: deleteTinMessenger,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            )),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                cursorColor: Colors.purpleAccent,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.purpleAccent,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.purple,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.purple,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.purple))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      tinmessmodel.map((model) => tinMessenger(model)).toList(),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    chatMessenger(),
                    chatMessenger(),
                    chatMessenger(),
                    chatMessenger(),
                    chatMessenger(),
                    chatMessenger(),
                    chatMessenger(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column chatMessenger() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black,width: 3),
                  color: Colors.orange,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImageApp.imageTinMess),
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Quang Anh '), Text('Bạn đang làm gì đó')],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Row tinMessenger(tinMessengerModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    //ImageApp.imageTinMess,
                    model.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            Text(model.name),
          ],
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class tinMessengerModel {
  String imagePath;
  String name;

  tinMessengerModel(this.imagePath, this.name);
}
