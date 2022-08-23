import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_app/pub_ui/appbar.dart';
import 'package:pub_app/pub_ui/package_item.dart';

class Package {
  Package(this.name);

  final String name;
}

final fetchPackages = Provider<List<Package>>((ref) {
  return [
    Package('riverpod'),
    Package('provider'),
    Package('flutter_hooks'),
  ];
});

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PubAppbar(),
      body: ListView(
        children: [
          for (final package in ref.watch(fetchPackages))
            PackageItem(
              name: package.name,
            ),
        ],
      ),
    );
  }
}
