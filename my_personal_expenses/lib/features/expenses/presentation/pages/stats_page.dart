import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/usecases/get_expense_stats.dart';
import '../../../../../main.dart';
import '../widgets/app_drawer.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<RepositoryBundle>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      drawer: const AppDrawer(),
      body: FutureBuilder<ExpenseStatistics>(
        future: repo.expenseStats(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final stats = snapshot.data!;

          /*return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Total: ${stats.total.toStringAsFixed(2)}'),
                Text('Promedio: ${stats.average.toStringAsFixed(2)}'),
                Text('Cantidad de gastos: ${stats.count}'),
              ],
            ),
          ); **/

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: DataTable(
              headingRowColor:
                  WidgetStateProperty.all(Colors.blue.withOpacity(0.2)),
              columns: const [
                DataColumn(label: Text('Estadística')),
                DataColumn(label: Text('Valor')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text('Total gastado')),
                  DataCell(Text('\$${stats.total.toStringAsFixed(2)}')),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Gasto promedio')),
                  DataCell(Text('\$${stats.average.toStringAsFixed(2)}')),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Cantidad de gastos')),
                  DataCell(Text(stats.count.toString())),
                ]),
              ],
            ),
          );
        },
      ),
    );
  }
}
