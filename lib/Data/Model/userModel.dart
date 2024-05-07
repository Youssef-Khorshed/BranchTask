import 'dart:convert';

import 'package:crud_operation/Domain/Entity/userEntity.dart';

class UserModel extends User {
  UserModel(
      {required super.branchNo,
      required super.customerNo,
      required super.arbicName,
      required super.arabicDescription,
      required super.englishName,
      required super.englishDescripton,
      required super.note,
      required super.address});

  User copyWith({
    int? branchNo,
    String? customerNo,
    String? arbicName,
    String? arabicDescription,
    String? englishName,
    String? englishDescripton,
    String? note,
    String? address,
  }) {
    return User(
      branchNo: branchNo ?? this.branchNo,
      customerNo: customerNo ?? this.customerNo,
      arbicName: arbicName ?? this.arbicName,
      arabicDescription: arabicDescription ?? this.arabicDescription,
      englishName: englishName ?? this.englishName,
      englishDescripton: englishDescripton ?? this.englishDescripton,
      note: note ?? this.note,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'branchNo': branchNo,
      'customerNo': customerNo,
      'arbicName': arbicName,
      'arabicDescription': arabicDescription,
      'englishName': englishName,
      'englishDescripton': englishDescripton,
      'note': note,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      branchNo: map['branchNo'] as int,
      customerNo: map['customerNo'] as String,
      arbicName: map['arbicName'] as String,
      arabicDescription: map['arabicDescription'] as String,
      englishName: map['englishName'] as String,
      englishDescripton: map['englishDescripton'] as String,
      note: map['note'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(branchNo: $branchNo, customerNo: $customerNo, arbicName: $arbicName, arabicDescription: $arabicDescription, englishName: $englishName, englishDescripton: $englishDescripton, note: $note, address: $address)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.branchNo == branchNo &&
        other.customerNo == customerNo &&
        other.arbicName == arbicName &&
        other.arabicDescription == arabicDescription &&
        other.englishName == englishName &&
        other.englishDescripton == englishDescripton &&
        other.note == note &&
        other.address == address;
  }

  @override
  int get hashCode {
    return branchNo.hashCode ^
        customerNo.hashCode ^
        arbicName.hashCode ^
        arabicDescription.hashCode ^
        englishName.hashCode ^
        englishDescripton.hashCode ^
        note.hashCode ^
        address.hashCode;
  }
}
