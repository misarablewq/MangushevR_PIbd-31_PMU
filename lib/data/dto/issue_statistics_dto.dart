import '../../domain/models/issue_statistics.dart';

// DTO mirrors one JSON row returned by /issues/statistics.
class IssueStatisticsDto {
  final int milestoneId;
  final String milestoneTitle;
  final String status;
  final String priority;
  final int issueCount;

  const IssueStatisticsDto({
    required this.milestoneId,
    required this.milestoneTitle,
    required this.status,
    required this.priority,
    required this.issueCount,
  });

  factory IssueStatisticsDto.fromJson(Map<String, dynamic> json) {
    return IssueStatisticsDto(
      milestoneId: (json['milestoneId'] as num).toInt(),
      milestoneTitle: json['milestoneTitle'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      issueCount: (json['issueCount'] as num).toInt(),
    );
  }

  IssueStatistics toDomain() {
    return IssueStatistics(
      milestoneId: milestoneId,
      milestoneTitle: milestoneTitle,
      status: status,
      priority: priority,
      issueCount: issueCount,
    );
  }
}
