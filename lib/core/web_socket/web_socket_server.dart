import 'dart:async';
import 'dart:convert';
import 'dart:io';

class WebSocketServer {

  static const int port = 8080;
  double basePrice = 50.0;
  Timer? updateTimer;
  List<WebSocket> clients=[];
  void start() async{
  try {final server =await HttpServer.bind(InternetAddress.anyIPv4, port);
  print ('websocket running on ws://localhost:$port');
  await for(HttpRequest request in server){if (WebSocketTransformer.isUpgradeRequest(request)) {
    final socket =await WebSocketTransformer.upgrade(request);
    clients.add(socket);
    print('Client connected: ${socket.hashCode}');
    sendPriceUpdate(socket);
    socket.listen((message){print('recevied message : $message');},onDone:() {
      clients.remove(socket);
      print('Client disconnected: ${socket.hashCode}');
    },);
  }else{request.response.statusCode=400;
  request.response.close();}}}  catch (e) {
    print('Error occurred: $e');
  }
  }
  void sendPriceUpdate(WebSocket socket){
    final update={
      'price': basePrice,
      'timestamp':DateTime.now().toIso8601String(),
    };
    socket.add(jsonEncode(update));
  }

  void stop (){
    updateTimer?.cancel();
    updateTimer=null;
    for(final client in clients){
      client.close();
    }
    
    clients.clear();
    print('WebSocket server stopped');
  }

}
