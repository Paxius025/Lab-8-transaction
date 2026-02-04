import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/transaction_provider.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import './form_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.exit_to_app, color: Colors.red),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, child) {
          var count = provider.transactions.length;

          if (count <= 0) {
            return Center(
              child: Text("No data now..", style: TextStyle(fontSize: 35)),
            );
          } else {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, int index) {
                Transactions data = provider.transactions[index];
                return Card(
                  elevation: 5,
                  //margin: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(child: Text(data.amount.toString())),
                    ),
                    title: Text(data.title),
                    subtitle: Text(
                      DateFormat("dd/MM/yyyy HH:mm:ss").format(data.date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        provider.deleteTransaction(data);
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
