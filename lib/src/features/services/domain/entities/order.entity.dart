import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';

class OrderEntity {
  int id;
  String reservedHour;
  String status;
  String time;
  SalonEntity? salon;
  OrderEntity(
      {this.id = 0,
      this.reservedHour = '',
      this.time = '',
      this.status = '',
      this.salon});

  String date() {
    var now = DateTime.parse(time);
    return Jalali.fromDateTime(now).formatFullDate();
  }

  bool isExpire() {
    return DateTime.parse(time).isBefore(DateTime.now());
  }
}
