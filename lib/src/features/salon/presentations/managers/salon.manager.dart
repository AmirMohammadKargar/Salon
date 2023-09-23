import 'package:flutter/material.dart';
import 'package:salon/src/core/errors/error_handler.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';
import 'package:salon/src/features/salon/domain/usecases/salons.usecases.dart';

class SalonManager with ChangeNotifier {
  bool loading = false;

  String loadSalonErrorMessage = '';

  SalonEntity? salon;

  void initialScreen(int id) {
    getSalon(id);
  }

  Future<void> getSalon(int id) async {
    loading = true;
    loadSalonErrorMessage = '';
    notifyListeners();

    var res = await getIt<SalonUsecase>().call(SalonParams(id: id));

    res.fold((failure) {
      loadSalonErrorMessage = ErrorHandler.getErrorMessage(failure);
    }, (response) {
      salon = response;
    });

    loading = false;
    notifyListeners();
  }
}
