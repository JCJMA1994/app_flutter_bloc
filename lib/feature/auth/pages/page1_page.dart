import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/env/app_config.dart';
import '../../../core/utils/responsive.dart';
import '../bloc/user/user_bloc.dart';
import '../models/user.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    final name = AppConfig.instance.name;

    final Responsive responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('App BLoC $name',
            style: TextStyle(fontSize: responsive.dp(2.8))),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline, size: responsive.dp(3.0)),
            onPressed: () {
              userBloc.add(DeleteUserEvent());
            },
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
              ? InformacionUsuario(user: state.user!)
              : Center(
                  child: Text('No hay usuario seleccionado',
                      style: TextStyle(fontSize: responsive.dp(2.0))));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: responsive.dp(3.0)),
          onPressed: () => Navigator.pushNamed(context, 'page2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(
                  fontSize: responsive.dp(2.8), fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(
              title: Text('Nombre: ${user.name}',
                  style: TextStyle(fontSize: responsive.dp(1.5)))),
          ListTile(
              title: Text('Edad: ${user.age}',
                  style: TextStyle(fontSize: responsive.dp(1.5)))),
          Text('Profesiones',
              style: TextStyle(
                  fontSize: responsive.dp(2.8), fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.professions.map((prof) => ListTile(
              title:
                  Text(prof, style: TextStyle(fontSize: responsive.dp(1.5)))))
        ],
      ),
    );
  }
}
