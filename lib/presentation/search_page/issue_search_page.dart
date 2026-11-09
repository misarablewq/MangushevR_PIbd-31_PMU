import 'package:flutter/material.dart';

import '../../data/repositories/issue_repository.dart';
import '../../domain/models/issue_statistics.dart';
import '../../domain/repositories/api_interface.dart';

class IssueSearchPage extends StatefulWidget {
  const IssueSearchPage({super.key});

  @override
  State<IssueSearchPage> createState() => _IssueSearchPageState();
}

class _IssueSearchPageState extends State<IssueSearchPage> {
  final ApiInterface _repository = IssueRepository();

  String _selectedStatus = 'OPEN';
  late Future<List<IssueStatistics>> _searchResult;

  @override
  void initState() {
    super.initState();
    _searchResult = _repository.loadData(status: _selectedStatus);
  }

  void _search() {
    setState(() {
      _searchResult = _repository.loadData(status: _selectedStatus);
    });
  }

  String _statusName(String status) {
    switch (status) {
      case 'OPEN':
        return 'Открыта';
      case 'IN_PROGRESS':
        return 'В работе';
      case 'CLOSED':
        return 'Закрыта';
      default:
        return status;
    }
  }

  String _priorityName(String priority) {
    switch (priority) {
      case 'LOW':
        return 'Низкий';
      case 'MEDIUM':
        return 'Средний';
      case 'HIGH':
        return 'Высокий';
      default:
        return priority;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Задачи проекта'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Поиск задач по статусу',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedStatus,
                        decoration: const InputDecoration(
                          labelText: 'Статус задачи',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'OPEN',
                            child: Text('Открыта'),
                          ),
                          DropdownMenuItem(
                            value: 'IN_PROGRESS',
                            child: Text('В работе'),
                          ),
                          DropdownMenuItem(
                            value: 'CLOSED',
                            child: Text('Закрыта'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedStatus = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: _search,
                        icon: const Icon(Icons.search),
                        label: const Text('Найти'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<IssueStatistics>>(
                future: _searchResult,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.cloud_off_outlined,
                              size: 48,
                              color: Colors.blueGrey,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Не удалось получить данные. Проверьте, что backend запущен на компьютере.',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${snapshot.error}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 12),
                            OutlinedButton.icon(
                              onPressed: _search,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Повторить'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final results = snapshot.data ?? const <IssueStatistics>[];
                  if (results.isEmpty) {
                    return const Center(
                      child: Text('Для выбранного статуса задач не найдено.'),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final item = results[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.shade50,
                            child: Text('${item.issueCount}'),
                          ),
                          title: Text(item.milestoneTitle),
                          subtitle: Text(
                            'Статус: ${_statusName(item.status)}\n'
                            'Приоритет: ${_priorityName(item.priority)}',
                          ),
                          isThreeLine: true,
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
