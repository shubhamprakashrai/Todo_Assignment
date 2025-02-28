import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/uiUtils/custom_textfiled.dart';
import 'package:todo_assignment/app/utils/app_colors.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
        backgroundColor: AppColors.purpleColors,
      ),
      body: Obx(
        () => controller.tasks.isEmpty
            ? const Center(
                child: Text(
                  'No tasks available',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  final taskData = controller.tasks[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        taskData["task"],
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: AppColors.green),
                            onPressed: () => _showEditTaskDialog(context, taskData["id"], taskData["task"]),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _confirmDelete(context, taskData["id"]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    _showTaskDialog(
      context: context,
      title: "Add Task",
      initialText: "",
      confirmText: "Add",
      onConfirm: (taskName) => controller.addTask(taskName),
    );
  }

  void _showEditTaskDialog(BuildContext context, String taskId, String currentTask) {
    _showTaskDialog(
      context: context,
      title: "Edit Task",
      initialText: currentTask,
      confirmText: "Update",
      onConfirm: (updatedTask) => controller.editTask(taskId, updatedTask),
    );
  }

  void _showTaskDialog({
    required BuildContext context,
    required String title,
    required String initialText,
    required String confirmText,
    required Function(String) onConfirm,
  }) {
    final TextEditingController taskController = TextEditingController(text: initialText);

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              CustomTextField(
                controller: taskController,
                hintText: title.contains("Edit") ? "Edit task name" : "Enter task name",
                prefixIcon: const Icon(Icons.task),
                onFieldSubmitted: (_) {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
                    child: const Text("Cancel", style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (taskController.text.isNotEmpty) {
                        onConfirm(taskController.text);
                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(confirmText, style: const TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String taskId) {
    Get.defaultDialog(
      title: "Delete Task",
      middleText: "Are you sure you want to delete this task?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        controller.deleteTask(taskId);
        Get.back();
      },
    );
  }
}
