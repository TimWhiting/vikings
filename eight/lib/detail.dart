import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'pub_ui/appbar.dart';
import 'pub_ui/package_detail_body.dart';
import 'pub_ui/pub_repository.dart';
import 'search_page.dart';

part 'detail.g.dart';

@riverpod
Future<Package> fetchPackageDetails(
  FetchPackageDetailsRef ref, {
  required String packageName,
}) async {
  return ref
      .watch(PubRepositoryProvider)
      .getPackageDetails(packageName: packageName);
}

@riverpod
Future<PackageMetricsScore> getPackageMetrics(
  GetPackageMetricsRef ref, {
  required String packageName,
}) async {
  return ref
      .watch(PubRepositoryProvider)
      .getPackageMetrics(packageName: packageName);
}

/// The detail page of a package, typically reached by clicking on a package from [SearchPage].
class PackageDetailPage extends ConsumerWidget {
  const PackageDetailPage({Key? key, required this.packageName})
      : super(key: key);

  /// The name of the package that is inspected.
  final String packageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageDetails = ref.watch(
      FetchPackageDetailsProvider(packageName: packageName),
    );
    final metrics = ref.watch(
      GetPackageMetricsProvider(packageName: packageName),
    );

    return Scaffold(
      appBar: const PubAppbar(),
      body: packageDetails.when(
        error: (err, stack) => Text('Err $err'),
        loading: () => CircularProgressIndicator(),
        data: (package) {
          return metrics.when(
            error: (err, stack) => Text('Err $err'),
            loading: () => CircularProgressIndicator(),
            data: (metrics) {
              return PackageDetailBodyScrollView(
                packageName: packageName,
                packageVersion: package.latest.version,
                packageDescription: package.latest.pubspec.description,
                grantedPoints: metrics.grantedPoints,
                likeCount: metrics.likeCount,
                maxPoints: metrics.maxPoints,
                popularityScore: metrics.popularityScore * 100,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.favorite_border),
      ),
    );
  }
}
