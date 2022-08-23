// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $fetchPackagesHash() => r'df3c1669e5fdbd9b4cfd6bacc190fb8934e64554';

/// See also [fetchPackages].
class FetchPackagesProviderProvider
    extends AutoDisposeFutureProvider<List<Package>> {
  FetchPackagesProviderProvider({
    required this.page,
    this.search = '',
  }) : super(
          (ref) => fetchPackages(
            ref,
            page: page,
            search: search,
          ),
          from: FetchPackagesProvider,
          name: r'FetchPackagesProvider',
          debugGetCreateSourceHash: bool.fromEnvironment('dart.vm.product')
              ? null
              : $fetchPackagesHash,
        );

  final int page;
  final String search;

  @override
  bool operator ==(Object other) {
    return other is FetchPackagesProviderProvider &&
        other.page == page &&
        other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchPackagesRef = AutoDisposeFutureProviderRef<List<Package>>;

/// See also [fetchPackages].
final FetchPackagesProvider = FetchPackagesProviderFamily();

class FetchPackagesProviderFamily extends Family<AsyncValue<List<Package>>> {
  FetchPackagesProviderFamily();

  FetchPackagesProviderProvider call({
    required int page,
    String search = '',
  }) {
    return FetchPackagesProviderProvider(
      page: page,
      search: search,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Package>> getProviderOverride(
    covariant FetchPackagesProviderProvider provider,
  ) {
    return call(
      page: provider.page,
      search: provider.search,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies =>
      throw UnimplementedError();

  @override
  int? get disposeDelay => null;

  @override
  int? get cacheTime => null;

  @override
  List<ProviderOrFamily>? get dependencies => throw UnimplementedError();

  @override
  String? get name => r'FetchPackagesProvider';
}
