import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_provider.dart';
import 'task_model.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {

  String taskName;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text("Enter Task"))
            ,
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                this.taskName = value;
              },
            ),
            Checkbox(
            value: this.isCompleted, 
              onChanged: (value) {
                this.isCompleted = !this.isCompleted;
                setState(() {});
              },
            ),
            RaisedButton(
                child: Text('add Task'),
                onPressed: () {
                 Provider.of<AppProvider>(context, listen: false).insertTask(Task(this.taskName, this.isCompleted));
                 Navigator.pop(context);
                })
          ],
        ),
      ),
    );

  }
}
