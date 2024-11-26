import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_bloc_api/bloc/to_do/bloc/to_do_bloc.dart';
import 'package:to_do_bloc_api/model/model.dart';
import 'package:to_do_bloc_api/screen/addScreen/add_screen.dart';
import 'package:to_do_bloc_api/screen/editscreen/edit_screen.dart';
import 'package:to_do_bloc_api/screen/home/widget/top_part.dart';
import 'package:to_do_bloc_api/screen/view/view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    context.read<ToDoBloc>().add(FetchTodoEvent());
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
          
              Color.fromARGB(255, 15, 5, 55),
               Color.fromARGB(255, 6, 37, 90),
               Color.fromARGB(255, 18, 7, 57), 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                                  colors: [
                                
                                 Color.fromARGB(255, 15, 5, 55),
                                 Color.fromARGB(255, 6, 37, 90),
                                 Color.fromARGB(255, 18, 7, 57),
                                    
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                            

                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient:const LinearGradient(
                                  colors: [
                                
                                    
                                    Color.fromARGB(232, 4, 151, 236),
                                    Color.fromARGB(119, 7, 131, 198), 
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                            
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 42),
                          const Center(
                            child:  Text(
                              "Tasks - ToDo",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient:const LinearGradient(
                                  colors: [
                                
                                    
                                    Color.fromARGB(232, 4, 151, 236),
                                    Color.fromARGB(119, 7, 131, 198), 
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                            

                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.read<ToDoBloc>().add(FetchTodoEvent());
                          },
                          icon: const Icon(
                            Icons.refresh_rounded,
                            color: Colors.white,
                          ),
                          tooltip: 'Refresh Tasks',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const TopPart(),

              Expanded(

                child:BlocConsumer<ToDoBloc,ToDoState>(
                  

                  listenWhen: (previous, current)=> current.hasError || current.isSuccess,
                  
                  listener: (context, state) {

                    if(state.hasError || state.isSuccess){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:Text(state.message),
                        backgroundColor: Colors.white,
                         ));
                    }

                    
                    
                  },

                  builder: (context, state) {
                    if(state.isLoading){
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }else if(state.todoList.isEmpty){
                      return const Center(
                        child: Text("No ToDo's in planning!"),
                      );
                    }else{
                        return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 15, 5, 55),
            Color.fromARGB(255, 6, 37, 90),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: state.todoList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 6, 
              horizontal: 4
              ),
            decoration: BoxDecoration(
              gradient:state.todoList[index].isCompleted
              
               ?const LinearGradient(
                colors: [
                  Color.fromARGB(232, 4, 151, 236),
                  Color.fromARGB(119, 7, 131, 198),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )  : const LinearGradient(colors: [
                Colors.red,
                 Color.fromARGB(232, 4, 151, 236),
                  Color.fromARGB(119, 7, 131, 198),
              
              ]),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  ViewToDoScreen(todo: state.todoList[index],)),
                );
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              title: Text(
                state.todoList[index].title,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: 
                       Colors.white,
                                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  DateFormat('yMMMd').format(DateTime.now()),
                  style: const TextStyle(
                          color:  Colors.white70,
                          fontWeight: FontWeight.bold
                   
                  ),
                ),
              ),
              leading: GestureDetector(
                onTap: () {
                  bool status = !state.todoList[index].isCompleted;
                  context.read<ToDoBloc>().add(
                    CompleteToDoEvent(
                      id: state.todoList[index].id!, 
                      isCompleted: status, 
                      todo: state.todoList[index])
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:Colors.white, 
                        
                        
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: state.todoList[index].isCompleted ? 
                  const Icon(
                     Icons.check_circle,
                     color: Colors.green,
                         
                  ):
                 const Icon(
                    Icons.cancel_presentation_sharp,
                    color: Colors.red,
                    ),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditScreen(todo: state.todoList[index],)),
                      );
                    },
                  ),
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                     
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Task'),
                          content: const Text('Are you sure you want to delete this task?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<ToDoBloc>().add(DeleteToDoEvent(id: state.todoList[index].id!));
                                Navigator.pop(context);
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
                      

                    }
                    
                  },
                  
                  )),
              
              
              
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 118, 84, 211), Color(0xFF448AFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddScreen(),));
          },
          icon: const Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),
          label: const Text(
            "Add Task",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
