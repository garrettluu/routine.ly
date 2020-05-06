abstract class DatabaseTaskAdapter {
  getTaskList();
  deleteTask(String id);
  createTask({String name, int time, DateTime due});
  updateTask(String name, int time, DateTime due, String id);
}