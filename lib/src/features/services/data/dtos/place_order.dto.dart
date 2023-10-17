import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:salon/src/shared/enums/order_status.enum.dart';
import 'package:salon/src/shared/enums/reserved_hour.enum.dart';

class PlaceOrderDto {
  final int salonId;
  final ReservedHour reservedHour;
  final int price;
  final List<int> serviceIds;
  final OrderStatus status;
  final Jalali jalali;
  PlaceOrderDto({
    required this.salonId,
    required this.reservedHour,
    required this.price,
    required this.serviceIds,
    required this.status,
    required this.jalali,
  });

  Map<String, dynamic> toJson() {
    return {
      'salon_id': salonId,
      'reservedHour': reservedHour.value,
      'price': price,
      'serviceIds': serviceIds,
      'status': status.value,
      'time': jalali.toDateTime().toIso8601String(),
    };
  }
}
