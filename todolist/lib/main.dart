import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(create: (context) => ToDoLogic(),
      
      
      

child:
    
    
     MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => Todo()},
    ));
  }
}
