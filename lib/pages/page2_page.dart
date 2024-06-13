import 'package:app_bloc/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_bloc/bloc/user/user_bloc.dart';
import 'package:app_bloc/models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Responsive responsive = Responsive.of(context);

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Usuario'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = User(
                    name: 'Fernando',
                    age: 36,
                    professions: ['FullStack Developer']);
                userBloc.add(ActivateUserEvent(newUser));
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(25));
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfessionEvent('Nueva Profesión'));
              },
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white))),
        ],
      )),
    );
  }
}
