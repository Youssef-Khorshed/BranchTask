import 'package:crud_operation/Core/strings.dart';
import 'package:crud_operation/Presentation/Logic/cubit/user_cubit.dart';
import 'package:crud_operation/Presentation/UI/field.dart';
import 'package:flutter/material.dart';

class BodyPort extends StatelessWidget {
  UserCubit userCubit;
  BodyPort({super.key, required this.userCubit});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Branch No'),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: userCubit.state is PrepareToAdd
                              ? userCubit.branch.toString()
                              : userCubit.users[userCubit.first - 1].branchNo
                                  .toString(),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customer No'),
                      text_field(
                          controller: userCubit.customerNo,
                          validator: userCubit.validator(hint: 'Customer No'),
                          hint: userCubit.users[userCubit.first - 1].customerNo)
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.arabicLabel),
                text_field(
                    controller: userCubit.arabicName,
                    validator: userCubit.validator(hint: MyStrings.arabicLabel),
                    hint: userCubit.state is PrepareToAdd
                        ? MyStrings.arabicName
                        : userCubit.users[userCubit.first - 1].arbicName)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.arabicDesLabel),
                text_field(
                    controller: userCubit.arabicDes,
                    validator: userCubit.validator(hint: MyStrings.englishName),
                    hint: userCubit.state is PrepareToAdd
                        ? MyStrings.arabicDes
                        : userCubit
                            .users[userCubit.first - 1].arabicDescription)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.englishNameLabel),
                text_field(
                    controller: userCubit.englishName,
                    validator: userCubit.validator(hint: MyStrings.englishName),
                    hint: userCubit.state is PrepareToAdd
                        ? MyStrings.englishName
                        : userCubit.users[userCubit.first - 1].englishName)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.englishDesLabel),
                text_field(
                    controller: userCubit.englishDes,
                    validator: userCubit.validator(hint: MyStrings.englishDes),
                    hint: userCubit.state is PrepareToAdd
                        ? MyStrings.englishDes
                        : userCubit
                            .users[userCubit.first - 1].englishDescripton)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyStrings.noteLabel,
                ),
                text_field(
                    controller: userCubit.note,
                    validator: userCubit.validator(hint: MyStrings.noteLabel),
                    hint: userCubit.state is PrepareToAdd
                        ? MyStrings.noteLabel
                        : userCubit.users[userCubit.first - 1].note,
                    maxLines: 3)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.address),
                text_field(
                    controller: userCubit.address,
                    validator: userCubit.validator(hint: MyStrings.address),
                    hint: userCubit.state is PrepareToAdd
                        ? MyStrings.address
                        : userCubit
                            .users[userCubit.first - 1].arabicDescription)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
