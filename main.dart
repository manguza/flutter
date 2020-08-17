import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Xylophone Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void playsound(int i) {
    final player = AudioCache();
    player.play('note$i.wav');
  }

  Expanded buildKey({Color c, int soundNumber, String text}) {
    return Expanded(
      child: FlatButton(
        color: c,
        onPressed: () {
          playsound(soundNumber);
        },
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildKey(c: Colors.red, soundNumber: 1, text: 'Do'),
            buildKey(c: Colors.orange, soundNumber: 2, text: 'Re'),
            buildKey(c: Colors.yellow, soundNumber: 3, text: 'Me'),
            buildKey(c: Colors.green, soundNumber: 4, text: 'Fa'),
            buildKey(c: Colors.teal, soundNumber: 5, text: 'Sol'),
            buildKey(c: Colors.blue, soundNumber: 6, text: 'La'),
            buildKey(c: Colors.purple, soundNumber: 7, text: 'Te'),
          ],
        ),
      ),
    );
  }
}
