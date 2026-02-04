import 'package:flutter/material.dart';
import 'package:lab_8/model/transaction.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';

class FormScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add transaction'),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Item name"),
                autofocus: true,
                controller: titleController,
                validator: (String? str) {
                  if (str == "") return "Please enter item name";
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                controller: amountController,
                validator: (String? str) {
                  if (str == "") return "Please enter Amount";
                  if (double.parse(str.toString()) <= 0) {
                    return "Please enter value more than 0";
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;

                    Transactions statement = Transactions(
                      title: title,
                      amount: double.parse(amount),
                      date: DateTime.now(),
                    );

                    var provider = Provider.of<TransactionProvider>(
                      context,
                      listen: false,
                    );
                    provider.addTransaction(statement);

                    DefaultTabController.of(context).animateTo(0);

                    // Clear form
                    titleController.clear();
                    amountController.clear();
                  }
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// # Messy: Hard to read, hard to debug
// result = map(lambda x: x*2 if x > 10 else (x+5 if x < 5 else x), data)
