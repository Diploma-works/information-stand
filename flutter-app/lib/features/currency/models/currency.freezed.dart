// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String get ID => throw _privateConstructorUsedError;
  String get NumCode => throw _privateConstructorUsedError;
  String get CharCode => throw _privateConstructorUsedError;
  int get Nominal => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  double get Value => throw _privateConstructorUsedError;
  double get Previous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {String ID,
      String NumCode,
      String CharCode,
      int Nominal,
      String Name,
      double Value,
      double Previous});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ID = null,
    Object? NumCode = null,
    Object? CharCode = null,
    Object? Nominal = null,
    Object? Name = null,
    Object? Value = null,
    Object? Previous = null,
  }) {
    return _then(_value.copyWith(
      ID: null == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String,
      NumCode: null == NumCode
          ? _value.NumCode
          : NumCode // ignore: cast_nullable_to_non_nullable
              as String,
      CharCode: null == CharCode
          ? _value.CharCode
          : CharCode // ignore: cast_nullable_to_non_nullable
              as String,
      Nominal: null == Nominal
          ? _value.Nominal
          : Nominal // ignore: cast_nullable_to_non_nullable
              as int,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Value: null == Value
          ? _value.Value
          : Value // ignore: cast_nullable_to_non_nullable
              as double,
      Previous: null == Previous
          ? _value.Previous
          : Previous // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$$_CurrencyCopyWith(
          _$_Currency value, $Res Function(_$_Currency) then) =
      __$$_CurrencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ID,
      String NumCode,
      String CharCode,
      int Nominal,
      String Name,
      double Value,
      double Previous});
}

/// @nodoc
class __$$_CurrencyCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$_Currency>
    implements _$$_CurrencyCopyWith<$Res> {
  __$$_CurrencyCopyWithImpl(
      _$_Currency _value, $Res Function(_$_Currency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ID = null,
    Object? NumCode = null,
    Object? CharCode = null,
    Object? Nominal = null,
    Object? Name = null,
    Object? Value = null,
    Object? Previous = null,
  }) {
    return _then(_$_Currency(
      ID: null == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String,
      NumCode: null == NumCode
          ? _value.NumCode
          : NumCode // ignore: cast_nullable_to_non_nullable
              as String,
      CharCode: null == CharCode
          ? _value.CharCode
          : CharCode // ignore: cast_nullable_to_non_nullable
              as String,
      Nominal: null == Nominal
          ? _value.Nominal
          : Nominal // ignore: cast_nullable_to_non_nullable
              as int,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Value: null == Value
          ? _value.Value
          : Value // ignore: cast_nullable_to_non_nullable
              as double,
      Previous: null == Previous
          ? _value.Previous
          : Previous // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Currency implements _Currency {
  const _$_Currency(
      {required this.ID,
      required this.NumCode,
      required this.CharCode,
      required this.Nominal,
      required this.Name,
      required this.Value,
      required this.Previous});

  factory _$_Currency.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyFromJson(json);

  @override
  final String ID;
  @override
  final String NumCode;
  @override
  final String CharCode;
  @override
  final int Nominal;
  @override
  final String Name;
  @override
  final double Value;
  @override
  final double Previous;

  @override
  String toString() {
    return 'Currency(ID: $ID, NumCode: $NumCode, CharCode: $CharCode, Nominal: $Nominal, Name: $Name, Value: $Value, Previous: $Previous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Currency &&
            (identical(other.ID, ID) || other.ID == ID) &&
            (identical(other.NumCode, NumCode) || other.NumCode == NumCode) &&
            (identical(other.CharCode, CharCode) ||
                other.CharCode == CharCode) &&
            (identical(other.Nominal, Nominal) || other.Nominal == Nominal) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Value, Value) || other.Value == Value) &&
            (identical(other.Previous, Previous) ||
                other.Previous == Previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, ID, NumCode, CharCode, Nominal, Name, Value, Previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      __$$_CurrencyCopyWithImpl<_$_Currency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {required final String ID,
      required final String NumCode,
      required final String CharCode,
      required final int Nominal,
      required final String Name,
      required final double Value,
      required final double Previous}) = _$_Currency;

  factory _Currency.fromJson(Map<String, dynamic> json) = _$_Currency.fromJson;

  @override
  String get ID;
  @override
  String get NumCode;
  @override
  String get CharCode;
  @override
  int get Nominal;
  @override
  String get Name;
  @override
  double get Value;
  @override
  double get Previous;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      throw _privateConstructorUsedError;
}
