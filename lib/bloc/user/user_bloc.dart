import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUserEvent>(
        (event, emit) => emit(UserSetState(newUser: event.user)));
    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(newUser: state.user!.copyWith(age: event.age)));
    });

    on<AddProfessionEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(
          newUser: state.user!.copyWith(
              professions: [...state.user!.professions, event.profession])));
    });

    on<DeleteUserEvent>((event, emit) {
      if (!state.existUser) return;
      emit(const UserInitialState());
    });
  }
}
