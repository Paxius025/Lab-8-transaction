import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});
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
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "ชื่อรายการ"),

                autofocus: true,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "จํานวนเงิน"),

                keyboardType: TextInputType.number,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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
