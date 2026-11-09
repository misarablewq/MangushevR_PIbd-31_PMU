import 'package:json_annotation/json_annotation.dart';

part 'issue_statistics_dto.g.dart';

// One object in the JSON array returned by the backend statistics endpoint.
@JsonSerializable(createToJson: false)
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

  // Generated factory reads the JSON keys and fills the fields above.
  factory IssueStatisticsDto.fromJson(Map<String, dynamic> json) =>
      _$IssueStatisticsDtoFromJson(json);
}
