part of 'to_do_bloc.dart';


abstract class ToDoEvent {}

class FetchTodoEvent extends ToDoEvent{}


class AddToEvent extends ToDoEvent{
  TodoModel todo;
  AddToEvent({
    required this.todo
  });
  
}


class DeleteToDoEvent extends ToDoEvent{
  String id;
  DeleteToDoEvent({
    required this.id
  });
  
}


class CompleteToDoEvent extends ToDoEvent{
  String id;
  bool isCompleted;
  TodoModel todo;

  CompleteToDoEvent({
    required this.id,
    required this.isCompleted,
    required this.todo
  });
}


class UpdatedToDoEvent extends ToDoEvent{
  String id;
  String title;
  String description;
  bool isComplete;

  UpdatedToDoEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.isComplete
  });
}