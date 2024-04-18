import 'dart:convert';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/app/routes/app_router.dart';
import 'package:information_stand/features/excursion/models/excursion.dart';
import 'package:information_stand/features/excursion/state/excursion_state/excursion_state.dart';

class ExcursionGrid extends StatelessWidget {
  final List<Excursion> excursions;
  final ExcursionState state;

  ExcursionGrid({required this.excursions, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
      ),
      itemCount: excursions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.memory(
                      base64Decode(excursions[index].base64Image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          excursions[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.router.push(ExcursionInfoRoute(
                                excursion: excursions[index],
                                refresh: state.refreshExcursion));
                          },
                          child: Text(
                            "Подробнее",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(141, 140, 130, 1.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
