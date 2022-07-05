import 'dart:convert';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:medbuddy/doctor/doctorconsult/channelInput.dart';


class doctorvideocall extends StatefulWidget {
  const doctorvideocall({Key key}) : super(key: key);

  @override
  State<doctorvideocall> createState() => _MyAppState();
}

class _MyAppState extends State<doctorvideocall> {

  AgoraClient client;

 bool _loading = true;

 String tempToken = "";

    


  @override
  void initState() {
    gettoken();
    //initAgora();
    super.initState();
  }

Future<void> gettoken() async{
  
  String link = "https://agora-node-tokenserver.pmahesh2002.repl.co/access_token?channelName=$Dchannelid";
  Response _response = await get(Uri.parse(link));
  Map data = jsonDecode(_response.body);
  //print(data["token"]);
  setState(() {
    tempToken = data["token"];
    print(tempToken);
  });
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "651f5dd558334084b000d24481067768",
        channelName: Dchannelid,
        tempToken: tempToken
        ),
    enabledPermission: [
      Permission.microphone,
      Permission.camera
    ],
  );
  await _client.initialize();
  setState(() {
    client = _client;
    _loading = false;
    print(client);
  });
  //Future.delayed(Duration(seconds: 1)).then((value) => _loading = false);
  
}

  // void initAgora() async {
  //   await _client.initialize();
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 16.0,
          leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white, 
                ),
                onPressed: () {
                  //Navigator.pop(context);
                },
              
              ),
    
          backgroundColor: Colors.deepPurple,
          title: const Text('Video call'),
        ),
        body: SafeArea(
          child: _loading ? Center(
      
      child: Image.asset('assets/splash/pendulamloading.gif'),) :
          Stack(
            children: [
              AgoraVideoViewer(
                client: client,
               // layoutType: Layout.floating,
               // enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
              ),
            ],
          ),
        ),
      ),
    );
  }
}