import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pub_ui/appbar.dart';
import 'pub_ui/package_detail_body.dart';

/// The detail page of a package, typically reached by clicking on a package from [SearchPage].
class PackageDetailPage extends ConsumerWidget {
  const PackageDetailPage({Key? key, required this.packageName})
      : super(key: key);

  /// The name of the package that is inspected.
  final String packageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PubAppbar(),
      body: PackageDetailBodyScrollView(
        packageName: packageName,
        packageVersion: '0.0.0',
        packageDescription: 'description',
        grantedPoints: 130,
        likeCount: 4242,
        maxPoints: 140,
        popularityScore: 42,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.favorite_border),
      ),
    );
  }
}
