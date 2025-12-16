import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class RadioWebView extends StatefulWidget {
  const RadioWebView({super.key});

  @override
  State<RadioWebView> createState() => _RadioWebViewState();
}

class _RadioWebViewState extends State<RadioWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://s30.radiolize.com/public/holy_cross_radio_tka09u/embed?theme=light',
        ),
      );
  }

  @override
  void dispose() {
    controller.loadRequest(Uri.parse("about:blank")); // ✅ STOP AUDIO
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        backgroundColor: Colors.black,
          title: const Text('Radio Player', style: TextStyle(color: Colors.white),)),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/RADIOPAGE.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: WebViewWidget(controller: controller),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
