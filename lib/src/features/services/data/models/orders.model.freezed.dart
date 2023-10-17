// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return _OrdersModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersModel {
  List<OrderModel> get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersModelCopyWith<OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersModelCopyWith<$Res> {
  factory $OrdersModelCopyWith(
          OrdersModel value, $Res Function(OrdersModel) then) =
      _$OrdersModelCopyWithImpl<$Res, OrdersModel>;
  @useResult
  $Res call({List<OrderModel> orders});
}

/// @nodoc
class _$OrdersModelCopyWithImpl<$Res, $Val extends OrdersModel>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_value.copyWith(
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdersModelCopyWith<$Res>
    implements $OrdersModelCopyWith<$Res> {
  factory _$$_OrdersModelCopyWith(
          _$_OrdersModel value, $Res Function(_$_OrdersModel) then) =
      __$$_OrdersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OrderModel> orders});
}

/// @nodoc
class __$$_OrdersModelCopyWithImpl<$Res>
    extends _$OrdersModelCopyWithImpl<$Res, _$_OrdersModel>
    implements _$$_OrdersModelCopyWith<$Res> {
  __$$_OrdersModelCopyWithImpl(
      _$_OrdersModel _value, $Res Function(_$_OrdersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$_OrdersModel(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrdersModel extends _OrdersModel {
  _$_OrdersModel({final List<OrderModel> orders = const []})
      : _orders = orders,
        super._();

  factory _$_OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrdersModelFromJson(json);

  final List<OrderModel> _orders;
  @override
  @JsonKey()
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrdersModel(orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdersModel &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdersModelCopyWith<_$_OrdersModel> get copyWith =>
      __$$_OrdersModelCopyWithImpl<_$_OrdersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrdersModelToJson(
      this,
    );
  }
}

abstract class _OrdersModel extends OrdersModel {
  factory _OrdersModel({final List<OrderModel> orders}) = _$_OrdersModel;
  _OrdersModel._() : super._();

  factory _OrdersModel.fromJson(Map<String, dynamic> json) =
      _$_OrdersModel.fromJson;

  @override
  List<OrderModel> get orders;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersModelCopyWith<_$_OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}
