// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reserved_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReservedMember _$ReservedMemberFromJson(Map<String, dynamic> json) {
  return _ReservedMember.fromJson(json);
}

/// @nodoc
mixin _$ReservedMember {
  String get credentials => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservedMemberCopyWith<ReservedMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservedMemberCopyWith<$Res> {
  factory $ReservedMemberCopyWith(
          ReservedMember value, $Res Function(ReservedMember) then) =
      _$ReservedMemberCopyWithImpl<$Res, ReservedMember>;
  @useResult
  $Res call({String credentials, int count});
}

/// @nodoc
class _$ReservedMemberCopyWithImpl<$Res, $Val extends ReservedMember>
    implements $ReservedMemberCopyWith<$Res> {
  _$ReservedMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      credentials: null == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservedMemberCopyWith<$Res>
    implements $ReservedMemberCopyWith<$Res> {
  factory _$$_ReservedMemberCopyWith(
          _$_ReservedMember value, $Res Function(_$_ReservedMember) then) =
      __$$_ReservedMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String credentials, int count});
}

/// @nodoc
class __$$_ReservedMemberCopyWithImpl<$Res>
    extends _$ReservedMemberCopyWithImpl<$Res, _$_ReservedMember>
    implements _$$_ReservedMemberCopyWith<$Res> {
  __$$_ReservedMemberCopyWithImpl(
      _$_ReservedMember _value, $Res Function(_$_ReservedMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = null,
    Object? count = null,
  }) {
    return _then(_$_ReservedMember(
      credentials: null == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReservedMember implements _ReservedMember {
  const _$_ReservedMember({required this.credentials, required this.count});

  factory _$_ReservedMember.fromJson(Map<String, dynamic> json) =>
      _$$_ReservedMemberFromJson(json);

  @override
  final String credentials;
  @override
  final int count;

  @override
  String toString() {
    return 'ReservedMember(credentials: $credentials, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservedMember &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, credentials, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservedMemberCopyWith<_$_ReservedMember> get copyWith =>
      __$$_ReservedMemberCopyWithImpl<_$_ReservedMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservedMemberToJson(
      this,
    );
  }
}

abstract class _ReservedMember implements ReservedMember {
  const factory _ReservedMember(
      {required final String credentials,
      required final int count}) = _$_ReservedMember;

  factory _ReservedMember.fromJson(Map<String, dynamic> json) =
      _$_ReservedMember.fromJson;

  @override
  String get credentials;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_ReservedMemberCopyWith<_$_ReservedMember> get copyWith =>
      throw _privateConstructorUsedError;
}
