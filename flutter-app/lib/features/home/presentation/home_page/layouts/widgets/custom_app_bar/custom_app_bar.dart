import 'package:auto_route/auto_route.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/custom_app_bar/providers/image_provider_impl.dart';
import 'package:provider/provider.dart';
import '../buttons/home_button/home_button.dart';
import '../clockBox/clock_box.dart';
import '../logo_image/logo_image.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final Function()? onTap;
  final Function()? goHome;
  final Color colorAppbar;
  final Color colorClockBox;

  const CustomAppBar(
      {super.key,
      this.isHome = false,
      this.onTap,
      this.goHome,
      required this.colorAppbar,
      required this.colorClockBox});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: colorAppbar,
        child: Padding(
          padding: context.style.padding.medium,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      if (!isHome)
                        HomeButton(
                          goHome: goHome ?? () => context.router.pop(),
                        ),
                      const SizedBox(width: 8),
                      IconButton(icon: CountryFlag.fromCountryCode("RU", width: 70), onPressed: () {  },),
                      const SizedBox(width: 8),
                      IconButton(icon: CountryFlag.fromCountryCode("US", width: 70), onPressed: () {  },),
                      const SizedBox(width: 8),
                      IconButton(icon: CountryFlag.fromCountryCode("CN", width: 70), onPressed: () {  },),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: LogoImage(
                    imageProvider: context.watch<ImageProviderImpl>(),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ClockBox(color: colorClockBox),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 150);
}
