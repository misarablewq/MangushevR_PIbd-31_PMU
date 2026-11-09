import 'package:dio/dio.dart';

import '../../domain/models/issue_statistics.dart';
import '../../domain/repositories/api_interface.dart';
import '../api_config.dart';
import '../dto/issue_statistics_dto.dart';
import '../mappers/issue_statistics_mapper.dart';

// Repository implements the API contract and owns the remote data request.
class IssueRepository extends ApiInterface {
  // Dio is used for HTTP requests. baseUrl is the shared backend address.
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  @override
  Future<List<IssueStatistics>> loadData({required String status}) async {
    // Dio places this value in the query string:
    // /issues/statistics?status=OPEN
    final response = await _dio.get<List<dynamic>>(
      '/issues/statistics',
      queryParameters: {'status': status},
    );

    // If the server returns no body, use an empty list.
    final jsonRows = response.data ?? <dynamic>[];

    // Deserialize each JSON map into a DTO, then map the DTO to a domain model.
    return jsonRows
        .map(
          (json) =>
              IssueStatisticsDto.fromJson(json as Map<String, dynamic>)
                  .toDomain(),
        )
        .toList();
  }
}
