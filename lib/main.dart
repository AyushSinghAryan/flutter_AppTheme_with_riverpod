import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_dart/API/Pages/CounterScreen.dart';
import 'package:learning_dart/API/RiverPod/Themes/theme_model.dart';
import 'package:learning_dart/API/RiverPod/Themes/theme_page.dart';
import 'package:learning_dart/API/RiverPod/easy_riverpod.dart';
import 'package:learning_dart/API/RiverPod/hard_riverpod.dart';
import 'package:learning_dart/API/RiverPod/riverpod.dart';
import 'package:learning_dart/counterBloc/counter_bloc.dart';
import 'package:learning_dart/imdb_movies/imdb_api_test.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
  // Student s1 = Student("ram", "22");
  // Student s2 = Student("kohli", "35");
  // s1.printStudentDetails();
  // s1.name = "Aryan";
  // print(s1.name);

  // List<Student> studentList = [s1, s2, Student("kam", "22")];
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ref.watch(riverpodTheme).currentTheme,
      home: ThemePage(),
    );
  }
}

// class Student {
//   String? name;
//   String? age;
//   String? dob;

//   Student(String this.name, String this.age) {
//     name = name;
//     age = age;
//   }

//   void printStudentDetails() {
//     print("$name + $age");
//   }
// }
