import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice1/src/model/movie.dart';
import 'package:practice1/src/provider/firebase_firestore.dart';
import 'package:practice1/src/service/native_add.dart';

import 'package:provider/provider.dart';

import 'package:practice1/src/provider/firebase_auth.dart';

class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<FirebaseAuthProvider>(context);
    final _firestore = Provider.of<FirebaseFirestoreProvider>(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_auth.getUser()?.uid ?? "none"),
          Text(_auth.getUser()?.phoneNumber ?? "None"),
          OutlinedButton(
              onPressed: () async {
                CollectionReference users =
                    _firestore.getFirestoreInstance().collection('users');
                String documentId =
                    (await users.snapshots().first).docs.first.id;
                // print((await _firestore.readData('users', documentId)));

                await _firestore.deleteData('users', documentId);
              },
              child: Text("Firestore")),
          Text('1+2 == ${nativeAdd(1, 2)}'),
          // OutlinedButton(
          //     onPressed: () async {
          //       // Map<String, Object?> data = {
          //       //   'title': 'Eternals',
          //       //   'genre': 'Action'
          //       // };
          //       // Map<String, Object?> data2 = {
          //       //   'title': 'LaLa Land',
          //       //   'genre': 'Romance'
          //       // };
          //       // final moviesRef = await _firestore.withConverter<Movie>(
          //       //     'movies', Movie.fromJson, data);
          //       // moviesRef.firestore;
          //
          //       // equal below
          //       //
          //       // final moviesRef = await _firestore.withConverter<Movie>(
          //       //     'movies',
          //       //     Movie.fromJson,
          //       //     Movie(
          //       //             title: 'Star Wars: A New Hope (Episode IV)',
          //       //             genre: 'Sci-fi')
          //       //         .toJson());
          //
          //       // add
          //       // await moviesRef.add(
          //       //   Movie(
          //       //       title: 'Star Wars: A New Hope (Episode IV)',
          //       //       genre: 'Sci-fi'),
          //       // );
          //
          //       // get
          //       // String genre = (await moviesRef
          //       //         .snapshots(includeMetadataChanges: true)
          //       //         .first)
          //       //     .docs
          //       //     .first
          //       //     .get('genre');
          //       // print(genre);
          //
          //       // update
          //       // _firestore.updateData('movies', (await moviesRef.snapshots().first).docs.first.id, data2);
          //
          //       // delete
          //       _firestore.deleteData('movies',(await moviesRef.snapshots().first).docs.first.id);
          //
          //     },
          //     child: Text("Movies"))
        ],
      ),
    ));
  }
}
