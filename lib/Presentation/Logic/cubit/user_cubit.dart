import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_operation/Data/DataSource/remote.dart';
import 'package:crud_operation/Data/Model/userModel.dart';
import 'package:crud_operation/Domain/Entity/userEntity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRemote remoteImp = UserRemoteImp();
  List<User> users = [];
  int branch = 0;
  int first = 1;
  TextEditingController customerNo = TextEditingController();
  TextEditingController arabicName = TextEditingController();
  TextEditingController arabicDes = TextEditingController();
  TextEditingController englishName = TextEditingController();
  TextEditingController englishDes = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController address = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? Function(String?)? validator({required String hint}) => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hint';
        }
        return null;
      };
  UserCubit() : super(UserInitial());

  void add_user({required UserModel user, required bool update}) async {
    await remoteImp.post_user(user: user);
    emit(update ? AddUser() : UpdateUser());
    clear_text();
    get_users();
  }

  void move_next({required int next}) {
    emit(UserInitial());
    if (first + next > users.length) {
      first = users.length;
    } else {
      first += next;
    }
    emit(MoveNext());
  }

  void move_prevoius({required int pre}) {
    emit(UserInitial());

    if (first - pre <= 0) {
      first = 1;
    } else {
      first -= pre;
    }
    print(first);
    emit(MovePrevoius());
  }

  void get_users() async {
    emit(LoadingData(x: users));
    final getusrs = await remoteImp.get_users();
    if (getusrs != null) {
      users = getusrs;
      branch = users.length + 1;

      emit(GetUser(x: users));
    }
  }

  void clear_text() {
    emit(UserInitial());
    customerNo.clear();
    arabicName.clear();
    arabicDes.clear();
    englishName.clear();
    englishDes.clear();
    note.clear();
    address.clear();
    branch = users.length + 1;
    emit(PrepareToAdd());
  }
}
