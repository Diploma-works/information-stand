import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '/ui/theme/extensions/main_theme/main_theme_extension.dart';


class InfoContainer extends StatelessWidget {
  final List<Widget> list;
  final String widgetName;
  final bool enable;
  const InfoContainer({super.key,this.widgetName = '',required this.list, this.enable = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widgetName.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 25,bottom: 5),
            child: AutoSizeText(widgetName.toUpperCase(), style: context.style.text.greyCaps),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: context.style.border.medium,
              color: enable == true ? context.style.color.foreground
              : context.style.color.disableContainer,
            ),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, int index){
              return Column(
                children: [
                  list[index],
                  if (list.length-1 != index) const Divider()
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
