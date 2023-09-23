// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';

part 'salon.model.freezed.dart';
part 'salon.model.g.dart';

@freezed
// ignore: must_be_immutable
class SalonModel with _$SalonModel {
  SalonModel._();
  factory SalonModel({
    @Default(0) int id,
    @Default(0) int ownerId,
    @Default('') String name,
    @Default('') String phone,
    @Default('') String address,
    @Default('') String description,
    @Default('') String image,
    @Default('') String video,
    @Default('') String map,
  }) = _SalonModel;

  factory SalonModel.fromJson(Map<String, dynamic> json) =>
      _$SalonModelFromJson(json);

  SalonEntity get toEntity => SalonEntity(
        id: id,
        ownerId: ownerId,
        name: name,
        phone: phone,
        address: address,
        description: description,
        image: image,
        video: video,
        map: map,
      );
}
