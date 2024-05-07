import 'package:crud_operation/Data/Model/userModel.dart';
import 'package:crud_operation/Presentation/Logic/cubit/user_cubit.dart';
import 'package:crud_operation/Presentation/UI/body_landscape.dart';
import 'package:crud_operation/Presentation/UI/body_portrat.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  UserCubit userCubit;
  bool check_landscape;
  Body({super.key, required this.userCubit, required this.check_landscape});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 0,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: () {
                  userCubit.clear_text();
                },
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    if (userCubit.formKey.currentState!.validate()) {
                      userCubit.add_user(
                          user: UserModel(
                              branchNo: userCubit.branch,
                              customerNo: userCubit.customerNo.text,
                              arbicName: userCubit.arabicName.text,
                              arabicDescription: userCubit.arabicDes.text,
                              englishName: userCubit.arabicDes.text,
                              englishDescripton: userCubit.englishDes.text,
                              note: userCubit.note.text,
                              address: userCubit.address.text));
                    }
                  },
                  icon: const Icon(
                    Icons.save_rounded,
                    color: Colors.white,
                  )),
            )
          ],
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Branch / Store / Cashier',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        check_landscape
            ? BodyLand(userCubit: userCubit)
            : BodyPort(userCubit: userCubit)
      ],
    );
  }
}
