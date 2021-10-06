import 'package:flutter/material.dart';
import 'package:shoppify/models/users.dart';

class Screen1 extends StatefulWidget {
  Screen1({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<Users> user = [
    Users(email: 'Kalkidandemes99@gmail.com', password: '1234'),
    Users(email: 'myemail@gmail.com', password: '12345'),
    Users(email: 'Andrew@gmail.com', password: 'andrew123'),
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('$_counter'),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Please input your email',
              labelText: 'email',
              icon: Icon(Icons.mail),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'please input your password',
              labelText: 'Password',
              icon: Icon(Icons.lock),
            ),
            validator: (val) {
              if (val == null || val.length <= 6) {
                return ('password length must be morethan 6 characters');
              }
            },
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },

            //child: Text('Login'),
            icon: Icon(Icons.login),
            label: Text('SignUp'),
          ),
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: user
                  .map((e) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${e.email} - ${e.password}'),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
