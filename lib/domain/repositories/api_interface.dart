import '../models/issue_statistics.dart';

// API contract: a repository must load statistic rows for one selected status.
abstract class ApiInterface {
  Future<List<IssueStatistics>> loadData({required String status});
}
