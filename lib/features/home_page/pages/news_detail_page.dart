import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  late String url; 
  NewsDetailPage(this.url, {super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late String finalUrl;
  bool isLoading = true;
  late WebViewController _controller;
  @override
  void initState() {
    super.initState();

    if (((widget.url).toString()).contains("http://")) {
      finalUrl = ((widget.url).toString()).replaceAll("http://", "https://");
    } else {
      finalUrl = widget.url;
    }
    _controller =
        WebViewController()
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                setState(() {
                  isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          )
          ..loadRequest(Uri.parse(finalUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Skimz",
          style: TextStyle(
            fontFamily: "Erode",
            fontWeight: FontWeight.w500,
            decorationColor: Colors.black,
            decoration: TextDecoration.underline,
            fontSize: 50,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: WebViewWidget(controller: _controller),
          ),
          if (isLoading)
            const Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
