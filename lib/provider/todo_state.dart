import 'package:equatable/equatable.dart';
import 'package:monitor_bci_app/model/todo.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  TodoLoaded({required this.todos});

  @override
  List<Object?> get props => [todos];
}

class TodoLoadedWithError extends TodoState {
  final String message;
  TodoLoadedWithError({required this.message});

  @override
  List<Object?> get props => [message];
}
