import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'testjson.dart';

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
      home: MyHomePage(title: 'Quiz Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int select_choice = 0;
  int indexvalue = 0;
  String ans = "Answer =";
  List<QuizModel> quiz = [];

  void loadJson() async {
    final String response =
        await rootBundle.loadString("assets/json/data.json");
    final jsdata = quizmodelFormJson(response);
    setState(() {
      quiz = jsdata;
    });
  }

  @override
  void initState() {
    // TODO : implement initState
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      randomQuiz();
                    },
                    child: const Text("Random Quiz")),
                ElevatedButton(
                    onPressed: () {
                      check_answer();
                    },
                    child: const Text("Check Answer")),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => display(1),
                  child: Text("1"),
                ),
                ElevatedButton(
                  onPressed: () => display(0),
                  child: Text("2"),
                ),
              ],
            ),
            quiz.isNotEmpty
                ? Text(
                    quiz[0].title,
                    style: const TextStyle(fontSize: 25),
                  )
                : const Text("Blank Title"),
            quiz.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: quiz[indexvalue].choice.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Radio(
                              value: index,
                              onChanged: (value) {
                                setState(() {
                                  select_choice = value!;
                                });
                              },
                              groupValue: select_choice,
                            ),
                            title: Text(quiz[1].choice[index].value),
                          );
                        })))
                : const Text("Choice..."),
            Text("solution $ans")
          ],
        ));
  }

  void Shuffer(List items) {
    var random = Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
  }

  void randomQuiz() {
    Shuffer(quiz);
    for (var q in quiz) {
      Shuffer(q.choice);
    }
    setState(() {});
  }

  void display(int idx) {
    indexvalue = idx;
    setState(() {});
  }

  void check_answer() {
    int solution;
    int answer;
    solution = quiz[indexvalue].answer;
    answer = quiz[indexvalue].choice[select_choice].id;
    ans = "Sol $solution vs $answer";
    setState(() {
      ans = "Sol $solution vs $answer";
    });
  }
}
