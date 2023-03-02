import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final Mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
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
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              children: [
                                Text("Score = " + Mycontroller.text),
                                Text("Grade = " + cal_grade(Mycontroller.text)),
                              ],
                            ),
                          );
                        });
                  },
                  child: const Text('Grade'),
                ),
              ],
            )));
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
}
