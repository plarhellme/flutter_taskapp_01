// ignore_for_file: unused_import, sort_child_properties_last

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_taskapp_01/views/add_task_ui.dart';
import 'package:flutter_taskapp_01/services/supabase_service.dart';
import 'package:flutter_taskapp_01/models/task.dart';
import 'package:flutter_taskapp_01/views/config_task_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTaskUi extends StatefulWidget {
  const AllTaskUi({super.key});

  @override
  State<AllTaskUi> createState() => _AllTaskUiState();
}

class _AllTaskUiState extends State<AllTaskUi> {
  final service = SupabaseService();
  List<Task> tasks = [];
  void loadTasks() async {
    final data = await service.getAllTask();
    setState(() {
      tasks = data;
    });
  }

  @override
  void initState() {
    super.initState();

    loadTasks();
  }

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
        onPressed: () async {
          await Navigator.push(
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfigTaskUi(),
                        ),
                      );
                    },
                    title: Text(
                      'งาน:',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      'สถานะ: ${tasks[index].task_status == true ? 'เสร็จแล้ว' : 'ยังไม่เสร็จ'}',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                    trailing: Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                    leading: tasks[index].task_image_url == ''
                        ? Image.asset(
                            'assets/images/logo.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            tasks[index].task_image_url!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                    tileColor: index % 2 == 0
                        ? const Color.fromARGB(255, 209, 209, 209)
                        : const Color.fromARGB(255, 202, 255, 200),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
