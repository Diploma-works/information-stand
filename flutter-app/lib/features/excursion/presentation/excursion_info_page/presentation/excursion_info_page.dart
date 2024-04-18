import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/excursion/models/excursion.dart';
import 'package:information_stand/features/excursion/presentation/excursion_info_page/services/excursion_info_service/excursion_info_service_interface.dart';
import 'package:information_stand/features/excursion/presentation/excursion_info_page/state/excursion_info_state/excursion_info_state.dart';
import 'package:information_stand/features/home/presentation/home_page/layouts/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:information_stand/global/di.dart';
import 'package:information_stand/ui/theme/app_theme/app_theme.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ExcursionInfoPage extends StatefulWidget {
  final Excursion excursion;
  final Function(Excursion) refresh;

  const ExcursionInfoPage(
      {super.key, required this.excursion, required this.refresh});

  @override
  State<ExcursionInfoPage> createState() => _ExcursionInfoPageState();
}

class _ExcursionInfoPageState extends State<ExcursionInfoPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ExcursionInfoState(
            getIt<ExcursionInfoServiceInterface>(), getIt<Logger>()),
        builder: (context, child) {
          final state = context.read<ExcursionInfoState>();
          return Scaffold(
              appBar: CustomAppBar(
                isHome: false,
                colorAppbar: context
                    .watch<AppThemeState>()
                    .style
                    .mainLayout
                    .color
                    .appBar,
                colorClockBox: context.style.mainLayout.color.clock,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(
                                  base64Decode(widget.excursion.base64Image)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16.0,
                          right: 16.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(72, 66, 59, 1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              widget.excursion.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(72, 66, 59, 1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Рейтинг ${widget.excursion.rating} / 5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16.0,
                          left: 16.0,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Positioned(
                            bottom: 16.0,
                            right: 16.0,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Бронирование экскурсии'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: TextField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                  labelText: 'ФИО'),
                                            ),
                                          ),
                                          TextField(
                                            controller: countController,
                                            decoration: InputDecoration(
                                                labelText: 'Количество мест'),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Отмена'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            final credentials =
                                                nameController.text;
                                            final count = int.tryParse(
                                                    countController.text) ??
                                                0;
                                            final excursion =
                                                await state.reservation(
                                                    widget.excursion.id,
                                                    credentials,
                                                    count);
                                            widget.refresh(excursion!);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Забронировать'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  'Забронировать',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Место проведения: ${widget.excursion.location}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Длительность: ${widget.excursion.duration} минут',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Стоимость: ${widget.excursion.cost.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Время начала: ${widget.excursion.startTime}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Количество свободных мест: ${widget.excursion.maxParticipants - widget.excursion.reservedMembers.length}/${widget.excursion.maxParticipants}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Описание',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  widget.excursion.description,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        });
  }
}
