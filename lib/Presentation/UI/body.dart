import 'package:crud_operation/Core/strings.dart';
import 'package:crud_operation/Data/Model/userModel.dart';
import 'package:crud_operation/Presentation/Logic/cubit/user_cubit.dart';
import 'package:crud_operation/Core/field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  UserCubit userCubit;
  Body({super.key, required this.userCubit});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (_, orientation) {
      return CustomScrollView(
        slivers: [
          _appbar(),
          orientation == Orientation.portrait ? _port() : _land()
        ],
      );
      // if orientation is portrait, show your portrait layout
    });
  }

  void add() {
    if (userCubit.formKey.currentState!.validate()) {
      userCubit.add_user(
          update: true,
          user: UserModel(
              branchNo: userCubit.branch,
              customerNo: userCubit.customerNo.text,
              arbicName: userCubit.arabicName.text,
              arabicDescription: userCubit.arabicDes.text,
              englishName: userCubit.englishName.text,
              englishDescripton: userCubit.englishDes.text,
              note: userCubit.note.text,
              address: userCubit.address.text));
    }
  }

  void update() {
    userCubit.add_user(
        update: false,
        user: UserModel(
            branchNo: userCubit.users[userCubit.first - 1].branchNo,
            customerNo: userCubit.customerNo.text.isEmpty
                ? userCubit.users[userCubit.first - 1].customerNo
                : userCubit.customerNo.text,
            arbicName: userCubit.arabicName.text.isEmpty
                ? userCubit.users[userCubit.first - 1].arbicName
                : userCubit.arabicName.text,
            arabicDescription: userCubit.arabicDes.text.isEmpty
                ? userCubit.users[userCubit.first - 1].arabicDescription
                : userCubit.arabicDes.text,
            englishName: userCubit.englishName.text.isEmpty
                ? userCubit.users[userCubit.first - 1].englishName
                : userCubit.englishName.text,
            englishDescripton: userCubit.englishDes.text.isEmpty
                ? userCubit.users[userCubit.first - 1].englishDescripton
                : userCubit.englishDes.text,
            note: userCubit.note.text.isEmpty
                ? userCubit.users[userCubit.first - 1].note
                : userCubit.note.text,
            address: userCubit.address.text.isEmpty
                ? userCubit.users[userCubit.first - 1].address
                : userCubit.address.text));
  }

  _port() => SliverToBoxAdapter(
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
                            labelText: userCubit.state is PrepareToAdd ||
                                    userCubit.users.isEmpty
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
                        Text(userCubit.state is PrepareToAdd ||
                                userCubit.users.isEmpty
                            ? 'Customer No'
                            : userCubit.users[userCubit.first - 1].customerNo
                                .toString()),
                        text_field(
                          controller: userCubit.customerNo,
                          validator: userCubit.validator(hint: 'Customer No'),
                          // hint: userCubit.state is PrepareToAdd ||
                          //         userCubit.users.isEmpty
                          //     ? userCubit.customerNo.toString()
                          //     : userCubit.users[userCubit.first - 1].customerNo
                          //         .toString(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      userCubit.state is PrepareToAdd || userCubit.users.isEmpty
                          ? MyStrings.arabicLabel
                          : userCubit.users[userCubit.first - 1].arbicName
                              .toString()),
                  text_field(
                    controller: userCubit.arabicName,
                    validator: userCubit.validator(hint: MyStrings.arabicLabel),
                    // hint: userCubit.state is PrepareToAdd ||
                    //         userCubit.users.isEmpty
                    //     ? MyStrings.arabicName
                    //     : userCubit.users[userCubit.first - 1].arbicName
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userCubit.state is PrepareToAdd ||
                          userCubit.users.isEmpty
                      ? MyStrings.arabicDesLabel
                      : userCubit.users[userCubit.first - 1].arabicDescription),
                  text_field(
                    controller: userCubit.arabicDes,
                    validator:
                        userCubit.validator(hint: MyStrings.arabicDesLabel),
                    // hint: userCubit.state is PrepareToAdd ||
                    //         userCubit.users.isEmpty
                    //     ? MyStrings.arabicDes
                    //     : userCubit
                    //         .users[userCubit.first - 1].arabicDescription
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      userCubit.state is PrepareToAdd || userCubit.users.isEmpty
                          ? MyStrings.englishNameLabel
                          : userCubit.users[userCubit.first - 1].englishName),
                  text_field(
                    controller: userCubit.englishName,
                    validator:
                        userCubit.validator(hint: MyStrings.englishNameLabel),
                    // hint: userCubit.state is PrepareToAdd ||
                    //         userCubit.users.isEmpty
                    //     ? MyStrings.englishName
                    //     : userCubit.users[userCubit.first - 1].englishName
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userCubit.state is PrepareToAdd ||
                          userCubit.users.isEmpty
                      ? MyStrings.englishDesLabel
                      : userCubit.users[userCubit.first - 1].englishDescripton),
                  text_field(
                    controller: userCubit.englishDes,
                    validator:
                        userCubit.validator(hint: MyStrings.englishDesLabel),
                    // hint: userCubit.state is PrepareToAdd ||
                    //         userCubit.users.isEmpty
                    //     ? MyStrings.englishDes
                    //     : userCubit
                    //         .users[userCubit.first - 1].englishDescripton
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userCubit.state is PrepareToAdd || userCubit.users.isEmpty
                        ? MyStrings.noteLabel
                        : userCubit.users[userCubit.first - 1].note,
                  ),
                  text_field(
                      controller: userCubit.note,
                      validator: userCubit.validator(hint: MyStrings.noteLabel),
                      // hint: userCubit.state is PrepareToAdd ||
                      //         userCubit.users.isEmpty
                      //     ? MyStrings.noteLabel
                      //     : userCubit.users[userCubit.first - 1].note,
                      maxLines: 3)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      userCubit.state is PrepareToAdd || userCubit.users.isEmpty
                          ? MyStrings.addresslabel
                          : userCubit.users[userCubit.first - 1].address),
                  text_field(
                    controller: userCubit.address,
                    validator:
                        userCubit.validator(hint: MyStrings.addresslabel),
                    // hint: userCubit.state is PrepareToAdd ||
                    //         userCubit.users.isEmpty
                    //     ? MyStrings.address
                    //     : userCubit
                    //         .users[userCubit.first - 1].arabicDescription
                  )
                ],
              ),
            ],
          ),
        ),
      );

  _land() => SliverToBoxAdapter(
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
                        const Flexible(
                            child: SizedBox(
                          width: 100,
                          child: Text(
                            'Branch No',
                            style: TextStyle(fontSize: 11),
                          ),
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
                            child: SizedBox(
                          width: 50,
                          child: Text(
                            userCubit.state is PrepareToAdd ||
                                    userCubit.users.isEmpty
                                ? 'Customer No'
                                : userCubit
                                    .users[userCubit.first - 1].customerNo
                                    .toString(),
                            style: TextStyle(fontSize: 11),
                          ),
                        )),
                        Spacer(),
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: 50,
                            child: text_field(
                              validator: userCubit.validator(
                                  hint: MyStrings.customerNolabel),

                              controller: userCubit.customerNo,
                              // hint: userCubit

                              //     .users[userCubit.first - 1].customerNo
                            ),
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
                            userCubit.state is PrepareToAdd ||
                                    userCubit.users.isEmpty
                                ? MyStrings.arabicLabel
                                : userCubit
                                    .users[userCubit.first - 1].arbicName,
                            style: TextStyle(fontSize: 11),
                          ),
                        )),
                        Spacer(),
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: 50,
                            child: text_field(
                              validator: userCubit.validator(
                                  hint: MyStrings.arabicLabel),
                              controller: userCubit.arabicName,
                              // hint: userCubit
                              //     .users[userCubit.first - 1].arbicName
                            ),
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
                            child: SizedBox(
                          width: 50,
                          child: Text(
                            userCubit.state is PrepareToAdd ||
                                    userCubit.users.isEmpty
                                ? MyStrings.arabicDesLabel
                                : userCubit.users[userCubit.first - 1]
                                    .arabicDescription,
                            style: TextStyle(fontSize: 11),
                          ),
                        )),
                        Spacer(),
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: 50,
                            child: text_field(
                              controller: userCubit.arabicDes,
                              validator: userCubit.validator(
                                  hint: MyStrings.arabicDesLabel),
                              // hint: userCubit.state is PrepareToAdd
                              //     ? MyStrings.arabicDes
                              //     : userCubit.users[userCubit.first - 1]
                              //         .arabicDescription
                            ),
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
                            child: SizedBox(
                          width: 100,
                          child: Text(
                            userCubit.state is PrepareToAdd ||
                                    userCubit.users.isEmpty
                                ? MyStrings.englishNameLabel
                                : userCubit
                                    .users[userCubit.first - 1].englishName,
                            style: TextStyle(fontSize: 11),
                          ),
                        )),
                        Spacer(),
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: 50,
                            child: text_field(
                              controller: userCubit.englishName,
                              validator: userCubit.validator(
                                  hint: MyStrings.englishNameLabel),
                              // hint: userCubit.state is PrepareToAdd
                              //     ? MyStrings.englishName
                              //     : userCubit.users[userCubit.first - 1]
                              //         .englishName
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child: SizedBox(
                          width: 50,
                          child: Text(
                            userCubit.state is PrepareToAdd ||
                                    userCubit.users.isEmpty
                                ? MyStrings.englishDesLabel
                                : userCubit.users[userCubit.first - 1]
                                    .englishDescripton,
                            style: TextStyle(fontSize: 11),
                          ),
                        )),
                        Spacer(),
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: 50,
                            child: text_field(
                              controller: userCubit.englishDes,
                              validator: userCubit.validator(
                                  hint: MyStrings.englishDesLabel),
                              // hint: userCubit.state is PrepareToAdd
                              //     ? MyStrings.englishDes
                              //     : userCubit.users[userCubit.first - 1]
                              //         .englishDescripton
                            ),
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
                              userCubit.state is PrepareToAdd ||
                                      userCubit.users.isEmpty
                                  ? MyStrings.noteLabel
                                  : userCubit.users[userCubit.first - 1].note,
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
                              validator: userCubit.validator(
                                  hint: MyStrings.noteLabel),
                              // hint: userCubit.state is PrepareToAdd
                              //     ? MyStrings.noteLabel
                              //     : userCubit.users[userCubit.first - 1].note,
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
                            child: SizedBox(
                          width: 50,
                          child: Text(
                            userCubit.state is PrepareToAdd ||
                                    userCubit.users.isEmpty
                                ? MyStrings.addresslabel
                                : userCubit.users[userCubit.first - 1].address,
                            style: TextStyle(fontSize: 11),
                          ),
                        )),
                        Spacer(),
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: 50,
                            child: text_field(
                              controller: userCubit.address,
                              validator: userCubit.validator(
                                  hint: MyStrings.addresslabel),
                              // hint: userCubit.state is PrepareToAdd
                              //     ? MyStrings.address
                              //     : userCubit
                              //         .users[userCubit.first - 1].address
                            ),
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

  Widget _appbar() => SliverAppBar(
        expandedHeight: 0,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                userCubit.clear_text();
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  userCubit.state is PrepareToAdd ? add() : update();
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
      );
}
