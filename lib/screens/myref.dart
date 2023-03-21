import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solution_challenge_mciet/model/drawer.dart';
import 'package:solution_challenge_mciet/screens/additem.dart';
import 'package:camera/camera.dart';

import '../components/my_category.dart';

class myrefPage extends StatefulWidget {
  const myrefPage({Key? key}) : super(key: key);

  @override
  State<myrefPage> createState() => _myrefPageState();
}

class _myrefPageState extends State<myrefPage> {
  final String accountName = FirebaseAuth.instance.currentUser!.displayName!;
  final String accountEmail = FirebaseAuth.instance.currentUser!.email!;

  var now = DateFormat('yyyy / MM').format(DateTime.now());

  List<String> _frozenfood = ['양파', '마늘', '대파', '피망'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff3b6fa5),
          title: const Text('M C I E T'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // 추가 작성
                },
                icon: const Icon(Icons.person))
          ],
        ),
        body: Column(
          children: [
            Container(
                height: size.height * 0.13,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: size.height * 0.2 - 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35)),
                          color: Color(0xff3b6fa5)),
                    ),
                    Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Row(
                              children: [
                                const Icon(Icons.kitchen, size: 45),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(13, 9, 9, 9),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        now,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      const Text(
                                        'My Refrigerator',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                )),
            myCategoty(frozenfood: _frozenfood),
          ],
        ),
        drawer: mydrawer(accountName: accountName, accountEmail: accountEmail),
      ),
    );
  }
}

