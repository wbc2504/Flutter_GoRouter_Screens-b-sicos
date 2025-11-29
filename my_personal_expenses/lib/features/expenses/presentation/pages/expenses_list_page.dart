import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/entities/expense.dart';
import '../../../../../domain/usecases/get_expenses.dart';
import '../widgets/app_drawer.dart';
import '../widgets/expense_card.dart';
import '../../../../../main.dart';

class ExpensesListPage extends StatefulWidget {
  const ExpensesListPage({super.key});

  @override
  State<ExpensesListPage> createState() => _ExpensesListPageState();
}

class _ExpensesListPageState extends State<ExpensesListPage> {
  late Future<List<Expense>> futureExpenses;

  @override
  void initState() {
    super.initState();
    final repo = Provider.of<RepositoryBundle>(context, listen: false);
    futureExpenses = repo.getExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Gastos'),
        actions: [
          IconButton(
            onPressed: () => context.go('/stats'),
            icon: const Icon(Icons.bar_chart),
          )
        ],
      ),

      drawer: const AppDrawer(),
      
      body: FutureBuilder<List<Expense>>(
        future: futureExpenses,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final list = snapshot.data!;

          if (list.isEmpty) {
            return const Center(child: Text('No hay gastos aún'));
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) => ExpenseCard(expense: list[i]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
