import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:merstro/lib.dart';

class UserDBNames{
  final CollectionReference users = FirebaseFirestore.instance.collection("/users");
  final details = "details";
}

class MDB{
  final user = MAuth().getCurrentUser;
  final usersDB = UserDBNames();
  final instance = FirebaseFirestore.instance;

  Future createUserData(String firstName, String lastName, String emailAddress, String phoneNumber, String? refCode) async{
    return usersDB.users.doc(user?.email).set({
      "firstName" : firstName,
      "lastName" : lastName,
      "emailAddress" : emailAddress,
      "phoneNumber": phoneNumber,
      "refCode": refCode,
    });
  }
}