import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/transaction_list_screen.dart';
import 'screens/add_edit_screen.dart';
import 'providers/transaction_provider.dart'; // ArchitectureProvider
import 'services/app_db.dart';        // ArchitectureEntity

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.instance.database; // init DB
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architecture Cards',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: TransactionListScreen.routeName,
      routes: {
        TransactionListScreen.routeName: (_) => const TransactionListScreen(),
        AddEditScreen.routeName: (_) => const AddEditScreen(),
      },
    );
  }
}
