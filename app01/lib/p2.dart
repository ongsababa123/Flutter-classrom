import "package:flutter/material.dart";

class p2 extends StatefulWidget {
  const p2({super.key});

  @override
  State<p2> createState() => _p2State();
}

class _p2State extends State<p2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green, title: const Text("P2")),
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('images/kuy.jpg'),
              ),
            ),
            ElevatedButton(
              child: const Text("Back"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
