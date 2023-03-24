import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:solution_challenge_mciet/screens/home.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  TextEditingController _expirationdate = TextEditingController();
  TextEditingController _opendate = TextEditingController();

  List<String> category = [
    'FROZEN FOOD',
    'MEAT',
    'VEGETABLE AND FRUIT',
    'SAUCE',
    'BEVERGE',
    'ETC'
  ];

  String? selectedcategory = 'FROZEN FOOD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('M C I E T'),
        centerTitle: true,
        backgroundColor: Color(0xff3b6fa5),
        actions: [
          PopupMenuButton<Text>(itemBuilder: (context) {
            return [PopupMenuItem(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Delete')
            )
            ];
          })
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 40, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8, right: 15),
                child: Center(
                  child: Column(
                    children: [
                      TextField(
                        controller: _expirationdate,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today_rounded),
                            labelText: "Expiration Date"),
                        onTap: () async {
                          DateTime? pickExDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2100));

                          if (pickExDate != null) {
                            setState(() {
                              _expirationdate.text =
                                  DateFormat('yyyy-MM-dd').format(pickExDate);
                            });
                          }
                        },
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: _opendate,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today_rounded),
                            labelText: "Open Date"),
                        onTap: () async {
                          DateTime? pickExDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2100));

                          if (pickExDate != null) {
                            setState(() {
                              _opendate.text =
                                  DateFormat('yyyy-MM-dd').format(pickExDate);
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                        width: 280,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xff3b6fa5)))),
                          value: selectedcategory,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (item) =>
                              setState(() => selectedcategory = item),
                          items: category.map((item) {
                            return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ));
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 2,
                                color: Colors.black,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAll(() => homePage());
                            },
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff3b6fa5),
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}