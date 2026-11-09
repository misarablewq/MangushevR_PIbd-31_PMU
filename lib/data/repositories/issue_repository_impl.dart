import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/models/issue_statistics.dart';
import '../../domain/repositories/issue_repository.dart';
import '../api_config.dart';
import '../dto/issue_statistics_dto.dart';

// Concrete repository: sends HTTP requests and converts server JSON into app models.
class IssueRepositoryImpl implements IssueRepository {
  final http.Client _client;

  IssueRepositoryImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<List<IssueStatistics>> searchByStatus(String status) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}/issues/statistics')
        .replace(queryParameters: {'status': status});

    final response = await _client
        .get(uri)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception('Сервер вернул ошибку HTTP ${response.statusCode}');
    }

    final decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
    if (decodedJson is! List) {
      throw const FormatException('Сервер вернул данные в неожиданном формате');
    }

    return decodedJson
        .map(
          (item) =>
              IssueStatisticsDto.fromJson(item as Map<String, dynamic>)
                  .toDomain(),
        )
        .toList();
  }
}
