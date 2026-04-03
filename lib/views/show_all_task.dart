// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_taskapp_01/views/add_task_ui.dart';

class AllTaskUi extends StatefulWidget {
  const AllTaskUi({super.key});

  @override
  State<AllTaskUi> createState() => _AllTaskUiState();
}

class _AllTaskUiState extends State<AllTaskUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Task',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskUi()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
