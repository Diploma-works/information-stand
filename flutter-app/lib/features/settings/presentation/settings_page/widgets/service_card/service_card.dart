import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.isActive,
    required this.name,
    required this.logo,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String logo;
  final Function() onTap;
  final bool isActive;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  double height = 0.0;
  double width = 0.0;
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      height = _globalKey.currentContext?.size?.height ?? 50;
      height = _globalKey.currentContext?.size?.width ?? 50;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (widget.isActive)
          ? context.style.color.enable
          : context.style.color.disable,
      borderRadius: context.style.border.medium,
      child: InkWell(
        borderRadius: context.style.border.medium,
        onTap: widget.onTap,
        child: Container(
          key: _globalKey,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: context.style.padding.medium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    widget.logo,
                    width: height,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: AutoSizeText(
                        widget.name,
                        maxFontSize: (context.style.text.medium.fontSize??11),
                        minFontSize: (context.style.text.medium.fontSize??11)-5,
                        style: context.style.text.large,
                        maxLines: 2,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
