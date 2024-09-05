import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sihapp/screens/wrapper/main_wrapper.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Go router example',
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
