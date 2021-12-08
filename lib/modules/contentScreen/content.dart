import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentScreen extends StatelessWidget {

  final String url ;
  ContentScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Content"),),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
