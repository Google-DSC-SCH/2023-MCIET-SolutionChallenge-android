import 'package:flutter/material.dart';


class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff3b6fa5),
        title: Text('M C I E T'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: size.height * 0.13,
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
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Center(
                            child: Text(
                              'My CheckList',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
