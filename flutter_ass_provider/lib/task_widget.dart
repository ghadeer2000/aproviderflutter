import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_provider.dart';
import 'task_model.dart';

class TaskWidget extends StatefulWidget {

  final Task task;
  final Function function;
  TaskWidget(this.task, [this.function]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
        return Card(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                IconButton(icon: Icon(Icons.delete), onPressed: (){
                showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(title: Text("Alert")
                ,content: Text(" You Will Delete A task, are you sure?"),
                actions: <Widget>[
                FlatButton(child: Text("Ok"), onPressed:() {
                Provider.of<AppProvider>(context, listen: false).deleteTask(widget.task);
                  setState(() {});
                  widget.function();
                   Navigator.of(context).pop();
                }
                ),
                FlatButton(child: Text("No"), onPressed:(){
                  Navigator.of(context).pop();

                }
                )]);
              });


            }),

            Text(widget.task.taskName),
            Checkbox(
              value: widget.task.isCompleted,
              onChanged: (value) {
                widget.task.isCompleted = !widget.task.isCompleted;
                Provider.of<AppProvider>(context, listen: false).updateTask(widget.task);
                setState(() {});
                widget.function();
              }
            ),
          ],
        ),
      ),
    ); 
  }




  }

  
 
   