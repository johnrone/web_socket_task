import 'package:get/get.dart';
import 'package:websocket/core/services/web_socket_service.dart';

class PriceController extends GetxController {
  final WebSocketService _webSocketService = Get.find<WebSocketService>();

  RxDouble get basePrice => _webSocketService.basePrice;
  RxString get lastUpdate => _webSocketService.lastUpdate;
  RxBool get isConnect => _webSocketService.isConnect;
  RxList<Map<String, dynamic>> get priceHistory => _webSocketService.priceHistory;


  String getPriceWithCurrency() {
    return basePrice.value.toStringAsFixed(2);
  }
  String getLastUpdate(){
    return lastUpdate.value;
  }

}
