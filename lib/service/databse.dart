import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<void> employeedetail(
      Map<String, dynamic> employeedoc, String id) async {
    await FirebaseFirestore.instance
        .collection('employee') // Corrected collection name
        .doc(id)
        .set(employeedoc);
  }
}
