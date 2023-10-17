import 'package:injectable/injectable.dart';
import 'package:salon/src/features/services/data/models/orders.model.dart';
import 'package:salon/src/features/services/data/models/services.model.dart';
import 'package:salon/src/shared/constants/urls.dart';

import '../../../../core/network/http_client.dart';
import '../dtos/place_order.dto.dart';

abstract class ServicesRemoteDataSource {
  Future<ServicesModel> services();
  Future<void> placeOrder(PlaceOrderDto body);
  Future<OrdersModel> orders();
}

@Injectable(as: ServicesRemoteDataSource)
class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  final AppHttpClient httpClient;
  ServicesRemoteDataSourceImpl(this.httpClient);

  @override
  Future<ServicesModel> services() async {
    var jsonRes = await httpClient.get(Urls.services);
    return ServicesModel.fromJson(jsonRes);
  }

  @override
  Future<void> placeOrder(PlaceOrderDto body) async {
    await httpClient.post(Urls.placeOrder, data: body.toJson());
  }

  @override
  Future<OrdersModel> orders() async {
    var jsonRes =
        await httpClient.get(Urls.orders, queryParams: {'limit': 1000});
    return OrdersModel.fromJson(jsonRes);
  }
}
