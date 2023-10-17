import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:salon/src/core/errors/error_handler.dart';
import 'package:salon/src/core/usecase/base_usecase.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';
import 'package:salon/src/features/salon/domain/usecases/salons.usecases.dart';
import 'package:salon/src/features/services/data/dtos/place_order.dto.dart';
import 'package:salon/src/features/services/domain/entities/service.entity.dart';
import 'package:salon/src/features/services/domain/usecases/services.usecases.dart';
import 'package:salon/src/shared/enums/order_status.enum.dart';
import 'package:salon/src/shared/enums/reserved_hour.enum.dart';
import 'package:salon/src/shared/widgets/app_snackbar.widget.dart';

class SalonManager with ChangeNotifier {
  bool loading = false;
  bool placingOrder = false;

  String loadSalonErrorMessage = '';

  SalonEntity? salon;

  List<ServiceEntity> services = [];
  List<ServiceEntity> selectedServices = [];

  void initialScreen(int id) {
    getSalon(id);
    getServices();
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

  Future<void> getServices() async {
    var res = await getIt<ServicesUsecase>().call(NoParams());

    res.fold((l) => null, (response) {
      services.addAll(response);
    });
    notifyListeners();
  }

  void selectService(ServiceEntity service) {
    if (selectedServices.any((element) => element.id == service.id)) {
      selectedServices.removeWhere((element) => element.id == service.id);
      services.add(service);
    } else {
      selectedServices.add(service);
      services.removeWhere((element) => element.id == service.id);
    }
    notifyListeners();
  }

  Future<void> placeOrder(
      BuildContext context, Jalali date, ReservedHour reserved) async {
    if (selectedServices.isNotEmpty) {
      placingOrder = true;
      notifyListeners();
      var res = await getIt<PlaceOrderUsecase>().call(
        PlaceOrderParams(
          body: PlaceOrderDto(
            jalali: date,
            salonId: salon!.id,
            reservedHour: reserved,
            price: 20000,
            serviceIds: selectedServices.map((e) => e.id).toList(),
            status: OrderStatus.pending,
          ),
        ),
      );
      placingOrder = false;
      notifyListeners();
      res.fold((failure) {
        ErrorHandler.showErrorSnack(context: context, failure: failure);
      }, (response) {
        services.addAll(selectedServices);
        selectedServices.clear();
        notifyListeners();
        AppSnackBar.showSuccessSnack(
            context: context, message: 'رزو وقت با موفقیت انجام شد');
      });
    } else {
      ErrorHandler.showErrorSnack(
          context: context,
          message: 'لطفا سرویس مورد نظر خود را انتخاب نمایید');
    }
  }
}
