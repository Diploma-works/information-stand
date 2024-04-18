
import 'package:information_stand/features/excursion/models/excursion.dart';

abstract interface class ExcursionInfoServiceInterface {

  Future<Excursion?> reservation(int excursionId, String credentials, int count);

}