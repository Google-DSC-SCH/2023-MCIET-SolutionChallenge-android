import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_mciet/screens/additem.dart';

class MyIngredient extends StatelessWidget {
  const MyIngredient({
    super.key, required this.ingredient, required this.expirationdate, required this.press,
  });

  final String ingredient;
  final String expirationdate;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              press;
            },
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  bottom: 10 * 2.5
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff92b7c7),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5)
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: "$ingredient\n\n",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                )
                            ),
                            TextSpan(
                                text: "$expirationdate",
                                style: TextStyle(
                                    fontSize: 15
                                )
                            )

                          ]
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryWithAddBtn extends StatelessWidget {
  const CategoryWithAddBtn({
    super.key, required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          TitleWithCategory(text: title),
          Spacer(),
          ElevatedButton.icon(
            onPressed: () async {
              await availableCameras().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AddItem(cameras: value))));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3b6fa5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),
            icon: Icon(Icons.add),
            label: Text('Add'),
          )
        ],
      ),
    );
  }
}

class TitleWithCategory extends StatelessWidget {
  const TitleWithCategory({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 7,
                color: Color(0xff3b6fa5).withOpacity(0.3),
              ))
        ],
      ),
    );
  }
}