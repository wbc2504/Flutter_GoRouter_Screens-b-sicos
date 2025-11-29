import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/router.dart';
import 'data/repositories/expense_repository_in_memory.dart';
import 'domain/usecases/add_expense.dart';
import 'domain/usecases/get_expense_stats.dart';
import 'domain/usecases/get_expenses.dart';

void main() {
  final repository = ExpenseRepositoryInMemory();

  runApp(
    Provider<RepositoryBundle>(
      create: (_) => RepositoryBundle(
        getExpenses: GetExpenses(repository),
        addExpense: AddExpense(repository),
        expenseStats: ExpenseStats(repository),
      ),
      child: const MyApp(),
    ),
  );
}

class RepositoryBundle {
  final GetExpenses getExpenses;
  final AddExpense addExpense;
  final ExpenseStats expenseStats;

  RepositoryBundle({
    required this.getExpenses,
    required this.addExpense,
    required this.expenseStats,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Control de Gastos',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
