import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

//agregar un gasto

class AddExpense {
  final ExpenseRepository repository;
  AddExpense(this.repository);  //constructor

  Future<void> call(Expense expense) => repository.addExpense(expense);
}
