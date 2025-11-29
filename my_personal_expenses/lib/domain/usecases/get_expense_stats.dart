import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class ExpenseStats {
  final ExpenseRepository repository;
  ExpenseStats(this.repository);  // constructor

  Future<ExpenseStatistics> call() async {
    final list = await repository.getAllExpenses(); // Obtener la lista de gastos

    final total = list.fold<double>(0, (sum, e) => sum + e.amount); // Sumar todos los gastos
    final double avg = list.isNotEmpty ? total / list.length : 0; // calculo del promedio de gastos

    return ExpenseStatistics(
      total: total,
      average: avg,
      count: list.length,
    );
  }
}


class ExpenseStatistics {
  final double total;
  final double average;
  final int count;


  ExpenseStatistics({
    required this.total,
    required this.average,
    required this.count,
  });
}