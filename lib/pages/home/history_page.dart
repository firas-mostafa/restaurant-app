import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/history_tile.dart';
import 'package:restoorder/provider/services/database/firestore.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<FirestoreService>().showOrder(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: context.watch<FirestoreService>().ordersHistory.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: HistoryTile(
                  documentId:
                      context.watch<FirestoreService>().ordersHistory[index]),
            );
          },
        );
      },
    );
  }
}
