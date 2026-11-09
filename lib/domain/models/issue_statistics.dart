class IssueStatistics {
  final int milestoneId;
  final String milestoneTitle;
  final String status;
  final String priority;
  final int issueCount;

  const IssueStatistics({
    required this.milestoneId,
    required this.milestoneTitle,
    required this.status,
    required this.priority,
    required this.issueCount,
  });
}
