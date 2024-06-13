import 'package:app_bloc/app_config.dart';
import 'package:app_bloc/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_bloc/bloc/user/user_bloc.dart';
import 'package:app_bloc/models/user.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    final name = AppConfig.instance.name;

    return Scaffold(
      appBar: AppBar(
        title: Text('User $name'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
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
              : const Center(
                  child: Text('No hay usuario seleccionado'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'page2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(
                  fontSize: responsive.dp(1.8), fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          Text('Profesiones',
              style: TextStyle(
                  fontSize: responsive.dp(4.8), fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.professions.map((prof) => ListTile(title: Text(prof)))
        ],
      ),
    );
  }
}
