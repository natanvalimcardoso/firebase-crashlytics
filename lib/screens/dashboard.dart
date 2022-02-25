// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:curso_alura_2/screens/contacts_list.dart';
import 'package:curso_alura_2/widget/feature_item.dart';
import 'package:flutter/material.dart';

import 'transactions_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 1,
              child: Image.asset("assets/images/bytebank_logo.png"),
            ),
          ),
          SizedBox(
            height: 110,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Row(
                children: [
                  // ignore: prefer_const_constructors
                  FeatureItem(
                      title: 'Transfer',
                      icons: Icons.monetization_on,
                      route: ContactsList()),
                  FeatureItem(
                      title: 'Transaction Feed',
                      icons: Icons.description,
                      route: TransactionsList()),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
