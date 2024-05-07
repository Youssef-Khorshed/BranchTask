import 'package:crud_operation/Core/strings.dart';
import 'package:crud_operation/Presentation/Logic/cubit/user_cubit.dart';
import 'package:crud_operation/Presentation/UI/field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BodyLand extends StatelessWidget {
  UserCubit userCubit;
  BodyLand({super.key, required this.userCubit});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                          child: SizedBox(
                        child: Text(
                          'Branch No',
                          style: TextStyle(fontSize: 11),
                        ),
                        width: 100,
                      )),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: userCubit.state is PrepareToAdd
                                  ? userCubit.branch.toString()
                                  : userCubit
                                      .users[userCubit.first - 1].branchNo
                                      .toString(),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                        'Customer No',
                        style: TextStyle(fontSize: 11),
                      )),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: text_field(
                              controller: userCubit.customerNo,
                              hint: userCubit
                                  .users[userCubit.first - 1].customerNo),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                          child: SizedBox(
                        width: 100,
                        child: Text(
                          MyStrings.arabicLabel,
                          style: TextStyle(fontSize: 11),
                        ),
                      )),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: text_field(
                              controller: userCubit.arabicName,
                              hint: userCubit
                                  .users[userCubit.first - 1].arbicName),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                        MyStrings.arabicDesLabel,
                        style: TextStyle(fontSize: 11),
                      )),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: text_field(
                              controller: userCubit.arabicDes,
                              validator: userCubit.validator(
                                  hint: MyStrings.englishName),
                              hint: userCubit.state is PrepareToAdd
                                  ? MyStrings.arabicDes
                                  : userCubit.users[userCubit.first - 1]
                                      .arabicDescription),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                        MyStrings.englishNameLabel,
                        style: TextStyle(fontSize: 11),
                      )),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: text_field(
                              controller: userCubit.englishName,
                              validator: userCubit.validator(
                                  hint: MyStrings.englishName),
                              hint: userCubit.state is PrepareToAdd
                                  ? MyStrings.englishName
                                  : userCubit
                                      .users[userCubit.first - 1].englishName),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(
                        MyStrings.englishDesLabel,
                        style: TextStyle(fontSize: 11),
                      )),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: text_field(
                              controller: userCubit.englishDes,
                              hint: userCubit.state is PrepareToAdd
                                  ? MyStrings.englishDes
                                  : userCubit.users[userCubit.first - 1]
                                      .englishDescripton),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            MyStrings.noteLabel,
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: text_field(
                            controller: userCubit.note,
                            validator:
                                userCubit.validator(hint: MyStrings.noteLabel),
                            hint: userCubit.state is PrepareToAdd
                                ? MyStrings.noteLabel
                                : userCubit.users[userCubit.first - 1].note,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                        MyStrings.address,
                        style: TextStyle(fontSize: 11),
                      )),
                      Spacer(),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: text_field(
                              controller: userCubit.address,
                              validator:
                                  userCubit.validator(hint: MyStrings.address),
                              hint: userCubit.state is PrepareToAdd
                                  ? MyStrings.address
                                  : userCubit
                                      .users[userCubit.first - 1].address),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
