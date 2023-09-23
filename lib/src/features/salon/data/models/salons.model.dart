// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/salon/data/models/salon.model.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';

part 'salons.model.freezed.dart';
part 'salons.model.g.dart';

@freezed
// ignore: must_be_immutable
class SalonsModel with _$SalonsModel {
  SalonsModel._();
  factory SalonsModel({
    @Default([]) List<SalonModel> salons,
  }) = _SalonsModel;

  factory SalonsModel.fromJson(Map<String, dynamic> json) =>
      _$SalonsModelFromJson(json);

  List<SalonEntity> get toEntity => salons.map((e) {
        return SalonEntity(
          id: e.id,
          ownerId: e.ownerId,
          name: e.name,
          phone: e.phone,
          address: e.address,
          description: e.description,
          image: e.image,
          video: e.video,
          map: e.map,
        );
      }).toList();
}
