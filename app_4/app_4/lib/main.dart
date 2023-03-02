import 'package:flutter/material.dart';
import 'package:app_4/page2.dart';
import 'package:app_4/quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/second': (context) => const Page2(),
        '/quiz': (context) => const Quiz(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int data = 0;

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = (prefs.getInt("data") ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text("Welcome Screen"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ins_data();
                });
              },
              icon: const Icon(Icons.arrow_upward)),
          IconButton(
              onPressed: () {
                setState(() {
                  dec_data();
                });
              },
              icon: const Icon(Icons.arrow_downward))
        ],
      ),
      drawer: Container(
        width: 250,
        color: Colors.purple[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Main Screen",
                style: TextStyle(fontSize: 50),
              ),
              const Text(
                "Counter",
                style: TextStyle(fontSize: 80),
              ),
              Text(
                "$data",
                style: const TextStyle(fontSize: 200),
              ),
              ElevatedButton(
                onPressed: () {
                  gotopage2(context);
                },
                child: const Text("Goto Page2 Fx"),
              ),
              ElevatedButton(
                onPressed: () {
                  doquiz(context);
                },
                child: const Text("Goto Page3"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: const Icon(Icons.navigation),
      ),
    );
  }

  void ins_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = (prefs.getInt("data") ?? 0) + 1;
      prefs.setInt("data", data);
    });
  }

  void dec_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = (prefs.getInt("data") ?? 0) - 1;
      prefs.setInt("data", data);
    });
  }

  void gotopage2(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: ((context, animation, secondaryAnimation) {
            return const Page2();
          }),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(CurvedAnimation(
                  parent: animation, curve: Curves.bounceInOut)),
              child: child,
            );
          },
          transitionDuration: const Duration(seconds: 3),
        ));
  }

  void doquiz(BuildContext context) {
    Navigator.pushNamed(context, '/quiz');
  }
}
