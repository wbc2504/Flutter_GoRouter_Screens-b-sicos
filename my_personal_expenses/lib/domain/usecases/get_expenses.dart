import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class GetExpenses {
  final ExpenseRepository repository; //dependencia para acceder a los gastos
  GetExpenses(this.repository); //constructor para inyectar la dependencia

  Future<List<Expense>> call() => repository.getAllExpenses();
}

