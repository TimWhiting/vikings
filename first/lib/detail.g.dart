// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

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

String $PackageMetricsHash() => r'46a801875f78179dd126938ee4dc12a95cc40c2d';

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
///
/// Copied from [PackageMetrics].
class PackageMetricsProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PackageMetrics,
        PackageMetricsScore> {
  PackageMetricsProviderProvider({
    required this.packageName,
  }) : super(
          () => PackageMetrics()..packageName = packageName,
          from: PackageMetricsProvider,
          name: r'PackageMetricsProvider',
          debugGetCreateSourceHash: bool.fromEnvironment('dart.vm.product')
              ? null
              : $PackageMetricsHash,
          cacheTime: 3000,
        );

  final String packageName;

  @override
  bool operator ==(Object other) {
    return other is PackageMetricsProviderProvider &&
        other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<PackageMetricsScore> runNotifierBuild(
    covariant _$PackageMetrics notifier,
  ) {
    return notifier.build(
      packageName: packageName,
    );
  }
}

typedef PackageMetricsRef
    = AutoDisposeAsyncNotifierProviderRef<PackageMetricsScore>;

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
///
/// Copied from [PackageMetrics].
final PackageMetricsProvider = PackageMetricsProviderFamily();

class PackageMetricsProviderFamily
    extends Family<AsyncValue<PackageMetricsScore>> {
  PackageMetricsProviderFamily();

  PackageMetricsProviderProvider call({
    required String packageName,
  }) {
    return PackageMetricsProviderProvider(
      packageName: packageName,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<PackageMetrics, PackageMetricsScore>
      getProviderOverride(
    covariant PackageMetricsProviderProvider provider,
  ) {
    return call(
      packageName: provider.packageName,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies =>
      throw UnimplementedError();

  @override
  int? get disposeDelay => null;

  @override
  int? get cacheTime => 3000;

  @override
  List<ProviderOrFamily>? get dependencies => throw UnimplementedError();

  @override
  String? get name => r'PackageMetricsProvider';
}

abstract class _$PackageMetrics
    extends BuildlessAutoDisposeAsyncNotifier<PackageMetricsScore> {
  late final String packageName;

  FutureOr<PackageMetricsScore> build({
    required String packageName,
  });
}

String $fetchPackageDetailsHash() =>
    r'53357c3cc3feba6c22b20d0897842aa4975dda07';

/// See also [fetchPackageDetails].
class FetchPackageDetailsProviderProvider
    extends AutoDisposeFutureProvider<Package> {
  FetchPackageDetailsProviderProvider({
    required this.packageName,
  }) : super(
          (ref) => fetchPackageDetails(
            ref,
            packageName: packageName,
          ),
          from: FetchPackageDetailsProvider,
          name: r'FetchPackageDetailsProvider',
          debugGetCreateSourceHash: bool.fromEnvironment('dart.vm.product')
              ? null
              : $fetchPackageDetailsHash,
          cacheTime: 3000,
        );

  final String packageName;

  @override
  bool operator ==(Object other) {
    return other is FetchPackageDetailsProviderProvider &&
        other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchPackageDetailsRef = AutoDisposeFutureProviderRef<Package>;

/// See also [fetchPackageDetails].
final FetchPackageDetailsProvider = FetchPackageDetailsProviderFamily();

class FetchPackageDetailsProviderFamily extends Family<AsyncValue<Package>> {
  FetchPackageDetailsProviderFamily();

  FetchPackageDetailsProviderProvider call({
    required String packageName,
  }) {
    return FetchPackageDetailsProviderProvider(
      packageName: packageName,
    );
  }

  @override
  AutoDisposeFutureProvider<Package> getProviderOverride(
    covariant FetchPackageDetailsProviderProvider provider,
  ) {
    return call(
      packageName: provider.packageName,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies =>
      throw UnimplementedError();

  @override
  int? get disposeDelay => null;

  @override
  int? get cacheTime => 3000;

  @override
  List<ProviderOrFamily>? get dependencies => throw UnimplementedError();

  @override
  String? get name => r'FetchPackageDetailsProvider';
}

String $likedPackagesHash() => r'7b4fe00e47924f085c2a746ea732ec98121f08d3';

/// See also [likedPackages].
final LikedPackagesProvider = AutoDisposeFutureProvider<List<String>>(
  likedPackages,
  name: r'LikedPackagesProvider',
  debugGetCreateSourceHash:
      bool.fromEnvironment('dart.vm.product') ? null : $likedPackagesHash,
);
typedef LikedPackagesRef = AutoDisposeFutureProviderRef<List<String>>;
String $pubRepositoryHash() => r'1f4dbfa0911f6467067fab244677acbcb8c7ad4e';

/// See also [pubRepository].
final PubRepositoryProvider = AutoDisposeProvider<PubRepository>(
  pubRepository,
  name: r'PubRepositoryProvider',
  debugGetCreateSourceHash:
      bool.fromEnvironment('dart.vm.product') ? null : $pubRepositoryHash,
);
typedef PubRepositoryRef = AutoDisposeProviderRef<PubRepository>;
