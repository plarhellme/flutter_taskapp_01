// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter_taskapp_01/models/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<List<Task>> getAllTask() async {
    
    final data = await supabase.from('task_db').select('*');

    return data.map((e) => Task.fromJson(e)).toList();
  }

  Future<String?> uploadFileToBucket(File file) async {
    final newFileName = '${DateTime.now()}_${file.path.split('/').last}';

    await supabase.storage.from('task_bk').upload(newFileName, file);

    return supabase.storage.from('task_bk').getPublicUrl(newFileName);
  }

  Future<void> insertTask(Task task) async {
    await supabase.from('task_db').insert(task.toJson());
  }

  Future<void> deleteFileFromBucket(String task_image_url) async {
    final fileName = task_image_url.split('/').last;

    await supabase.storage.from('task_bk').remove([fileName]);
  }

  Future<void> updateTask(String id, Task task) async {
    await supabase.from('task_db').update(task.toJson()).eq('id', id);
  }

  Future<void> deleteTask(String id) async {
    await supabase.from('task_db').delete().eq('id', id);
  }
}