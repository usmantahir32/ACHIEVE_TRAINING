import 'package:get/get.dart';

class WorkoutCont extends GetxController {
  RxBool isFirst = true.obs;
  RxInt selectedprogram = 3.obs;
  final DateTime _now = DateTime.now();
  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<DateTime> currentDate = Rxn<DateTime>();
  RxInt selectedPage = 0.obs;

  //For youtube video
  RxInt selectedIndex = (-1).obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  @override
  void onInit() {
    super.onInit();
    currentDate.value = DateTime(_now.year, _now.month, _now.day);
    // selectedDate.value = DateTime(_now.year, _now.month, _now.day);
    selectedDate.value = DateTime(2023, 10, 28);

  }
}
