
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reserved_member.freezed.dart';
part 'reserved_member.g.dart';

@freezed
abstract class ReservedMember with _$ReservedMember {
  const factory ReservedMember({
    required String credentials,
    required int count
  }) = _ReservedMember;

  factory ReservedMember.fromJson(Map<String, dynamic> json) =>
      _$ReservedMemberFromJson(json);
}