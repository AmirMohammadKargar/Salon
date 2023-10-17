import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon/src/core/errors/error_handler.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/salon/data/dtos/salons.dto.dart';
import 'package:salon/src/features/salon/domain/usecases/salons.usecases.dart';
import 'package:salon/src/shared/utils/debouncer.util.dart';

class SalonsListManager with ChangeNotifier {
  PagingController salonController = PagingController(firstPageKey: 1);
  TextEditingController searchController = TextEditingController();

  int page = 1;

  Debouncer debouncer = Debouncer();

  void initialScreen() {
    salonController.addPageRequestListener((pageKey) async {
      var res = await getIt<SalonsUsecase>().call(
        SalonsParams(
          queryParams: SalonsDto(
            page: page,
            search: searchController.text,
          ),
        ),
      );
      res.fold((failure) {
        salonController.error = ErrorHandler.getErrorMessage(failure);
      }, (response) {
        var data = [];
        data.addAll(response.where((element) => element.verified));
        if (response.length < 20) {
          salonController.appendLastPage(data);
        } else {
          page++;
          salonController.appendPage(data, page);
        }
      });
      notifyListeners();
    });
  }

  void search() {
    debouncer.run(() {
      page = 1;
      salonController.refresh();
    });
  }
}
