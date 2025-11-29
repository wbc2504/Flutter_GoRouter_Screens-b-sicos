import '../entities/expense.dart';

//Interfaz para persistencia de gastos

abstract class ExpenseRepository { 
  Future<List<Expense>> getAllExpenses(); // Devolver una lista de gastos
  Future<void> addExpense(Expense expense); // añadir gasto
}

