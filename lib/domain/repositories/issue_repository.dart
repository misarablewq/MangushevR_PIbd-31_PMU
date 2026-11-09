import '../models/issue_statistics.dart';

// Abstract interface: describes what the app needs from an issue repository.
abstract interface class IssueRepository {
  Future<List<IssueStatistics>> searchByStatus(String status);
}
