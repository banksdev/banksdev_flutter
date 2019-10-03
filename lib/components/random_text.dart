import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';

class RandomText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RandomText();
  }
}

class _RandomText extends State<RandomText> {
  String text = "Test";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          var res = await readFile();
          setState(() {
            text = res;
          });
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.amber, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}

Future<String> readFile() async {
  var data = await rootBundle.load('assets/msg.txt');
  var dir = Directory.systemTemp.path + "msg.txt";
  var file = await writeToFile(data, dir);
  var content = await file.readAsLines();

  // var content = await new File('assets/msg.txt').readAsLines();
  var rand = new Random();
  var index = rand.nextInt(content.length - 1);
  var string = content[index];
  return string;
}

Future<File> writeToFile(ByteData data, String path) {
  ByteBuffer buffer = data.buffer;
  return File(path).writeAsBytes(buffer.asUint8List(
    data.offsetInBytes,
    data.lengthInBytes,
  ));
}
