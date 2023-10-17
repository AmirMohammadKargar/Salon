import 'package:flutter/material.dart';
import 'package:salon/src/core/usecase/base_usecase.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/services/domain/entities/order.entity.dart';
import 'package:salon/src/features/services/domain/usecases/services.usecases.dart';

class OrdersManager with ChangeNotifier {
  bool loading = false;
  bool loadHasError = false;

  List<OrderEntity> orders = [];
  void initialScreen() {
    getOrders();
  }

  Future<void> getOrders() async {
    loading = true;
    notifyListeners();
    var res = await getIt<OrdersUsecase>().call(NoParams());
    res.fold((failure) {
      loadHasError = true;
    }, (response) {
      orders.addAll(response);
    });
    loading = false;
    notifyListeners();
  }
}
