import 'package:flutter/material.dart';
import 'package:pub_app/detail.dart';
import 'package:pub_app/pub_ui/appbar.dart';
import 'package:pub_app/pub_ui/package_item.dart';
import 'package:pub_app/pub_ui/searchbar.dart';

class Package {
  Package(this.name);
  final String name;
}

final packages = [
  Package('riverpod'),
  Package('freezed'),
  Package('flutter_hooks'),
];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PubAppbar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: ListView(
              children: [
                for (final package in packages)
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
