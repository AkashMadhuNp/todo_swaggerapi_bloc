import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc_api/bloc/to_do/bloc/to_do_bloc.dart';
import 'package:to_do_bloc_api/screen/splash/splash_screen.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ToDoBloc(),)
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        home:const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}