import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtendo dados do serviço
    final employees = MockDataService().users;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(employee['name']![0].toUpperCase()),
            ),
            title: Text(employee['name']!),
            subtitle: Text(employee['role']!),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(employee['name']!),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cargo: ${employee['role']}'),
                        const SizedBox(height: 8),
                        Text('Email: ${employee['email']}'),
                        const SizedBox(height: 8),
                        const Text('Status: Ativo', style: TextStyle(color: Colors.green)),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
