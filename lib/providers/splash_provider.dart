import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import './provider.dart';
import '../screens/board_screen.dart';

final splashProvider = StateProvider.family<SplashProvider, BuildContext>(
    (ref, context) => SplashProvider(ref, context));

class SplashProvider {
  final Ref _ref;
  // late Tasks _tasks;
  final BuildContext context;

  SplashProvider(this._ref, this.context) {
    init();
  }

  init() {
    _ref
        .read(tasksProvider.notifier)
        .fetchAlldata()
        .then((_) => Navigator.of(context).pushNamed(BoardScreen.routName));
  }
}
