import 'dart:async';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'dart:math';


import 'package:websocket/core/helpful_functions/format_date.dart';
class WebSocketService extends GetxService{
  WebSocketChannel? channel;
  final RxDouble basePrice=50.0.obs;
  final RxString lastUpdate=''.obs;
  final  RxBool isConnect=false.obs;
  final RxList<Map<String, dynamic>> priceHistory=<Map<String, dynamic>>[].obs;

  Future<WebSocketService> init() async {
      Future.delayed(Duration(seconds: 8), () {
     connect();});

    return this;
  }



  dynamic _startSimulatingPrice() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      final randomPrice = 50.0 + Random().nextDouble() * (120.0 - 50.0);
      handleMessage(jsonEncode({
        'price': randomPrice,
        'timestamp': DateTime.now().toIso8601String()
      }));
    });
  }

  void connect() async{
    final wsLink=Uri.parse('ws://localhost:8080');
    try {
      channel=WebSocketChannel.connect(wsLink);
      await channel!.ready;
      channel!.stream.listen((message){
        handleMessage(_startSimulatingPrice());
      },onDone:(){isConnect.value=false;
      print('WebSocket connection closed');
      reconnect();},onError:(error){
        isConnect.value=false;
        print('WebSocket error: $error');
        reconnect();
      });
      isConnect.value=true;
      print('WebSocket connected');
    } catch (e) {
      print('Error connecting to WebSocket!: $e');
      reconnect();
    }
  }
  void handleMessage(dynamic message){
    try{
      final  data =jsonDecode(message);
      if(data is Map<String, dynamic>){
        final price=data['price']?.toDouble();
        final timestamp=data['timestamp']?.toString()??DateTime.now().toIso8601String();
        if(price!=null){basePrice.value=price;
        lastUpdate.value= FormatDateClass.formatTimestamp(timestamp);
        priceHistory.add({'price': price, 'timestamp': timestamp});
        if (priceHistory.length > 20) {
          priceHistory.removeAt(0);
        }
      }}
    }catch(e){
      print('error parcing message: $e');}
  }
 void reconnect(){
    Future.delayed(Duration(seconds:3),(){if (!isConnect.value) {
      connect();
    }});
  }
  void disconnect(){
    channel?.sink.close();
   channel=null;
    isConnect.value=false;
    print('WebSocket disconnected');
  }
  @override
  void onClose(){
    disconnect();
    super.onClose();
  }
  void dispose(){
    disconnect();
    
  }
}

