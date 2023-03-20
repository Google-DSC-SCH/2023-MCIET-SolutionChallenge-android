import 'package:flutter/material.dart';

class memoPage extends StatefulWidget {
  const memoPage({Key? key}) : super(key: key);

  @override
  State<memoPage> createState() => _memoPageState();
}

class _memoPageState extends State<memoPage> {
  List<String> memos = [];
  String input = '';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3b6fa5),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add Memo'),
                  content: TextField(
                    decoration: InputDecoration(hintText: "Memo"),
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff3b6fa5)),
                          onPressed: () {
                            setState(() {
                              memos.add(input);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Add')),
                    )
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
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
                              'My Memo',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                ],
              )),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: memos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        key: Key(memos[index]),
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(memos[index]),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  memos.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ));
                  }),
            ),
          )
        ],
      ),
    );
  }
}
