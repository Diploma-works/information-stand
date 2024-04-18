import 'package:information_stand/features/excursion/models/excursion.dart';

abstract interface class ExcursionServiceInterface {

  Future<List<Excursion>?> getExcursions();

  Future<Excursion?> reservation(int excursionId, String credentials, int count);


}