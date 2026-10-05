import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Todo extends StatefulWidget {
  Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
   TextEditingController addtodo = TextEditingController();
  // List<bool> isChecked = [];
  // List<String> newTasks = [];

  @override
  Widget build(BuildContext context) {
    var todoProvider = context.watch<ToDoLogic>();
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 242, 244, 242),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
               SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green,
                    ),
                    child:  Icon(
                      Icons.check,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 35,
                    ),
                  ),
                   Spacer(),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color:  Color.fromARGB(255, 224, 243, 224),
                    ),
                    child:  Icon(
                      Icons.light_mode_outlined,
                      color: Color.fromARGB(255, 51, 121, 53),
                      size: 25,
                    ),
                  ),
                ],
              ),
               Text(
                'My Todo',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
               Text(
                'Small steps, big progress 💚',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: addtodo,
                      decoration: InputDecoration(
                        hintText: 'Add a new todo...',
                        hintStyle:  TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(
                    width: 50,
                    height: 45,
                    child: MaterialButton(
                      onPressed: () {
                        if (addtodo.text.trim().isNotEmpty) {
                          context.read<ToDoLogic>().addNewTask(addtodo.text);
                          addtodo.clear();
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.green,
                      child:  Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
             SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Tasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                 Spacer(),
                  Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color:  Color.fromARGB(255, 211, 243, 211),
                    ),
                    child: Text(
                      '${todoProvider.newTasks.length} tasks',
                      style:  TextStyle(
                        color: Color.fromARGB(255, 57, 143, 59),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              ...todoProvider.newTasks.asMap().entries.map((entry) {
                int index = entry.key;
                return Container(
                  padding:  EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 210, 241, 211),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: todoProvider.isChecked[index],
                        onChanged: (newbool) {
                          context.read<ToDoLogic>().trueOrFalseChecker(index);
                        },
                      ),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            decoration: todoProvider.isChecked[index]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {

                          context.read<ToDoLogic>().deleteTask(index);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color:  Color.fromARGB(255, 249, 222, 220),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ),
                       SizedBox(width: 5),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ToDoLogic extends ChangeNotifier {
  List<bool> isChecked = [];
  List<String> newTasks = [];
  void addNewTask(String T) {
    {
      newTasks.add(T);
      isChecked.add(false);
      notifyListeners();
    }
  }

  void trueOrFalseChecker(int index) {
    isChecked[index] = !isChecked[index];
    notifyListeners();
  }

  void deleteTask(int index) {
    newTasks.removeAt(index);
    isChecked.removeAt(index);
    notifyListeners();
  }
}
