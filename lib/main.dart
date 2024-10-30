import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_parsing_tutorial/data/http_service.dart';
import 'package:json_parsing_tutorial/multi_user/bloc/multi_user_bloc.dart';
import 'package:json_parsing_tutorial/multi_user/page/multi_user_screen.dart';
import 'package:json_parsing_tutorial/single_user/bloc/single_user_bloc.dart';
import 'package:json_parsing_tutorial/single_user/page/single_user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final HttpService _httpService = HttpService();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SingleUserBloc(_httpService)),
          BlocProvider(create: (context) => MultiUserBloc(_httpService)),
        ],
        // child: const SingleUserScreen(),
        child: const MultiUserScreen(),
      ),
    );
  }
}
