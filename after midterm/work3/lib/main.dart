import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:work3/dbhelper.dart';
import 'person.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
      title: "SQflite Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Db_helper _db;
  String text = "";
  List<Map<String, dynamic>> Person_data = [];

  // List<Map<String, dynamic>> Person_data = [
  //   {"id": 1, "name": "John", "age": 23},
  //   {"id": 2, "name": "Peter", "age": 24},
  //   {"id": 3, "name": "Mary", "age": 25},
  //   {"id": 4, "name": "Jane", "age": 26},
  //   {"id": 5, "name": "Jack", "age": 27},
  //   {"id": 6, "name": "Jill", "age": 28},
  // ];

  loaddata() async {
    Database db = await Db_helper.instance.database;
    Person_data = await db.query(Db_helper.table);
    setState(() {});
    print(Person_data);
  }

  @override
  void initState() {
    super.initState();
    text = Person_data.toString();
    loaddata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SQflite Demo"),
        ),
        body: Column(children: [
          Text(text),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: (() {
                    inputdata();
                  }),
                  child: Column(
                    children: const [Text("Click me")],
                  ))
            ],
          ),
          SizedBox(
              height: 400, child: SingleChildScrollView(child: buildList()))
        ]));
  }

  Widget buildList() {
    return (Column(
      children: Person_data.map(
        (json) => Card(
          child: ListTile(
            title: Text("${json['id']} : ${json['name']}"),
            subtitle: Text("${json['age']}"),
            trailing: Text("${json['age']}"),
          ),
        ),
      ).toList(),
    ));
  }

  Widget buildJson() {
    List<Person> p = Person_data.map((data) => Person.fromJson(data)).toList();

    return (Column(
      children: p
          .map(
            (list) => Card(
              child: ListTile(
                title: Text("${list.id} : ${list.name}"),
                subtitle: Text("${list.age}"),
                trailing: Text("${list.age}"),
              ),
            ),
          )
          .toList(),
    ));
  }

  void todo() async {
    Db_helper db = Db_helper.instance;
    Person Persons_data = Person(id: 5, name: "Nopphagw T.", age: 99);
    db.insert(Persons_data.toJson());
    Person_data = await db.queryAll();
    setState(() {});
  }

  inputdata() {
    int Pid;
    String Pname;
    int Page;
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    TextEditingController t3 = TextEditingController();

    return AlertDialog(
        title: Text("Enter Person Data"),
        content: Column(
          children: [
            TextField(
              controller: t1,
              decoration: const InputDecoration(hintText: "Enter ID"),
            ),
            TextField(
              controller: t2,
              decoration: const InputDecoration(hintText: "Enter Name"),
            ),
            TextField(
              controller: t3,
              decoration: const InputDecoration(hintText: "Enter Age"),
            ),
          ],
        ));
  }
}
