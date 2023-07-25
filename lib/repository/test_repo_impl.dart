import 'dart:convert';

import 'package:monitor_bci_app/model/todo.dart';
import 'package:monitor_bci_app/repository/app_repo.dart';
import 'package:monitor_bci_app/utils/json_helper.dart';

class TestRepoImpl extends AppRepository {
  @override
  Future<List<Todo>> getAllTodos() async {
    try {
      final result = (jsonDecode(await loadJsonData('todo.json')) as List)
          .map((e) => Todo.fromMap(e))
          .toList();
      return result;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<Todo> getTodoById() {
    throw UnimplementedError();
  }
}
