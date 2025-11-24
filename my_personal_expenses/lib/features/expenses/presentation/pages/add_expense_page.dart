import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../../domain/entities/expense.dart';
import '../../../../../domain/usecases/add_expense.dart';
import '../../../../../main.dart';
import '../widgets/app_drawer.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _formKey = GlobalKey<FormState>();
  final descCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  String category = 'Varios';
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<RepositoryBundle>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Añadir Gasto')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese una descripción' : null,
              ),
              TextFormField(
                controller: amountCtrl,
                decoration: const InputDecoration(labelText: 'Monto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final n = double.tryParse(value ?? '');
                  return (n == null || n <= 0) ? 'Monto inválido' : null;
                },
              ),
              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(labelText: 'Categoría'),
                items: const [
                  'Varios',
                  'Alimentos',
                  'Transporte',
                  'Entretenimiento'
                ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (v) => setState(() => category = v!),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Fecha: ${date.toLocal().toString().split(' ')[0]}"),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() => date = picked);
                      }
                    },
                    child: const Text('Seleccionar fecha'),
                  )
                ],
              ),
              
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,   // color de fondo
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  final expense = Expense(
                    id: const Uuid().v4(),
                    description: descCtrl.text,
                    category: category,
                    amount: double.parse(amountCtrl.text),
                    date: date,
                  );

                  await repo.addExpense(expense);

                  context.go('/');
                },
                child: const Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
