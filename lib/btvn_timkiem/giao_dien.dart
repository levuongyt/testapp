import 'package:btvn_buoi11/resources/image_app.dart';
import 'package:flutter/material.dart';
import 'human.dart';

class QuanLi extends StatefulWidget {
  const QuanLi({super.key});

  @override
  State<QuanLi> createState() => _QuanLiState();
}

class _QuanLiState extends State<QuanLi> {
  TextEditingController timkiemController = TextEditingController();
  final List<Human> humans = [
    Human('1', 'Vuong', 22, ImageApp.imageChatMess),
    Human('2', 'Phuong ', 21, ImageApp.imageTin),
    Human('3', 'Hoai', 23, ImageApp.imageTinMess),
    Human('4', 'Hong', 20, ImageApp.imageTinMess),
    Human('5', 'Nam', 22, ImageApp.imageTin),
    Human('6', 'Tuan', 19, ImageApp.imageTin),
    Human('7', 'Phong', 24, ImageApp.imageTin),
  ];
  List<Human> kqTK = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kqTK = List.from(humans);
  }

  void sapXep() {
    setState(() {
      kqTK.sort((a, b) => b.age.compareTo(a.age));
    });
  }

  void timKiem() {
    setState(() {
      kqTK = [];
      if (timkiemController.text.isEmpty) {
        kqTK = List.from(humans);
      } else {
        humans.forEach((element) {
          if (element.name.contains(timkiemController.text)) {
            kqTK.add(element);
          }
        });
        // for (int i = 0; i < humans.length; i++) {
        //   if (humans[i].name.contains(timkiemController.text)) {
        //     kqTK.add(humans[i]);
        //   }
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Humans',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          sapXep();
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
              color: Colors.blueAccent, shape: BoxShape.circle),
          child: const Center(
            child: Text(
              'Sắp xếp',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: timkiemController,
                decoration: InputDecoration(
                    hintText: 'Nhập tên cần tìm',
                    suffixIcon: InkWell(
                      onTap: () {
                        timKiem();
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: kqTK.isEmpty
                    ? const Text('Không tìm thấy người này!')
                    : ListView(
                        shrinkWrap: true,
                        children:
                            kqTK.map((model) => humanModel(model)).toList(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column humanModel(Human model) {
    return Column(
      children: [
        Container(
          height: 150,
          color: Colors.grey,
          child: Row(
            children: [
              Image.asset(
                model.image,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${model.id} '),
                    Text('Name :${model.name} '),
                    Text('Age :${model.age} '),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
