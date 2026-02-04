import 'package:flutter/material.dart';
import 'package:lab_8/screens/form_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import './providers/transaction_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        title: 'Transaction App',
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: TabBarView(
              children: [
                MyHomePage(title: 'Transaction App'),
                FormScreen(),
              ],
            ),
            bottomNavigationBar: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.add),
                  text: "Add Transaction",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
