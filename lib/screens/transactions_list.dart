
import 'package:flutter/material.dart';
import '../http/webclients/TransactionWebClient.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final TransactionWebClient webClient = TransactionWebClient();

    return Scaffold(


        appBar: AppBar(
          title: const Text('Transactions'),
        ),
        body: FutureBuilder<List<Transaction>>(
          future: webClient.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Transaction>? transactions = snapshot.data;
                  if (transactions != null) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactions[index];
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: Text(
                              transaction.value.toString(),
                              style:  TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              transaction.contact!.name,
                              style:  TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: transactions.length,
                    );
                  }
                }

                return  Center(
                  child: Text('No transactions found'),
                );
            }
            return  Text('Unknown error');
          },
        ));
  }
}


