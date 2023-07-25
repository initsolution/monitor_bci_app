import 'package:monitor_bci_app/model/todo.dart';

abstract class AppRepository {
  Future<List<Todo>> getAllTodos();
  Future<Todo> getTodoById();
}
