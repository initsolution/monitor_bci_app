import 'package:go_router/go_router.dart';
import 'package:monitor_bci_app/model/todo.dart';
import 'package:monitor_bci_app/screen/home_screen.dart';
import 'package:monitor_bci_app/screen/todo_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'todo',
            name: 'todo',
            builder: (context, state) =>
                TodoScreen(todo: (state.extra as Todo)),
          ),
        ]),
  ],
);
