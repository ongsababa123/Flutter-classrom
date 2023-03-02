import "package:flutter/material.dart";
import 'p2.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 215, 62),
          title: const Text("My App"),
          leading: const Icon(Icons.menu),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: Text("Line 2", style: TextStyle(fontSize: 20))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              const Center(
                  child: Text(
                "Enter Your Name",
                style: TextStyle(
                  fontSize: 25,
                ),
              )),
              const TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Color.fromARGB(255, 253, 0, 0),
                labelText: "กรอกชื่อ...",
                labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
              )),
              Expanded(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("OK"))),
                    ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: const <Widget>[
                            Text("Cancel"),
                            Icon(Icons.cancel)
                          ],
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const p2()));
                        },
                        icon: const Icon(Icons.receipt, color: Colors.green))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
