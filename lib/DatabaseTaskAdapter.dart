abstract class DatabaseTaskAdapter {
  getTaskList();
  deleteTask(String id);
  createTask({String name, String time, String due});
  updateTask(String name, String time, String due, String id);
}