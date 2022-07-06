import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NMC extends StatefulWidget {
  @override
  tatastate createState() => tatastate();
}


class tatastate  extends State<NMC> {
  WebViewController controller;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        //Color(0xFF3EB16F),
        title: Text("NMC",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                }
              }
          ),
          IconButton(icon: Icon(Icons.refresh),
            onPressed: () => controller.reload(),

          ),
          IconButton(icon: Icon(Icons.arrow_forward),
              onPressed: () async {
                if (await controller.canGoForward()) {
                  controller.goForward();
                }
              }
          ),
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://www.nmc.org.in/information-desk/indian-medical-register/#advanceSearch",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller){
            this.controller = controller;
          },
        ),
      ),
    );
  }
}