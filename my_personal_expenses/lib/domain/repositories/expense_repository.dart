import '../entities/expense.dart';

//clase abstracta implementada de manera asincrona
abstract class ExpenseRepository {
  Future<List<Expense>> getAllExpenses(); // Devolver una lista de gastos
  Future<void> addExpense(Expense expense); // añadir gasto
}

