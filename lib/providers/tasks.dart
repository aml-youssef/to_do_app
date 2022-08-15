import 'package:flutter/material.dart';

import '../models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/task_database.dart';

class Tasks extends StateNotifier<List<Task>> {
  Tasks() : super([]); //{ fetchAlldata(); //.then((value) {});}

  Future<void> toggle(int id) async {
    
    int taskIndex = _findById(id);
    List<Task> temp = [...state];
    temp[taskIndex] =
        temp[taskIndex].copyWith(isComplete: !temp[taskIndex].isComplete);
    await TaskDatabase.instance.update(temp[taskIndex]);
    state = temp;
  }

  Future<void> addToFavorite(int id) async {
    int taskIndex = _findById(id);
    List<Task> temp = [...state];
    temp[taskIndex] =
        temp[taskIndex].copyWith(isFavorite: !temp[taskIndex].isFavorite);
    await TaskDatabase.instance.update(temp[taskIndex]);
    state = temp;
  }

  Future<void> removeItem(int id) async {
    int taskIndex = _findById(id);
    List<Task> temp = [...state];
    temp.remove(temp[taskIndex]);
    await TaskDatabase.instance.delete(id);
    state = temp;
  }

  int _findById(int id) {
    return state.indexWhere((task) => task.id == id);
  }

  Future<void>  addTask(Task task) async {
    task = await TaskDatabase.instance.insertRow(task);
    debugPrint('3o3o3oo3o3o ${task.id}');
    state = [...state, task];
  }

  Future<void> fetchAlldata() async {
    try {
      state = await TaskDatabase.instance.readAllRows();
    } catch (e) {
      state = [];
    }
  }

  Future close() async {
    await TaskDatabase.instance.close();
  }
}
