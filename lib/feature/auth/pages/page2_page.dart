import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/responsive.dart';
import '../bloc/user/user_bloc.dart';
import '../models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración de Usuario',
            style: TextStyle(fontSize: responsive.dp(2.3))),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              minWidth: responsive.wp(70),
              height: responsive.hp(5),
              color: Colors.blue,
              onPressed: () {
                final newUser = User(
                    name: 'Fernando',
                    age: 36,
                    professions: ['FullStack Developer']);
                userBloc.add(ActivateUserEvent(newUser));
              },
              child: Text('Establecer Usuario',
                  style: TextStyle(
                      color: Colors.white, fontSize: responsive.dp(2.0)))),
          SizedBox(height: responsive.hp(2.0)),
          MaterialButton(
              minWidth: responsive.wp(70),
              height: responsive.hp(5),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(25));
              },
              child: Text('Cambiar Edad',
                  style: TextStyle(
                      color: Colors.white, fontSize: responsive.dp(2.0)))),
          SizedBox(height: responsive.hp(2.0)),
          MaterialButton(
              minWidth: responsive.wp(70),
              height: responsive.hp(5),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfessionEvent('Nueva Profesión'));
              },
              child: Text('Añadir Profesion',
                  style: TextStyle(
                      color: Colors.white, fontSize: responsive.dp(2.0)))),
        ],
      )),
    );
  }
}
