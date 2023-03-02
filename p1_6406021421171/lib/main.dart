import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyForm",
      home: Myform(),
    );
  }
}

class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  final Mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 188, 229),
        title: const Text("Cal Grade"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: Mycontroller,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          content: Column(
                            children: [
                              Text("Score = " + Mycontroller.text),
                              Text("Grade = " + cal_grade(Mycontroller.text)),
                            ],
                          ),
                        );
                      }));
                },
                child: Text("Check Grade")),
          ],
        ),
      ),
    );
  }
}

String cal_grade(String score) {
  int num = int.parse(score);
  if (num >= 80) {
    return "A";
  } else if (num >= 70) {
    return "B";
  } else if (num >= 60) {
    return "C";
  } else if (num >= 50) {
    return "D";
  } else {
    return "F";
  }
}
