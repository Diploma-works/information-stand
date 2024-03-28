// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_rates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyRates _$CurrencyRatesFromJson(Map<String, dynamic> json) {
  return _CurrencyRates.fromJson(json);
}

/// @nodoc
mixin _$CurrencyRates {
  DateTime get Date => throw _privateConstructorUsedError;
  Map<String, Currency> get Valute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyRatesCopyWith<CurrencyRates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRatesCopyWith<$Res> {
  factory $CurrencyRatesCopyWith(
          CurrencyRates value, $Res Function(CurrencyRates) then) =
      _$CurrencyRatesCopyWithImpl<$Res, CurrencyRates>;
  @useResult
  $Res call({DateTime Date, Map<String, Currency> Valute});
}

/// @nodoc
class _$CurrencyRatesCopyWithImpl<$Res, $Val extends CurrencyRates>
    implements $CurrencyRatesCopyWith<$Res> {
  _$CurrencyRatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Date = null,
    Object? Valute = null,
  }) {
    return _then(_value.copyWith(
      Date: null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      Valute: null == Valute
          ? _value.Valute
          : Valute // ignore: cast_nullable_to_non_nullable
              as Map<String, Currency>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyRatesCopyWith<$Res>
    implements $CurrencyRatesCopyWith<$Res> {
  factory _$$_CurrencyRatesCopyWith(
          _$_CurrencyRates value, $Res Function(_$_CurrencyRates) then) =
      __$$_CurrencyRatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime Date, Map<String, Currency> Valute});
}

/// @nodoc
class __$$_CurrencyRatesCopyWithImpl<$Res>
    extends _$CurrencyRatesCopyWithImpl<$Res, _$_CurrencyRates>
    implements _$$_CurrencyRatesCopyWith<$Res> {
  __$$_CurrencyRatesCopyWithImpl(
      _$_CurrencyRates _value, $Res Function(_$_CurrencyRates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Date = null,
    Object? Valute = null,
  }) {
    return _then(_$_CurrencyRates(
      Date: null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      Valute: null == Valute
          ? _value._Valute
          : Valute // ignore: cast_nullable_to_non_nullable
              as Map<String, Currency>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyRates implements _CurrencyRates {
  const _$_CurrencyRates(
      {required this.Date, required final Map<String, Currency> Valute})
      : _Valute = Valute;

  factory _$_CurrencyRates.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyRatesFromJson(json);

  @override
  final DateTime Date;
  final Map<String, Currency> _Valute;
  @override
  Map<String, Currency> get Valute {
    if (_Valute is EqualUnmodifiableMapView) return _Valute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_Valute);
  }

  @override
  String toString() {
    return 'CurrencyRates(Date: $Date, Valute: $Valute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyRates &&
            (identical(other.Date, Date) || other.Date == Date) &&
            const DeepCollectionEquality().equals(other._Valute, _Valute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, Date, const DeepCollectionEquality().hash(_Valute));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyRatesCopyWith<_$_CurrencyRates> get copyWith =>
      __$$_CurrencyRatesCopyWithImpl<_$_CurrencyRates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyRatesToJson(
      this,
    );
  }
}

abstract class _CurrencyRates implements CurrencyRates {
  const factory _CurrencyRates(
      {required final DateTime Date,
      required final Map<String, Currency> Valute}) = _$_CurrencyRates;

  factory _CurrencyRates.fromJson(Map<String, dynamic> json) =
      _$_CurrencyRates.fromJson;

  @override
  DateTime get Date;
  @override
  Map<String, Currency> get Valute;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyRatesCopyWith<_$_CurrencyRates> get copyWith =>
      throw _privateConstructorUsedError;
}
