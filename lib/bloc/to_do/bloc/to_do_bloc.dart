
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc_api/model/model.dart';
import 'package:to_do_bloc_api/service/api.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<ToDoEvent>((event, emit) {
      // TODO: implement event handler
    });



    on<FetchTodoEvent>((event, emit) async{
      emit(ToDoState(todoList: [],isLoading: true));
      final todos = await fetchTodo();

      emit(ToDoState(todoList: todos,isLoading: false));
      
    },);


    on<AddToEvent>((event, emit)async {
      emit(ToDoState(todoList: [],isAdding: true,isLoading: true));
      bool success = await addTodo(event.todo);
      final todos = await fetchTodo();
      if(success){
        emit(ToDoState(
          todoList:todos,
          isAdding: false,
          isLoading: false,
          isSuccess: success,
          message: "Added Successfully"
           ));
      }else{
        emit(ToDoState(
          todoList: todos,
          isAdding: false,
          isLoading: false,
          hasError: true,
          message: "Not Added"
          ));
      }
      
    },);


    on<DeleteToDoEvent>((event, emit)async {
      emit(ToDoState(todoList: state.todoList,isLoading: true));
      bool success = await deleteTodo(event.id);
      if(success){
        final todos=await fetchTodo();
        emit(ToDoState(
          todoList: todos,
          isAdding: false,
          isLoading: false,
          isSuccess: success,
          message: "Deleted Successfully"
          ));
      }else{
        emit(ToDoState(
          todoList: state.todoList,
          isAdding: false,
          isLoading: false,
          hasError: true,
          message: "Not Deleted"
          ));
      }
    },);



    on<CompleteToDoEvent>((event, emit)async {
      emit(ToDoState(todoList: state.todoList,isLoading: true));

      bool success=await completeTodo(event.id, event.isCompleted, event.todo);

      if(success){
        final todos = await fetchTodo();
        emit(ToDoState(
          todoList: todos,
          isAdding: false,
          isSuccess: true,
          message: "Go For the Dreams!"
          
          
          ));
      }else{
        emit(ToDoState(
          todoList:state.todoList,
          isLoading: false,
          hasError: true,
          message: "Something went wrong"
          
          
          ));
      }
      
    },);


    on<UpdatedToDoEvent>((event, emit)async {
      emit(ToDoState(todoList: state.todoList,isLoading: true));
      bool success = await updateTodo(event.id, event.title, event.description, event.isComplete);
      if(success){
        final todos = await fetchTodo();
        emit(ToDoState(
          todoList: todos,
          isLoading: false,
          isSuccess: success,
          message: "Updated Successfully"
          
          
          ));
      }else{
        emit(ToDoState(
          todoList: state.todoList,
          isLoading: false,
          isSuccess: true,
          message: "Something went wrong"
          
          ));
      }
      
    },);
  }
}
