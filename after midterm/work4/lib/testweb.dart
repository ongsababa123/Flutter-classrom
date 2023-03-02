import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Testweb extends StatefulWidget {
  String title;

  Testweb({super.key, required this.title});
  @override
  State<Testweb> createState() => _TestwebState();
}

class _TestwebState extends State<Testweb> {
  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://172.20.10.7/test/login.html'))
      // ..loadRequest(Uri.parse('https://www.google.com'))
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://m.youtube.com')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageFinished: (String url) {
          setState(() {
            controller.runJavaScript("""
            document.getElementByName("uname")[0].value = "Test";
            document.getElementByName("password")[0].value = "123";
            document.forms[0].submit();
            """);
          });
        },
      ));
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
