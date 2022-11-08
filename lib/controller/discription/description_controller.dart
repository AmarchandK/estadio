import 'package:estadio/model/home/home_response.dart';
import 'package:get/state_manager.dart';

class DescriptionController extends GetxController {
  List<int> timings = [];
  List<String> morningList = [];
  List<String> afternoonList = [];
  List<String> evengingList = [];

  timesListAdd() {
    _timesListAddCore(timings[0], timings[1], morningList, '');
    _timesListAddCore(timings[2], timings[3], afternoonList, ' ');
    _timesListAddCore(timings[4], timings[5], evengingList, '  ');
  }

  _timesListAddCore(int from, int to, List addList, String space) {
    addList.clear();
    for (int i = from; i < to; i++) {
      addList.add("$space$i:00 - ${i + 1}:00");
    }
  }

  timeConversion(TurfTime turfTime) {
    timings.clear();
    timings.addAll([
      turfTime.timeMorningStart!,
      turfTime.timeMorningEnd!,
      turfTime.timeAfternoonStart!,
      turfTime.timeAfternoonEnd!,
      turfTime.timeEveningStart!,
      turfTime.timeEveningEnd!
    ]);
    for (int i = 0; i < timings.length; i++) {
      if (timings[i] > 12) {
        timings[i] = timings[i] - 12;
      }
    }
  }
}
