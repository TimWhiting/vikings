import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

part 'pub_repository.freezed.dart';
part 'pub_repository.g.dart';

class PubRepository {
  static const packagesPackageSize = 100;
  static const searchPageSize = 10;

  final dio = Dio();

  Future<List<Package>> getPackages({
    required int page,
    CancelToken? cancelToken,
  }) async {
    assert(page > 0);
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages',
      queryParameters: <String, String>{'page': '$page'},
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packagesResponse = PubPackagesResponse.fromJson(response.data!);
    return packagesResponse.packages;
  }

  Future<List<SearchPackage>> searchPackages({
    required int page,
    required String search,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/search',
      queryParameters: <String, String>{'page': '$page', 'q': search},
    );
    // Returns {packages: [{ package: string }]}
    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packagesResponse = PubSearchResponse.fromJson(response.data!);
    return packagesResponse.packages;
  }

  Future<Package> getPackageDetails({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final dio = Dio();
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages/$packageName',
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packageResponse = Package.fromJson(response.data!);
    return packageResponse;
  }

  Future<PackageMetricsScore> getPackageMetrics({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages/$packageName/metrics',
    );

    final responseFuture = dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final likesUri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/packages/$packageName/likes',
    );

    /// Although the metrics request does include the likes count, it seems that
    /// the server caches the response for a long period of time.
    /// For the same of "http polling" showcase, we're separately fetching the likes
    /// count
    final likesResponsFuture = dio.getUri<Map<String, Object?>>(
      likesUri,
      cancelToken: cancelToken,
    );

    final metricsResponse =
        PackageMetricsResponse.fromJson((await responseFuture).data!);
    return metricsResponse.score.copyWith(
      likeCount: (await likesResponsFuture).data!['likes']! as int,
    );
  }

  Future<void> like({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/account/likes/$packageName',
    );

    await dio.putUri<void>(
      uri,
      cancelToken: cancelToken,
      options: Options(
        headers: <String, String>{'authorization': userToken},
      ),
    );
  }

  Future<void> unlike({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/account/likes/$packageName',
    );

    await dio.deleteUri<void>(
      uri,
      cancelToken: cancelToken,
      options: Options(headers: <String, String>{'authorization': userToken}),
    );
  }

  Future<List<String>> getLikedPackages({CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pub.dartlang.org',
      path: 'api/account/likes',
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
      options: Options(
        headers: <String, String>{'authorization': userToken},
      ),
    );

    final packageResponse = LikedPackagesResponse.fromJson(response.data!);
    return packageResponse.likedPackages.map((e) => e.package).toList();
  }
}

const userToken =
    'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjE3MjdiNmI0OTQwMmI5Y2Y5NWJlNGU4ZmQzOGFhN2U3YzExNjQ0YjEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiODE4MzY4ODU1MTA4LWU4c2thb3BtNWloNW5iYjgydmhoNjZrN2Z0NW83ZG4zLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiODE4MzY4ODU1MTA4LWU4c2thb3BtNWloNW5iYjgydmhoNjZrN2Z0NW83ZG4zLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA0MjM3Mzc5ODQ2Mzc0OTAzNjIxIiwiZW1haWwiOiJkYXJreTEyc0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IjBpcXRvWjRQRENEZEM0OXdLZUJZeGciLCJuYW1lIjoiUmVtaSBSb3Vzc2VsZXQiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FGZFp1Y3BzQjhUdUtoTHhZeFdVLWQ1T2FGUVBIX3gtRFFJNnJuVV96cjVDUXc9czk2LWMiLCJnaXZlbl9uYW1lIjoiUmVtaSIsImZhbWlseV9uYW1lIjoiUm91c3NlbGV0IiwibG9jYWxlIjoiZnIiLCJpYXQiOjE2NjEyODM5ODIsImV4cCI6MTY2MTI4NzU4MiwianRpIjoiM2E0MmZkZDcxYzJhMGQ5ZmMzYTA1NDYzZmM2ODFjNWMyYzNiOTEwYyJ9.f4BNLrvlK_CaW94it-1LrHSJGn393GNXXI0OJ1n31gxqA9OaEgw_eemb4o1AjL7MgJXZMr9ylV0SPOeuo8ZMgPtYDS0pvhu7GISNQK_KFsqehoSI6lPsW0WlmSYEmOh0huf8EwdHNB0M67mazteBjm4Hf7INj2yeptrxasspkaTIVFzOMCpF1bg7yPsLnw9989iP2_a3eWIwpsJemBqWCv0vzbFQf_zUc0xMgZ4QruV-tMrYpTdsPZf5UFdwTLnaZJJbXyzcUCR-VrdLClZHocgMxHWu5Xwme_eDKCXmqt-DceCLz91Ugv1SA2F_t-eWK7yYozz0TnMX92LMMYwLkw';

@freezed
class PackageMetricsScore with _$PackageMetricsScore {
  factory PackageMetricsScore({
    required int grantedPoints,
    required int maxPoints,
    required int likeCount,
    required double popularityScore,
    required List<String> tags,
  }) = _PackageMetricsScore;

  factory PackageMetricsScore.fromJson(Map<String, Object?> json) =>
      _$PackageMetricsScoreFromJson(json);
}

@freezed
class PackageMetricsResponse with _$PackageMetricsResponse {
  factory PackageMetricsResponse({
    required PackageMetricsScore score,
  }) = _PackageMetricsResponse;

  factory PackageMetricsResponse.fromJson(Map<String, Object?> json) =>
      _$PackageMetricsResponseFromJson(json);
}

@freezed
class PackageDetails with _$PackageDetails {
  factory PackageDetails({
    required String version,
    required Pubspec pubspec,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(Map<String, Object?> json) =>
      _$PackageDetailsFromJson(json);
}

@freezed
class Package with _$Package {
  factory Package({
    required String name,
    required PackageDetails latest,
  }) = _Package;

  factory Package.fromJson(Map<String, Object?> json) =>
      _$PackageFromJson(json);
}

@freezed
class LikedPackage with _$LikedPackage {
  factory LikedPackage({required String package, required bool liked}) =
      _LikedPackage;

  factory LikedPackage.fromJson(Map<String, Object?> json) =>
      _$LikedPackageFromJson(json);
}

@freezed
class LikedPackagesResponse with _$LikedPackagesResponse {
  factory LikedPackagesResponse({required List<LikedPackage> likedPackages}) =
      _LikesPackagesResponse;

  factory LikedPackagesResponse.fromJson(Map<String, Object?> json) =>
      _$LikedPackagesResponseFromJson(json);
}

@freezed
class PubPackagesResponse with _$PubPackagesResponse {
  factory PubPackagesResponse({
    required List<Package> packages,
  }) = _PubPackagesResponse;

  factory PubPackagesResponse.fromJson(Map<String, Object?> json) =>
      _$PubPackagesResponseFromJson(json);
}

@freezed
class SearchPackage with _$SearchPackage {
  factory SearchPackage({required String package}) = _SearchPackage;

  factory SearchPackage.fromJson(Map<String, Object?> json) =>
      _$SearchPackageFromJson(json);
}

@freezed
class PubSearchResponse with _$PubSearchResponse {
  factory PubSearchResponse({
    required List<SearchPackage> packages,
  }) = _PubSearchResponse;

  factory PubSearchResponse.fromJson(Map<String, Object?> json) =>
      _$PubSearchResponseFromJson(json);
}
