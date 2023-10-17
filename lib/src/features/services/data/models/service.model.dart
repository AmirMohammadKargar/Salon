// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/services/domain/entities/service.entity.dart';

part 'service.model.freezed.dart';
part 'service.model.g.dart';

@freezed
// ignore: must_be_immutable
class ServiceModel with _$ServiceModel {
  ServiceModel._();
  factory ServiceModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String image,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  ServiceEntity get toEntity => ServiceEntity(
        id: id,
        name: name,
        description: description,
        image: image,
      );
}
