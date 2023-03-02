import 'package:flutter/material.dart';

import 'classStorage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  String nickname = "";
  String password = "";
  String cfpassword = "";

  String _out = "";
  int age = 0;
  var Data = TextEditingController();
  var storage = classStorage();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Column(
        children: [
          Text("Name: "),
          TextField(
            controller: namecontroller,
            onChanged: ((value) => savedata()),
          ),
          Text("Age: "),
          TextField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    loaddata();
                  },
                  icon: Icon(Icons.person_add),
                  label: Text("Load name")),
              ElevatedButton.icon(
                  onPressed: () {
                    savedata();
                  },
                  icon: Icon(Icons.person),
                  label: Text("Save name")),
            ],
          ),
          Text(this.name),
        ],
      ),
    );
  }

  void loaddata() {
    storage.readFile().then((value) {
      setState(() {
        name = value;
      });
    });
  }

  void saveFile() {
    storage.writeFile("Test Masaage");
  }

  void savedata() {
    storage.writeFile(namecontroller.text);
  }
}
