import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String fullName = "장성호";
  final String company = "아주대학교";
  final int age = 24;

  FirebaseFirestore getFirestoreInstance() {
    return _firestore;
  }

  Future<void> addUser() {
    CollectionReference users = _firestore.collection('users');
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fullName, // John Doe
          'company': company, // Stokes and Sons
          'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // create
  Future<void> addData(String collectionPath, Map<String, dynamic> data) async {
    CollectionReference dataCollection = _firestore.collection(collectionPath);
    dataCollection.add(data);
  }

  Future<void> setData(String collectionPath, String documentId,
      Map<String, dynamic> data) async {
    CollectionReference dataCollection = _firestore.collection(collectionPath);
    dataCollection.doc(documentId).set(data);
  }

  // read
  Future readData(String collectionPath, String documentId) async {
    CollectionReference dataCollection = _firestore.collection(collectionPath);
    return await dataCollection.doc(documentId).get();
  }

  // update
  Future<void> updateData(String collectionPath, String documentId,
      Map<String, dynamic> data) async {
    CollectionReference dataCollection = _firestore.collection(collectionPath);
    dataCollection.doc(documentId).update(data);
  }

  // delete
  Future<void> deleteData(String collectionPath, String documentId) async {
    CollectionReference dataCollection = _firestore.collection(collectionPath);
    dataCollection.doc(documentId).delete();
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseFirestoreProvider {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late final String fullName;
//   late final String company;
//   late final int age;
//
//   Future<void> addUser() {
//     CollectionReference users = _firestore.collection('users');
//     // Call the user's CollectionReference to add a new user
//     return users
//         .add({
//           'full_name': fullName, // John Doe
//           'company': company, // Stokes and Sons
//           'age': age // 42
//         })
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }
//
//   // CRUD
//   Future<void> createData(
//       String collectionPath, Map<dynamic, dynamic> data) async {
//     CollectionReference _collection = _firestore.collection(collectionPath);
//     _collection
//         .add(data)
//         .then((value) => print("Data Added"))
//         .catchError((error) => print("Failed to add data: $error"));
//   }
//
//   Future<void> setData(String collectionPath, String documentId,
//       Map<dynamic, dynamic> data) async {
//     CollectionReference _collection = _firestore.collection(collectionPath);
//     _collection
//         .doc(documentId)
//         .set(data)
//         .then((value) => print("Data Added"))
//         .catchError((error) => print("Failed to add data: $error"));
//   }
//
//   Future readData(String collectionPath, String documentId) async {
//     CollectionReference _collection = _firestore.collection(collectionPath);
//     return await _collection.doc(documentId).get();
//   }
//
//   Future<void> updateData(String collectionPath, String documentId,
//       Map<String, dynamic> data) async {
//     CollectionReference _collection = _firestore.collection(collectionPath);
//     _collection
//         .doc(documentId)
//         .update(data)
//         .then((value) => print("Data updated"))
//         .catchError((error) => print("Failed to add data: $error"));
//   }
//
//   Future<void> deleteData(String collectionPath, String documentId) async {
//     CollectionReference _collection = _firestore.collection(collectionPath);
//     _collection
//         .doc(documentId)
//         .delete()
//         .then((value) => print("Data deleted"))
//         .catchError((error) => print("Failed to add data: $error"));
//   }
//
//   CollectionReference withConverter<T>(String collectionPath,
//       Function(Map<String, Object?>) fromJson, Map<String, dynamic> toJson) {
//     CollectionReference data =
//         FirebaseFirestore.instance.collection(collectionPath).withConverter<T>(
//               fromFirestore: (snapshot, _) => fromJson(snapshot.data()!),
//               toFirestore: (T, _) => toJson,
//             );
//
//     return data;
//   }
// }
