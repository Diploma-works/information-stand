import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ClockState with ChangeNotifier{


  String time = getCurrentTime();
  String date = getCurrentDate();

  Timer? timer;

  ClockState(){
    run();
  }


  void update(){

    String newTime = getCurrentTime();
    String newDate = getCurrentDate();
    if(time != newTime){
      time = newTime;
      notifyListeners();
    }
    if(date != newDate){
      date = newDate;
      notifyListeners();
    }

  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  ///Запускает часы
  void run(){

    timer = Timer.periodic(const Duration(microseconds: 500), (timer) {
      update();
    });

  }

  static String getCurrentTime(){
    return DateFormat('HH:mm', Platform.localeName).format(DateTime.now());
  }

  static String getCurrentDate(){
    return DateFormat('d MMMM yyyy', Platform.localeName).format(DateTime.now());
  }

}