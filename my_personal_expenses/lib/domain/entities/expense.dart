class Expense {
  final String id;
  final String description;
  final String category;
  final double amount;
  final DateTime date;

//constructor
  Expense({       
    required this.id,
    required this.description,
    required this.category,
    required this.amount,
    required this.date, // fecha
  });
}