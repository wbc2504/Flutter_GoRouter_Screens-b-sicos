import '../../../domain/entities/expense.dart';
import '../../../domain/repositories/expense_repository.dart';

//Como no contamos con base de datos para este proyecto utilizamos memoria

class ExpenseRepositoryInMemory implements ExpenseRepository { // implementa la interfaz ExpenseRepository en memoria
  final List<Expense> _storage = []; // Lista como almacenamiento temporal

  @override
  Future<List<Expense>> getAllExpenses() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return List.unmodifiable(_storage);     //retorna version inmutable de la lista de gastos
  }

  @override
  Future<void> addExpense(Expense expense) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _storage.add(expense);   // Agraga un gasto recibido en memoria
  }
}

