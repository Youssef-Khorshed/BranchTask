import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/Data/Model/userModel.dart';
import 'package:crud_operation/Domain/Entity/userEntity.dart';

abstract class UserRemote {
  Future<void> post_user({required UserModel user});
  get_users();
}

class UserRemoteImp extends UserRemote {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userpath = 'User';
  @override
  get_users() async {
    List<User> users = [];
    try {
      final res = await firestore.collection('User').get();
      res.docs.forEach((element) {
        users.add(UserModel.fromMap(element.data()));
      });
      return Future.value(users);
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> post_user({required UserModel user}) async {
    await firestore
        .collection(userpath)
        .doc(user.branchNo.toString())
        .set(user.toMap())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
