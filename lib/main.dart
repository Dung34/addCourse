// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:addcourse/cubit/addcourse_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    AddcourseCubit addcourseCubit = AddcourseCubit();
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => addcourseCubit,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  addcourseCubit.addCourse();
                },
                child: Container(
                  height: 80,
                  width: 100,
                  child: Center(
                    child: Text("Add course"),
                  ),
                ),
              ),
              BlocListener<AddcourseCubit, AddcourseState>(
                listener: (context, state) {
                  if (state is Counter) {
                    counter += 1;
                  }
                },
                child: BlocBuilder<AddcourseCubit, AddcourseState>(
                  buildWhen: (previous, current) => current is Counter,
                  builder: (context, state) {
                    return Container(
                      height: 160 * counter.toDouble(),
                      width: 200,
                      child: ListView.builder(
                        itemBuilder: (context, index) => Cousre(),
                        itemCount: counter,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Cousre extends StatelessWidget {
  Cousre({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 70,
            width: 90,
            child: Text("Course "),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Text("Type 1 "),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: Text("Type 2"),
                ),
                flex: 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
