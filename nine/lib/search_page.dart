import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
Future<List<Package>> fetchPackages(
  FetchPackagesRef ref, {
  required int page,
  String search = '',
}) async {
  assert(page > 0, 'page offset starts at 1');
  if (search.isEmpty) {
    return ref.watch(PubRepositoryProvider).getPackages(page: page);
  }

  final searchedPackages = await ref
      .watch(PubRepositoryProvider)
      .searchPackages(page: page, search: search);

  return Future.wait([
    for (final package in searchedPackages)
      ref.watch(
        FetchPackageDetailsProvider(packageName: package.package).future,
      ),
  ]);
}

class SearchPage extends HookConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    useListenable(controller);

    return Scaffold(
      appBar: const PubAppbar(),
      body: Column(
        children: [
          SearchBar(controller: controller),
          Expanded(
            child: ListView.custom(
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                final pageLimit = controller.text.isNotEmpty
                    ? PubRepository.searchPageSize
                    : PubRepository.packagesPackageSize;

                final page = index ~/ pageLimit + 1;
                final itemIndexInPage = index % pageLimit;

                final packages = ref.watch(
                  FetchPackagesProvider(page: page, search: controller.text),
                );

                return packages.when(
                  loading: () => PackageItemShimmer(),
                  error: (err, stack) => Text('err $err'),
                  data: (packages) {
                    if (itemIndexInPage >= packages.length) return null;

                    final package = packages[itemIndexInPage];

                    return PackageItem(
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
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
