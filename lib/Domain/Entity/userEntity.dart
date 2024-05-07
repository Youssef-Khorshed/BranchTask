// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  int branchNo;
  String customerNo;
  String arbicName;
  String arabicDescription;
  String englishName;
  String englishDescripton;
  String note;
  String address;
  User({
    required this.branchNo,
    required this.customerNo,
    required this.arbicName,
    required this.arabicDescription,
    required this.englishName,
    required this.englishDescripton,
    required this.note,
    required this.address,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        branchNo,
        customerNo,
        arbicName,
        arabicDescription,
        englishName,
        englishDescripton,
        note,
        address,
      ];
}
