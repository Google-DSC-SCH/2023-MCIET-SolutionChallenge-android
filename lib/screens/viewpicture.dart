import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ViewPicture extends StatelessWidget {
  const ViewPicture({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('M C I E T'),
          backgroundColor: Color(0xff3b6fa5),
          centerTitle: true),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(File(picture.path), fit: BoxFit.fill, width: 250),
              const SizedBox(height: 24),
              // Text(picture.name)
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {

                },
                icon: Icon(Icons.save_alt),
                label: Text('Save'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3b6fa5)),
              )
            ]),
      ),
    );
  }
}
