import 'dart:async';
import 'package:btvn_buoi11/resources/image_app.dart';
import 'package:flutter/material.dart';

class DemoGridView extends StatefulWidget {
  const DemoGridView({super.key});
  @override
  State<DemoGridView> createState() => _DemoGridViewState();
}
class _DemoGridViewState extends State<DemoGridView> {
  late List<GameModel> gameModel = [];
  int Score = 0;
  GameModel? luachon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameModel = [
      GameModel(ImageApp.imageDog),
      GameModel(ImageApp.imageCat),
      GameModel(ImageApp.imageChicken),
      GameModel(ImageApp.imageDog),
      GameModel(ImageApp.imageCat),
      GameModel(ImageApp.imageChicken),
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    gameModel.clear();
    super.dispose();
  }

  bool resetGame() {
    return gameModel.every((element) => element.isOpen);
  }

  void resetApp() {
    setState(() {
      // initState();
      gameModel = [
        GameModel(ImageApp.imageDog),
        GameModel(ImageApp.imageCat),
        GameModel(ImageApp.imageChicken),
        GameModel(ImageApp.imageDog),
        GameModel(ImageApp.imageCat),
        GameModel(ImageApp.imageChicken),
      ];
      Score = 0;
      luachon = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cards',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        //backgroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              itemCount: gameModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemBuilder: (BuildContext contex, int index) {
                return gridView(gameModel[index], (gameModel) {
                  // print('game : $gameModel');
                  setState(() {
                    gameModel.isOpen = !gameModel.isOpen;

                    if (luachon == null) {
                      luachon = gameModel;
                    } else {
                      if (luachon?.value == gameModel.value) {
                        Score++;
                        luachon = null;
                      } else {
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            luachon?.isOpen = false;
                            gameModel.isOpen = false;
                            luachon = null;
                          });
                        });
                      }
                    }
                  });
                });
              },
            ),
            Text(
              "Score: $Score ",
              style: Theme.of(context).textTheme.displayLarge,
              // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Visibility(
                visible: resetGame(),
                child: TextButton(
                  onPressed: resetApp,
                  child: Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: const Center(
                          child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
                ))
          ],
        ),
      ),
    );
  }

  Widget gridView(
      GameModel gameModel, void Function(GameModel gameModel) callBack) {
    // final String currentValue = ;
    return InkWell(
      onTap: () {
        callBack(gameModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: gameModel.isOpen
            ? Image.asset(
                gameModel.value,
                fit: BoxFit.fill,
              )
            : Center(
                child: Text('?', style: Theme.of(context).textTheme.displayLarge
                    ),
              ),
      ),
    );
  }
}

class GameModel {
  bool isOpen;
  String value;
  GameModel(this.value, {this.isOpen = false});
  @override
  String toString() {
    return 'GameModel{isOpen: $isOpen, value: $value}';
  }
}
