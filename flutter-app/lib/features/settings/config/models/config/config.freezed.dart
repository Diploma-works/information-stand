// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  Layouts get layout => throw _privateConstructorUsedError;
  MainConfig get mainConfig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call({Layouts layout, MainConfig mainConfig});

  $MainConfigCopyWith<$Res> get mainConfig;
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layout = null,
    Object? mainConfig = null,
  }) {
    return _then(_value.copyWith(
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as Layouts,
      mainConfig: null == mainConfig
          ? _value.mainConfig
          : mainConfig // ignore: cast_nullable_to_non_nullable
              as MainConfig,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainConfigCopyWith<$Res> get mainConfig {
    return $MainConfigCopyWith<$Res>(_value.mainConfig, (value) {
      return _then(_value.copyWith(mainConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Layouts layout, MainConfig mainConfig});

  @override
  $MainConfigCopyWith<$Res> get mainConfig;
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$_Config>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layout = null,
    Object? mainConfig = null,
  }) {
    return _then(_$_Config(
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as Layouts,
      mainConfig: null == mainConfig
          ? _value.mainConfig
          : mainConfig // ignore: cast_nullable_to_non_nullable
              as MainConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Config implements _Config {
  const _$_Config({required this.layout, required this.mainConfig});

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  @override
  final Layouts layout;
  @override
  final MainConfig mainConfig;

  @override
  String toString() {
    return 'Config(layout: $layout, mainConfig: $mainConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.mainConfig, mainConfig) ||
                other.mainConfig == mainConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, layout, mainConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(
      this,
    );
  }
}

abstract class _Config implements Config {
  const factory _Config(
      {required final Layouts layout,
      required final MainConfig mainConfig}) = _$_Config;

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  Layouts get layout;
  @override
  MainConfig get mainConfig;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}
