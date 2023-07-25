import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_bci_app/provider/todo_state.dart';
import 'package:monitor_bci_app/repository/app_repo.dart';
import 'package:monitor_bci_app/repository/test_repo_impl.dart';

final todoNotifierProvider =
    AutoDisposeNotifierProvider<TodoNotifier, TodoState>(
  () {
    return TodoNotifier(repository: TestRepoImpl());
  },
);

class TodoNotifier extends AutoDisposeNotifier<TodoState> {
  final AppRepository repository;
  TodoNotifier({required this.repository});

  @override
  TodoState build() {
    return TodoInitial();
  }

  getAllTodos() async {
    state = TodoLoading();
    try {
      final todos = await repository.getAllTodos();
      state = TodoLoaded(todos: todos);
    } on Exception catch (e) {
      state = TodoLoadedWithError(message: e.toString());
    }
  }
}
