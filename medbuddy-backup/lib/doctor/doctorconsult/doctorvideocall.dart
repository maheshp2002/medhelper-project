import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:medbuddy/doctor/doctorconsult/channelInput.dart';


class doctorvideocall extends StatefulWidget {
  const doctorvideocall({Key key}) : super(key: key);

  @override
  State<doctorvideocall> createState() => _MyAppState();
}

class _MyAppState extends State<doctorvideocall> {
  AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "651f5dd558334084b000d24481067768",
      channelName: Dchannelid,
      //username: Dusername,
      tempToken: "006651f5dd558334084b000d24481067768IACxnhNTUEqBrcxyysnGaOv923OJ3vF4FmZ5ZZiSZMeUPgx+f9gAAAAAEADYPDyUeIG9YgEAAQAFgr1i" 
    ),
    enabledPermission: [
      Permission.microphone,
      Permission.camera
    ],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 16.0,
          leading: Builder(
          builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white, 
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              
              );
            },
          ),
          backgroundColor: Colors.deepPurple,
          title: const Text('Video call'),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
               // layoutType: Layout.floating,
               // enableHostControls: true, // Add this to enable host controls
              ),
              // AgoraVideoButtons(
              //   client: client,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}