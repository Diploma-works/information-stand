import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({
    Key? key,
    required this.text,
    required this.pickColor, required this.onColorChanged,
  }) : super(key: key);

  final Function(Color color) onColorChanged;
  final String text;
  final Color pickColor;

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  late Color pickColor;
  late Color mainColor;
  TextEditingController hexController = TextEditingController();
  Color? tempColor; // Временная переменная
  @override
  void initState() {
    pickColor = widget.pickColor;
    mainColor = widget.pickColor;
    super.initState();
  }

  void pickerColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        tempColor = pickColor;
        return AlertDialog(
          title: Text('Выберите цвет',style: context.style.text.smallBold,),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [ColorPicker(
                  hexInputController: hexController,
                  pickerColor: tempColor ?? pickColor,
                  onColorChanged: (Color color) {
                    setState(() {
                      tempColor = color;
                    });
                  },
                  colorPickerWidth: 300.0,
                  pickerAreaHeightPercent: 0.7,
                  enableAlpha: true,
                ),
                  context.style.padding.h.medium,
                  TextField(
                    controller: hexController,
                    onChanged: (String value) {
                      if (value.isNotEmpty && value.length >= 7) {
                        setState(() {
                          pickColor = Color(int.parse(value.substring(1), radix: 16) + 0xFF000000);
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'HEX',
                    ),
                  ),
                ]
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  pickColor = mainColor;
                });
                widget.onColorChanged(pickColor);
              },
              child: Text('Вернуть стандартный',style: context.style.text.smallBold,),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                tempColor = null;
              },
              child: Text('Отмена',style: context.style.text.smallBold,),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  if (tempColor != null) {
                    pickColor = tempColor!;
                  }
                });
                widget.onColorChanged(pickColor);
                tempColor = null; // Сброс временного цвета при подтверждении
              },
              child: Text('Подтвердить',style: context.style.text.smallBold,),
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(widget.text, style: context.style.text.smallBold,),
        ),
        InkWell(
          onTap: pickerColor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: pickColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

