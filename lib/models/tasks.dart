import 'task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../database/task_database.dart';

class Tasks extends StateNotifier<List<Task>> {
  Tasks() : super([]) {
    fetchAlldata().then((value) {});
  }

  Future<void> toggle(int id) async {
    int taskIndex = _findById(id);
    List<Task> temp = [...state];
    temp[taskIndex] =
        temp[taskIndex].copyWith(isComplete: !temp[taskIndex].isComplete);
    await TaskDatabase.instance.update(temp[taskIndex]);
    // Task(
    //     id: state[taskIndex].id,
    //     date: state[taskIndex].date,
    //     startTime: state[taskIndex].startTime,
    //     endTime: state[taskIndex].endTime,
    //     reminder: state[taskIndex].reminder,
    //     title: state[taskIndex].title,
    //     isComplete: !state[taskIndex].isComplete);
    state = temp;
  }

  Future<void> addToFavorite(int id) async {
    int taskIndex = _findById(id);
    List<Task> temp = [...state];
    temp[taskIndex] =
        temp[taskIndex].copyWith(isFavorite: !temp[taskIndex].isFavorite);
    await TaskDatabase.instance.update(temp[taskIndex]);

    // Task(
    //     id: state[taskIndex].id,
    //     date: state[taskIndex].date,
    //     startTime: state[taskIndex].startTime,
    //     endTime: state[taskIndex].endTime,
    //     reminder: state[taskIndex].reminder,
    //     title: state[taskIndex].title,
    //     isFavorite: !state[taskIndex].isFavorite);
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

  Future<void> addTask(Task task) async {
    task = await TaskDatabase.instance.insertRow(task);
    print('3o3o3oo3o3o ${task.id}');
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

// Task(
//                 id: 10,
//                 date: DateTime.now(),
//                 startTime: TimeOfDay.now(),
//                 endTime: TimeOfDay.now(),
//                 reminder: Reminder.dayBefore,
//                 title: 'do it',
//                 isComplete: false,
//                 isFavorite: false),
//             Task(
//                 id: 20,
//                 date: DateTime.now(),
//                 startTime: TimeOfDay.now(),
//                 endTime: TimeOfDay.now(),
//                 reminder: Reminder.dayBefore,
//                 title: 'do it now',
//                 isComplete: false,
//                 isFavorite: false),
//             Task(
//                 id: 30,
//                 date: DateTime.now(),
//                 startTime: TimeOfDay.now(),
//                 endTime: TimeOfDay.now(),
//                 reminder: Reminder.dayBefore,
//                 title: 'just do it',
//                 isComplete: false,
//                 isFavorite: false),
