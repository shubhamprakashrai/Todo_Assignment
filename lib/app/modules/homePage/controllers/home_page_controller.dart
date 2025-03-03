import 'package:get/get.dart';
import 'package:todo_assignment/app/modules/homePage/repostory/firebase_service.dart';
import 'package:todo_assignment/app/utils/custom_snackbar.dart';


class HomePageController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  var tasks = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void fetchTasks() {
    _firebaseService.getTasks().listen((taskList) {
      tasks.assignAll(taskList);
    });
  }

 Future<void> addTask(String task) async {
  try {
    await _firebaseService.addTask(task);
    showCustomSnackBar(
      title: "Success",
      message: "Task added successfully!",
      isError: false,
    );
  } catch (e) {
    showCustomSnackBar(
      title: "Error",
      message: "Failed to add task. Please try again.",
      isError: true,
    );
  }
}

Future<void> editTask(String taskId, String newTask) async {
  try {
    await _firebaseService.updateTask(taskId, newTask);
    showCustomSnackBar(
      title: "Success",
      message: "Task updated successfully!",
      isError: false,
    );
  } catch (e) {
    showCustomSnackBar(
      title: "Error",
      message: "Failed to update task. Please try again.",
      isError: true,
    );
  }
}

Future<void> deleteTask(String taskId) async {
  try {
    await _firebaseService.deleteTask(taskId);
    showCustomSnackBar(
      title: "Success",
      message: "Task deleted successfully!",
      isError: false,
    );
  } catch (e) {
    showCustomSnackBar(
      title: "Error",
      message: "Failed to delete task. Please try again.",
      isError: true,
    );
  }
}

}
