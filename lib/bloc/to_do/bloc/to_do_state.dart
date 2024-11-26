part of 'to_do_bloc.dart';

class ToDoState{
  final List<TodoModel> todoList;
  final bool isLoading;
  final bool isAdding;
  final bool isSuccess;
  final bool hasError;
  final String message;

  ToDoState({
    required this.todoList, 
     this.isLoading = false, 
     this.isAdding=false, 
     this.isSuccess=false,
      this.hasError=false, 
      this.message=""
     
     });

}

final class ToDoInitial extends ToDoState{
  ToDoInitial():super(todoList: []);

}




