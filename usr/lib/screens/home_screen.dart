import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dados mockados de comunicados
  final List<Map<String, String>> _announcements = [
    {
      'title': 'Reunião Geral',
      'content': 'Haverá uma reunião geral nesta sexta-feira às 14h no auditório principal.',
      'date': '10/05/2024',
      'author': 'RH'
    },
    {
      'title': 'Manutenção do Sistema',
      'content': 'O sistema interno passará por manutenção no sábado à noite.',
      'date': '08/05/2024',
      'author': 'TI'
    },
    {
      'title': 'Novo Benefício',
      'content': 'Agora temos parceria com a academia SmartFit. Verifique seu e-mail para mais detalhes.',
      'date': '05/05/2024',
      'author': 'Diretoria'
    },
  ];

  void _addAnnouncement() {
    // Função placeholder para adicionar comunicado
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Novo Comunicado'),
        content: const Text('Funcionalidade de adicionar comunicado será implementada com o banco de dados.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunicados'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Usuário Demo'),
              accountEmail: const Text('usuario@empresa.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'U',
                  style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Comunicados'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Funcionários'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/employees');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Sair', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _announcements.length,
        itemBuilder: (context, index) {
          final item = _announcements[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item['author']!,
                          style: TextStyle(fontSize: 12, color: Colors.blue.shade900),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(item['content']!),
                  const SizedBox(height: 12),
                  Text(
                    item['date']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAnnouncement,
        child: const Icon(Icons.add),
      ),
    );
  }
}
