import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_app/detail.dart';
import 'package:pub_app/pub_ui/appbar.dart';
import 'package:pub_app/pub_ui/package_item.dart';
import 'package:pub_app/pub_ui/searchbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_page.g.dart';

class Package {
  Package(this.name);
  final String name;
}

@riverpod
List<Package> fetchPackages(FetchPackagesRef ref) {
  return [
    Package('riverpod'),
    Package('freezed'),
    Package('flutter_hooks'),
    // TODO show hot-reload
  ];
}

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PubAppbar(),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: ListView(
              children: [
                for (final package in ref.watch(FetchPackagesProvider))
                  PackageItem(
                    name: package.name,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return PackageDetailPage(packageName: package.name);
                      }),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
