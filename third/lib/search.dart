import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_app/pub_ui/appbar.dart';
import 'package:pub_app/pub_ui/package_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

class Package {
  Package(this.name);

  final String name;
}

@riverpod
List<Package> fetchPackages(FetchPackagesRef ref) {
  print('fetch');
  return [
    Package('riverpod'),
    Package('provider'),
    Package('flutter_hooks'),
    Package('freezed'),
  ];
}

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PubAppbar(),
      body: ListView(
        children: [
          for (final package in ref.watch(FetchPackagesProvider))
            PackageItem(
              name: package.name,
            ),
        ],
      ),
    );
  }
}
