import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solution_challenge_mciet/model/drawer.dart';
import 'package:solution_challenge_mciet/screens/additem.dart';
import 'package:camera/camera.dart';

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
            Flexible(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'FROZEN FOOD',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        height: 25,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xff3b6fa5)),
                        alignment: Alignment.center,
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await availableCameras().then((value) => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AddItem(cameras: value))));
                        },
                        icon: const Icon(Icons.add, color: Color(0xff3b6fa5)),
                        label: const Text('Add',
                            style: TextStyle(color: Color(0xff3b6fa5))),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                            itemCount: _frozenfood.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                                  height: 80,
                                  width: 150,
                                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(_frozenfood[index]),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text('DETAILS',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: Color(0xff92b7c7),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: Offset(0, 2))
                                      ]),
                                )),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
        drawer: mydrawer(accountName: accountName, accountEmail: accountEmail),
      ),
    );
  }
}
