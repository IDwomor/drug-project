/*
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FetchData extends StatelessWidget {
  FetchData({super.key});
  final ref = FirebaseDatabase.instance.ref('drugs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return Card(
                      color: Colors.amber,
                      child: ListTile(
                        title: Text(
                          snapshot.child('0').value.toString(),
                          style: TextStyle(color: Colors.black87),
                        ),
                        subtitle: Text(snapshot.child('id').value.toString()),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
*/
