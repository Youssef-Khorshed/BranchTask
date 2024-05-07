import 'package:crud_operation/Core/message.dart';
import 'package:crud_operation/Presentation/Logic/cubit/user_cubit.dart';
import 'package:crud_operation/Presentation/UI/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    final ori = MediaQuery.of(context).orientation;
    return Form(
      key: userCubit.formKey,
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is AddUser) {
            message(
                context: context,
                message: 'User Added Successfully',
                mcolor: Colors.green);
          } else if (state is UpdateUser) {
            message(
                context: context,
                message: 'User Updated Successfully',
                mcolor: Colors.yellow);
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: userCubit.first <= 1
                            ? null
                            : () {
                                userCubit.move_prevoius(
                                    pre: userCubit.users.length);
                              },
                        icon: const Icon(TablerIcons.player_track_prev_filled));
                  },
                ),
                IconButton(
                    onPressed: userCubit.first <= 1
                        ? null
                        : () {
                            userCubit.move_prevoius(pre: 1);
                          },
                    icon: const Icon(
                      Icons.arrow_left_sharp,
                      size: 50,
                    ) //TablerIcons.arrow_left_square)
                    ),
                Text(
                    '${userCubit.first} / ${userCubit.users.isEmpty ? 1 : userCubit.users.length.toString()}'),
                IconButton(
                    onPressed: userCubit.first == userCubit.users.length
                        ? null
                        : () {
                            userCubit.move_next(next: 1);
                          },
                    icon: const Icon(TablerIcons.player_play_filled)),
                IconButton(
                    onPressed: userCubit.first == userCubit.users.length
                        ? null
                        : () {
                            userCubit.move_next(next: userCubit.users.length);
                          },
                    icon: const Icon(TablerIcons.player_track_next_filled)),
              ],
            ),
            body: userCubit.state is LoadingData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Body(userCubit: userCubit),
          );
        },
      ),
    );
  }
}
