import 'package:app_bloc/pages/page1_page.dart';
import 'package:app_bloc/pages/page2_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user/user_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => const Page1Page(),
          'page2': (_) => const Page2Page(),
        },
      ),
    );
  }
}
