import 'package:get/get.dart';

class HomePageController extends GetxController {
  var tasks = <String>[].obs;

  void addTask(String task) {
    tasks.add(task);
  }

  void editTask(int index, String newTask) {
    tasks[index] = newTask;
    tasks.refresh();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }
}
