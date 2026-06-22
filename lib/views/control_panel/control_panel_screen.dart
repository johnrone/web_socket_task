import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:websocket/core/services/web_socket_service.dart';
import 'package:websocket/core/web_socket/web_socket_server.dart';

class ControlPanelScreen extends StatelessWidget {
  const ControlPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Panel'),
      centerTitle: true,),
      body:  Center(
        child: Row(spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: (){WebSocketServer().start();
          Get.snackbar('WebSocket Server', 'WebSocket server started.');} , child: const Text('Start WebSocket Server')),
          Expanded(
            child: ElevatedButton(onPressed: ()=> ProcessSignal.sigint.watch().listen((_){
              WebSocketServer().stop();
              exit(0);
            }), child: const Text('Stop WebSocket Server')),
          )
          ],
        ),
      ),
    );
  }
}