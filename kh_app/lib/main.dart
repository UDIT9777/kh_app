//import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';
import 'dart:async';
//import 'package:path/path.dart' as Path;

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:  Scaffold(
          body:
          SafeArea(
            child: WebViewLoad(),
          ),
        )

    );
  }
}

class WebViewLoad extends StatefulWidget {

  WebViewLoadUI createState() => WebViewLoadUI();


}

WebViewController controllerGlobal;

 Future<bool> _onBackPressed(){
   return showDialog(
     //context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('You are going to exit!'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );

      }
   );
 }

class WebViewLoadUI extends State<WebViewLoad>{


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body:
        SafeArea(
          child: WebView(
            initialUrl: 'https://kanzulhaya.com/',
            javascriptMode: JavascriptMode.unrestricted,

          ),
        ),
      ),
    );

  }
}
