// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'main_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin  _$MainThemeTailorMixin on ThemeExtension<MainAppExtension> {
  Style get style;

  @override
  MainAppExtension copyWith({
    Style? style,
  }) {
    return MainAppExtension(
      style: style ?? this.style,
    );
  }

  @override
  MainAppExtension lerp(covariant ThemeExtension<MainAppExtension>? other, double t) {
    if (other is! MainAppExtension) return this as MainAppExtension;
    return MainAppExtension(
      style: t < 0.5 ? style : other.style,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainAppExtension &&
            const DeepCollectionEquality().equals(style, other.style));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(style),
    );
  }
}

extension MainThemeBuildContextProps on BuildContext {
  MainAppExtension get mainTheme => Theme.of(this).extension<MainAppExtension>()!;
  Style get style => mainTheme.style;
}
