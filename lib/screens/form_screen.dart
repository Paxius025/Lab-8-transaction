import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {

  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add transaction'),
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: true,
                validator: (String? str) {
                  if (str == "") return "Please enter item name";
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "จํานวนเงิน"),
                keyboardType: TextInputType.number,

                validator: (String? str) {
                  if (str == "") return "Please enter Amount";
                  if (double.parse(str.toString()) <= 0)
                    return "Please enter value more than 0";
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  if(fromKey.currentState!.validate()) {
                  Navigator.pop(context);
                  };
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: Text("บันทึก"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
