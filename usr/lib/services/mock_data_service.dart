import 'package:flutter/material.dart';

class MockDataService {
  // Singleton
  static final MockDataService _instance = MockDataService._internal();
  factory MockDataService() => _instance;
  MockDataService._internal();

  // Dados em memória
  final List<Map<String, String>> _users = [
    {'name': 'Admin User', 'email': 'admin@empresa.com', 'password': '123456', 'role': 'Diretor'},
    {'name': 'Carlos Silva', 'email': 'carlos@empresa.com', 'password': '123456', 'role': 'Gerente de Vendas'},
    {'name': 'Ana Souza', 'email': 'ana@empresa.com', 'password': '123456', 'role': 'Desenvolvedora'},
  ];

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

  Map<String, String>? _currentUser;

  // Getters
  List<Map<String, String>> get users => List.unmodifiable(_users);
  List<Map<String, String>> get announcements => List.unmodifiable(_announcements);
  Map<String, String>? get currentUser => _currentUser;

  // Métodos
  bool login(String email, String password) {
    try {
      final user = _users.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
      );
      _currentUser = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _currentUser = null;
  }

  bool register(String name, String email, String password, String role) {
    if (_users.any((u) => u['email'] == email)) {
      return false; // Usuário já existe
    }
    _users.add({
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    });
    return true;
  }

  void addAnnouncement(String title, String content) {
    final date = DateTime.now();
    final formattedDate = "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    
    _announcements.insert(0, {
      'title': title,
      'content': content,
      'date': formattedDate,
      'author': _currentUser?['role'] ?? 'Funcionário',
    });
  }
}
