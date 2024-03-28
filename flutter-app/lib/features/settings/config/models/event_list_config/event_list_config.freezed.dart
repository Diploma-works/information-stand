// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_list_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventListConfig _$EventListConfigFromJson(Map<String, dynamic> json) {
  return _EventListConfig.fromJson(json);
}

/// @nodoc
mixin _$EventListConfig {
  bool get hideEventName => throw _privateConstructorUsedError;
  bool get showOnlyOrganize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventListConfigCopyWith<EventListConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventListConfigCopyWith<$Res> {
  factory $EventListConfigCopyWith(
          EventListConfig value, $Res Function(EventListConfig) then) =
      _$EventListConfigCopyWithImpl<$Res, EventListConfig>;
  @useResult
  $Res call({bool hideEventName, bool showOnlyOrganize});
}

/// @nodoc
class _$EventListConfigCopyWithImpl<$Res, $Val extends EventListConfig>
    implements $EventListConfigCopyWith<$Res> {
  _$EventListConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideEventName = null,
    Object? showOnlyOrganize = null,
  }) {
    return _then(_value.copyWith(
      hideEventName: null == hideEventName
          ? _value.hideEventName
          : hideEventName // ignore: cast_nullable_to_non_nullable
              as bool,
      showOnlyOrganize: null == showOnlyOrganize
          ? _value.showOnlyOrganize
          : showOnlyOrganize // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventListConfigCopyWith<$Res>
    implements $EventListConfigCopyWith<$Res> {
  factory _$$_EventListConfigCopyWith(
          _$_EventListConfig value, $Res Function(_$_EventListConfig) then) =
      __$$_EventListConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hideEventName, bool showOnlyOrganize});
}

/// @nodoc
class __$$_EventListConfigCopyWithImpl<$Res>
    extends _$EventListConfigCopyWithImpl<$Res, _$_EventListConfig>
    implements _$$_EventListConfigCopyWith<$Res> {
  __$$_EventListConfigCopyWithImpl(
      _$_EventListConfig _value, $Res Function(_$_EventListConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideEventName = null,
    Object? showOnlyOrganize = null,
  }) {
    return _then(_$_EventListConfig(
      hideEventName: null == hideEventName
          ? _value.hideEventName
          : hideEventName // ignore: cast_nullable_to_non_nullable
              as bool,
      showOnlyOrganize: null == showOnlyOrganize
          ? _value.showOnlyOrganize
          : showOnlyOrganize // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventListConfig implements _EventListConfig {
  const _$_EventListConfig(
      {required this.hideEventName, required this.showOnlyOrganize});

  factory _$_EventListConfig.fromJson(Map<String, dynamic> json) =>
      _$$_EventListConfigFromJson(json);

  @override
  final bool hideEventName;
  @override
  final bool showOnlyOrganize;

  @override
  String toString() {
    return 'EventListConfig(hideEventName: $hideEventName, showOnlyOrganize: $showOnlyOrganize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventListConfig &&
            (identical(other.hideEventName, hideEventName) ||
                other.hideEventName == hideEventName) &&
            (identical(other.showOnlyOrganize, showOnlyOrganize) ||
                other.showOnlyOrganize == showOnlyOrganize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hideEventName, showOnlyOrganize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventListConfigCopyWith<_$_EventListConfig> get copyWith =>
      __$$_EventListConfigCopyWithImpl<_$_EventListConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventListConfigToJson(
      this,
    );
  }
}

abstract class _EventListConfig implements EventListConfig {
  const factory _EventListConfig(
      {required final bool hideEventName,
      required final bool showOnlyOrganize}) = _$_EventListConfig;

  factory _EventListConfig.fromJson(Map<String, dynamic> json) =
      _$_EventListConfig.fromJson;

  @override
  bool get hideEventName;
  @override
  bool get showOnlyOrganize;
  @override
  @JsonKey(ignore: true)
  _$$_EventListConfigCopyWith<_$_EventListConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
