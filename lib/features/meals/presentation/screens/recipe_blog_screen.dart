import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeBlogScreen extends StatefulWidget {
  final String url;

  RecipeBlogScreen({required this.url});

  @override
  State<RecipeBlogScreen> createState() => _RecipeBlogScreenState();
}

class _RecipeBlogScreenState extends State<RecipeBlogScreen> {
 late  WebViewController _controller;
  @override
  void initState() {
    _controller=WebViewController()..loadRequest(Uri.parse(widget.url));
    super.initState();
  }
 @override
 void dispose() {

   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: WebViewWidget(controller: _controller,

      ),
    );
  }
}