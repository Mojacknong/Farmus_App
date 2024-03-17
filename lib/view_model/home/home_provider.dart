import 'package:farmus/view_model/home/notifier/to_do_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeToDoProvider = StateNotifierProvider<ToDoNotifier, String>((ref) {
  return ToDoNotifier();
});