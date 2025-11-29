import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          /// Home / Lista de Gastos
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Listado de Gastos'),
            onTap: () {
              context.go('/');
              Navigator.pop(context); // cerrar drawer
            },
          ),

          /// Añadir gasto
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Añadir Gasto'),
            onTap: () {
              context.go('/add');
              Navigator.pop(context);
            },
          ),

          /// Estadísticas
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Estadísticas'),
            onTap: () {
              context.go('/stats');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
