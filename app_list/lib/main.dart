import 'dart:math';

import 'package:flutter/material.dart';

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
  String txt = "";
  // List<String> mylist = <String>[];
  List<String> mylist = List.filled(3, "N/A",growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              txt,
              textScaleFactor: 2,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    mylist.add("Me");
                  });
                },
                child: Text("Add")),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: mylist.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return Container(
                      width: double.infinity,
                      height: 100,
                      child: Card(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: Icon(Icons.ac_unit),
                          title: Text("("+ index.toString() +")" + "Text Sample" + mylist[index]),
                          subtitle: Text("time:"),
                          trailing: Icon(Icons.delete_rounded),
                          onTap: (() {
                            setState(() {
                              mylist.removeAt(index);
                              txt = "Tap me";
                            });
                          }),
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

// Card(
//               color: Colors.blueAccent,
//               elevation: 10,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             ),
