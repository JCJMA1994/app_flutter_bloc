import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/auth/bloc/user/user_bloc.dart';
import '../feature/auth/pages/page1_page.dart';
import '../feature/auth/pages/page2_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc App',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => const Page1Page(),
          'page2': (_) => const Page2Page(),
        },
      ),
    );
  }
}
