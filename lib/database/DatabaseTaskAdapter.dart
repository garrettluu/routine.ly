abstract class DatabaseTaskAdapter {
  getTaskList(String userId);
  deleteTask(String id);
  createTask({String name, int time, DateTime due, String userId});
  updateTask(String name, int time, DateTime due, String id);
}
