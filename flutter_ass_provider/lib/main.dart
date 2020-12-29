
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SplashScreen.dart';
import 'app_provider.dart';
import 'new_task.dart';
import 'task_model.dart';
import 'task_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { 
        return AppProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  //   User user;
  // HomePage(this.user);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer( child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text("G")),
                  accountName: Text("Ghadeer"),
                  accountEmail: Text("Ghadeer@gmailcom")

                ),
                
         
            ],
        ),),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Todo'),
        bottom: TabBar(
          controller: tabController,
          tabs: [Tab(text: 'All Tasks'),Tab(text: 'Completed Tasks'),Tab(text: 'Incompleted Tasks'),],
          isScrollable: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [AllTasks(),CompletedTasks(),IncompletedTasks()],
            ),
          ),
                 Container(
                 margin:EdgeInsets.only(bottom: 20),
                
                 child: FloatingActionButton(
                 child:Icon(Icons.add ),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return NewTask();
                        },
                    ));

        }),
        
      ) ])

    );
  }
}


class AllTasks extends StatefulWidget { 
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
    void fun() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {  
    return Container(
      child: ListView.builder(
        itemCount: context.watch<AppProvider>().getValue().length,
        itemBuilder: (context, index) {
          Task task = context.watch<AppProvider>().getValue()[index];
          return TaskWidget(task, fun);
        },
      ),
    );
  }

}

class CompletedTasks extends StatefulWidget {
  @override
  _CompletedTasksState createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {

   void fun(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: context.watch<AppProvider>().getValue().length,
        itemBuilder: (context, index){
          Task task = context.watch<AppProvider>().getValue()[index];
          if(task.isCompleted){
            return TaskWidget(task, fun);
          }else{
            return Container();
          }
        },
      ),
    );
  }
 
}

class IncompletedTasks extends StatefulWidget {
  @override
  _IncompletedTasksState createState() => _IncompletedTasksState();
}

class _IncompletedTasksState extends State<IncompletedTasks> {
   void fun(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: context.watch<AppProvider>().getValue().length,
        itemBuilder: (context, index){
          Task task = context.watch<AppProvider>().getValue()[index];
          if(!task.isCompleted){
            return TaskWidget(task, fun);
          }else{
            return Container();
          }
        },
      ))
      ;
    
  }
 
}
