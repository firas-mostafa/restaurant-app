import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key, required this.documentId});
  final String documentId;
  @override
  Widget build(BuildContext context) {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    return FutureBuilder<DocumentSnapshot>(
        future: orders.doc(documentId).get(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapShot.data!.data() as Map<String, dynamic>;
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.5)
                  ]),
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary)),
              child: Column(
                children: [
                  Text(data['order']),
                ],
              ),
            );
          } else {
            return const Text('Loading...');
          }
        });
  }
}
