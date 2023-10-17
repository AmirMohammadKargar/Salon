// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/services/data/models/service.model.dart';
import 'package:salon/src/features/services/domain/entities/service.entity.dart';

part 'services.model.freezed.dart';
part 'services.model.g.dart';

@freezed
// ignore: must_be_immutable
class ServicesModel with _$ServicesModel {
  ServicesModel._();
  factory ServicesModel({
    @Default([]) List<ServiceModel> services,
  }) = _ServicesModel;

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);

  List<ServiceEntity> get toEntity => services.map((e) {
        return ServiceEntity(
          id: e.id,
          name: e.name,
          description: e.description,
          image: e.image,
        );
      }).toList();
}
