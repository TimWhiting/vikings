import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_app/detail.dart';
import 'package:pub_app/pub_ui/appbar.dart';
import 'package:pub_app/pub_ui/package_item.dart';
import 'package:pub_app/pub_ui/pub_repository.dart';
import 'package:pub_app/pub_ui/searchbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_page.g.dart';

@riverpod
PubRepository pubRepository(PubRepositoryRef ref) {
  return PubRepository();
}

@riverpod
Future<List<Package>> fetchPackages(FetchPackagesRef ref) async {
  final repository = ref.watch(PubRepositoryProvider);

  return repository.getPackages(page: 0);
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
            child: ref.watch(FetchPackagesProvider).when(
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text('Error $err'),
                data: (packages) {
                  return ListView(
                    children: [
                      for (final package in packages)
                        PackageItem(
                          name: package.name,
                          version: package.latest.version,
                          description: package.latest.pubspec.description,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PackageDetailPage(
                                packageName: package.name,
                              );
                            }),
                          ),
                        ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
