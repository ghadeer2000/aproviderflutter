import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';
import 'db_helper.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AppProvider>(
        builder: (context, value, child) {
          var tasks = value.getTasksFromDB(DBHelper.dbHelper.getAllTasks(), mFun);
          value.setValue(tasks);
            Future.delayed(Duration.zero, () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage()),
              );
            });
          return Container(); 
        },
      )
    );
  }
  void mFun() {
    setState(() {});
  }
}

