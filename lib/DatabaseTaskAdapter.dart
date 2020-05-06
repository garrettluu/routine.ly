abstract class DatabaseTaskAdapter {
  getTaskList();
  deleteTask(String id);
  createTask({String name, String time, DateTime due});
  updateTask(String name, String time, DateTime due, String id);
}