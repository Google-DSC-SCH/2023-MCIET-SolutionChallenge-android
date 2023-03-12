import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solution_challenge_mciet/services/auth_service.dart';

class myrefPage extends StatefulWidget {
  const myrefPage({Key? key}) : super(key: key);

  @override
  State<myrefPage> createState() => _myrefPageState();
}

class _myrefPageState extends State<myrefPage> {
  final String accountName = FirebaseAuth.instance.currentUser!.displayName!;
  final String accountEmail = FirebaseAuth.instance.currentUser!.email!;

  var now = DateFormat('yyyy / MM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff3b6fa5),
          title: Text('M C I E T'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // 추가 작성
                },
                icon: Icon(Icons.person))
          ],
        ),
        body: Container(
            height: size.height * 0.2,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.2 - 70,
                  decoration: BoxDecoration(
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
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Row(
                          children: [
                            Icon(Icons.kitchen, size: 45),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 9, 9, 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    now,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
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
        drawer: Drawer(
          // 사이드바
          child: Container(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xff3b6fa5)),
                  accountName: Text(accountName), // 유저이름
                  accountEmail: Text(accountEmail), // 유저이메일
                  currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          AssetImage('lib/images/mciet_logo_1.png'),
                      child: ClipOval()),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    // 페이지 이동
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'My Account',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    // 페이지 이동
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 5,
                  indent: 10,
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    AuthService().signOut();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
