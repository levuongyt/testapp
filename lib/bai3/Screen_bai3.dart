import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../list_view/list_view_demo_screen.dart';

class ScreenBai3 extends StatefulWidget {
  const ScreenBai3({super.key});

  @override
  State<ScreenBai3> createState() => _ScreenBai3State();
}

class _ScreenBai3State extends State<ScreenBai3> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = 'admin@gmail.com';
  String pass = '123';
  final _formKey = GlobalKey<FormState>();
   bool isEmail(String Email){
     bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(Email);
     return emailValid;
   }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 7,
              ),
              color: const Color(0xffFBF6F0),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                          height: 125,
                          decoration: BoxDecoration(
                            // color: Colors.purpleAccent[700],
                            color: Color(0xFF9E3AEC),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                              child: Text(
                            'MobiPay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontFamily: 'Jaro'),
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.purpleAccent[700],
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text('Please sign in to continue',
                              style: TextStyle(
                                color: Colors.purpleAccent[700],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('EMAIL',
                              style: TextStyle(color: Colors.purpleAccent[700])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return 'K dc de trong';
                          }
                          if(isEmail(_emailController.text)==false){
                            return 'Định dạng sai';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('PASSWORD',
                              style: TextStyle(color: Colors.purpleAccent[700])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return 'K dc de trong';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //     backgroundColor: Colors.blue,
                                //     content: Text('Hợp lệ')
                                // ));
            
                                if (_emailController.text == email &&
                                    _passwordController.text == pass) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => listView()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Container(
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Login failed')
                                          ],
                                        ),
                                      )));
                                }
                                setState(() {});
                              };
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF9E3AEC),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.east,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Forgot Password ?'),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Click here',
                                style: TextStyle(color: Colors.blue))),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Stack(children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(150),
                            topRight: Radius.circular(300),
                            // bottomRight: Radius.circular(25.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            heightFactor: 0.55,
                            widthFactor: 1,
                            child: Image.asset(
                              'assets/images/timdam.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 20,
                        left: 60,
                        child: Text(
                          'Your Mobile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Salsa'),
                        ),
                      ),
                      const Positioned(
                          top: 60,
                          left: 120,
                          child: Text('Your Bank',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Salsa'))),
                    ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
