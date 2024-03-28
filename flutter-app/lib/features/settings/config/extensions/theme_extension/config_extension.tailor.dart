// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'config_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ConfigExtensionTailorMixin on ThemeExtension<ConfigExtension> {
  Config get config;

  @override
  ConfigExtension copyWith({
    Config? config,
  }) {
    return ConfigExtension(
      config: config ?? this.config,
    );
  }

  @override
  ConfigExtension lerp(
      covariant ThemeExtension<ConfigExtension>? other, double t) {
    if (other is! ConfigExtension) return this as ConfigExtension;
    return ConfigExtension(
      config: t < 0.5 ? config : other.config,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfigExtension &&
            const DeepCollectionEquality().equals(config, other.config));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(config),
    );
  }
}

extension ConfigExtensionBuildContextProps on BuildContext {
  ConfigExtension get configExtension =>
      Theme.of(this).extension<ConfigExtension>()!;
  Config get config => configExtension.config;
}
