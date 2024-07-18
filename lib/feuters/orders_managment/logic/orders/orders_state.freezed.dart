// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Food> foodList, FoodType foodType)
        getFoodsList,
    required TResult Function() addressLoadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult? Function()? addressLoadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult Function()? addressLoadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_getFoodsList value) getFoodsList,
    required TResult Function(_addressLoadSuccess value) addressLoadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_getFoodsList value)? getFoodsList,
    TResult? Function(_addressLoadSuccess value)? addressLoadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_getFoodsList value)? getFoodsList,
    TResult Function(_addressLoadSuccess value)? addressLoadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OrdersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Food> foodList, FoodType foodType)
        getFoodsList,
    required TResult Function() addressLoadSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult? Function()? addressLoadSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult Function()? addressLoadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_getFoodsList value) getFoodsList,
    required TResult Function(_addressLoadSuccess value) addressLoadSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_getFoodsList value)? getFoodsList,
    TResult? Function(_addressLoadSuccess value)? addressLoadSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_getFoodsList value)? getFoodsList,
    TResult Function(_addressLoadSuccess value)? addressLoadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrdersState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$getFoodsListImplCopyWith<$Res> {
  factory _$$getFoodsListImplCopyWith(
          _$getFoodsListImpl value, $Res Function(_$getFoodsListImpl) then) =
      __$$getFoodsListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foodList, FoodType foodType});
}

/// @nodoc
class __$$getFoodsListImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$getFoodsListImpl>
    implements _$$getFoodsListImplCopyWith<$Res> {
  __$$getFoodsListImplCopyWithImpl(
      _$getFoodsListImpl _value, $Res Function(_$getFoodsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodList = null,
    Object? foodType = null,
  }) {
    return _then(_$getFoodsListImpl(
      null == foodList
          ? _value._foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
    ));
  }
}

/// @nodoc

class _$getFoodsListImpl implements _getFoodsList {
  const _$getFoodsListImpl(final List<Food> foodList, this.foodType)
      : _foodList = foodList;

  final List<Food> _foodList;
  @override
  List<Food> get foodList {
    if (_foodList is EqualUnmodifiableListView) return _foodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodList);
  }

  @override
  final FoodType foodType;

  @override
  String toString() {
    return 'OrdersState.getFoodsList(foodList: $foodList, foodType: $foodType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getFoodsListImpl &&
            const DeepCollectionEquality().equals(other._foodList, _foodList) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_foodList), foodType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getFoodsListImplCopyWith<_$getFoodsListImpl> get copyWith =>
      __$$getFoodsListImplCopyWithImpl<_$getFoodsListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Food> foodList, FoodType foodType)
        getFoodsList,
    required TResult Function() addressLoadSuccess,
  }) {
    return getFoodsList(foodList, foodType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult? Function()? addressLoadSuccess,
  }) {
    return getFoodsList?.call(foodList, foodType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult Function()? addressLoadSuccess,
    required TResult orElse(),
  }) {
    if (getFoodsList != null) {
      return getFoodsList(foodList, foodType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_getFoodsList value) getFoodsList,
    required TResult Function(_addressLoadSuccess value) addressLoadSuccess,
  }) {
    return getFoodsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_getFoodsList value)? getFoodsList,
    TResult? Function(_addressLoadSuccess value)? addressLoadSuccess,
  }) {
    return getFoodsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_getFoodsList value)? getFoodsList,
    TResult Function(_addressLoadSuccess value)? addressLoadSuccess,
    required TResult orElse(),
  }) {
    if (getFoodsList != null) {
      return getFoodsList(this);
    }
    return orElse();
  }
}

abstract class _getFoodsList implements OrdersState {
  const factory _getFoodsList(
      final List<Food> foodList, final FoodType foodType) = _$getFoodsListImpl;

  List<Food> get foodList;
  FoodType get foodType;
  @JsonKey(ignore: true)
  _$$getFoodsListImplCopyWith<_$getFoodsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addressLoadSuccessImplCopyWith<$Res> {
  factory _$$addressLoadSuccessImplCopyWith(_$addressLoadSuccessImpl value,
          $Res Function(_$addressLoadSuccessImpl) then) =
      __$$addressLoadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$addressLoadSuccessImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$addressLoadSuccessImpl>
    implements _$$addressLoadSuccessImplCopyWith<$Res> {
  __$$addressLoadSuccessImplCopyWithImpl(_$addressLoadSuccessImpl _value,
      $Res Function(_$addressLoadSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$addressLoadSuccessImpl implements _addressLoadSuccess {
  const _$addressLoadSuccessImpl();

  @override
  String toString() {
    return 'OrdersState.addressLoadSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$addressLoadSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Food> foodList, FoodType foodType)
        getFoodsList,
    required TResult Function() addressLoadSuccess,
  }) {
    return addressLoadSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult? Function()? addressLoadSuccess,
  }) {
    return addressLoadSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Food> foodList, FoodType foodType)? getFoodsList,
    TResult Function()? addressLoadSuccess,
    required TResult orElse(),
  }) {
    if (addressLoadSuccess != null) {
      return addressLoadSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_getFoodsList value) getFoodsList,
    required TResult Function(_addressLoadSuccess value) addressLoadSuccess,
  }) {
    return addressLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_getFoodsList value)? getFoodsList,
    TResult? Function(_addressLoadSuccess value)? addressLoadSuccess,
  }) {
    return addressLoadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_getFoodsList value)? getFoodsList,
    TResult Function(_addressLoadSuccess value)? addressLoadSuccess,
    required TResult orElse(),
  }) {
    if (addressLoadSuccess != null) {
      return addressLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class _addressLoadSuccess implements OrdersState {
  const factory _addressLoadSuccess() = _$addressLoadSuccessImpl;
}
