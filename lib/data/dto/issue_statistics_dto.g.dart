// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueStatisticsDto _$IssueStatisticsDtoFromJson(Map<String, dynamic> json) =>
    IssueStatisticsDto(
      milestoneId: (json['milestoneId'] as num).toInt(),
      milestoneTitle: json['milestoneTitle'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      issueCount: (json['issueCount'] as num).toInt(),
    );
