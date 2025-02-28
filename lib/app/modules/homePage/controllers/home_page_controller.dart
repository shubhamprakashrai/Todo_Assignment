import 'package:get/get.dart';
import 'package:todo_assignment/app/modules/homePage/repostory/firebase_service.dart';


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
    await _firebaseService.addTask(task);
  }

  Future<void> editTask(String taskId, String newTask) async {
    await _firebaseService.updateTask(taskId, newTask);
  }

  Future<void> deleteTask(String taskId) async {
    await _firebaseService.deleteTask(taskId);
  }
}
