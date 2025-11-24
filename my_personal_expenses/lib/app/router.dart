import 'package:go_router/go_router.dart';
import '../features/expenses/presentation/pages/add_expense_page.dart';
import '../features/expenses/presentation/pages/expenses_list_page.dart';
import '../features/expenses/presentation/pages/stats_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const ExpensesListPage(),
    ),
    GoRoute(
      path: '/add',
      builder: (_, __) => const AddExpensePage(),
    ),
    GoRoute(
      path: '/stats',
      builder: (_, __) => const StatsPage(),
    ),
  ],
);
