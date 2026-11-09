import '../../domain/models/issue_statistics.dart';
import '../dto/issue_statistics_dto.dart';

// Converts a transport DTO into a domain model used by the app screen.
extension IssueStatisticsDtoMapper on IssueStatisticsDto {
  IssueStatistics toDomain() => IssueStatistics(
    milestoneId: milestoneId,
    milestoneTitle: milestoneTitle,
    status: status,
    priority: priority,
    issueCount: issueCount,
  );
}
