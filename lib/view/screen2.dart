import 'package:flutter/material.dart';
import 'package:shoppify/models/quotes.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<Quotes> quote = [
    Quotes(author: 'kalkidan', text: "dont fall for traps"),
    Quotes(author: 'Andrew', text: 'Donts'),
    Quotes(author: 'Marteen', text: 'Birds fly'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Welcome',
          style: TextStyle(fontSize: 20.0),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: quote
              .map((e) => Card(child: Text('${e.author} - ${e.text}')))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/screen1');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
