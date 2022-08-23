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

String $GetPackageMetricsHash() => r'1e813efe392f854e99e1b466b720d219b4a65d6f';

/// See also [GetPackageMetrics].
class GetPackageMetricsProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetPackageMetrics,
        PackageMetricsScore> {
  GetPackageMetricsProviderProvider({
    required this.packageName,
  }) : super(
          () => GetPackageMetrics()..packageName = packageName,
          from: GetPackageMetricsProvider,
          name: r'GetPackageMetricsProvider',
          debugGetCreateSourceHash: bool.fromEnvironment('dart.vm.product')
              ? null
              : $GetPackageMetricsHash,
        );

  final String packageName;

  @override
  bool operator ==(Object other) {
    return other is GetPackageMetricsProviderProvider &&
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
    covariant _$GetPackageMetrics notifier,
  ) {
    return notifier.build(
      packageName: packageName,
    );
  }
}

typedef GetPackageMetricsRef
    = AutoDisposeAsyncNotifierProviderRef<PackageMetricsScore>;

/// See also [GetPackageMetrics].
final GetPackageMetricsProvider = GetPackageMetricsProviderFamily();

class GetPackageMetricsProviderFamily
    extends Family<AsyncValue<PackageMetricsScore>> {
  GetPackageMetricsProviderFamily();

  GetPackageMetricsProviderProvider call({
    required String packageName,
  }) {
    return GetPackageMetricsProviderProvider(
      packageName: packageName,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<GetPackageMetrics, PackageMetricsScore>
      getProviderOverride(
    covariant GetPackageMetricsProviderProvider provider,
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
  int? get cacheTime => null;

  @override
  List<ProviderOrFamily>? get dependencies => throw UnimplementedError();

  @override
  String? get name => r'GetPackageMetricsProvider';
}

abstract class _$GetPackageMetrics
    extends BuildlessAutoDisposeAsyncNotifier<PackageMetricsScore> {
  late final String packageName;

  FutureOr<PackageMetricsScore> build({
    required String packageName,
  });
}

String $fetchPackageDetailsHash() =>
    r'b42a08337fcec551279dfc6d6eb431a17d2feb7f';

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
  int? get cacheTime => null;

  @override
  List<ProviderOrFamily>? get dependencies => throw UnimplementedError();

  @override
  String? get name => r'FetchPackageDetailsProvider';
}

String $getLikedPackagesHash() => r'35b7e436db28bd096dbe7db5e3d55008c4ec608f';

/// See also [getLikedPackages].
final GetLikedPackagesProvider = AutoDisposeFutureProvider<List<String>>(
  getLikedPackages,
  name: r'GetLikedPackagesProvider',
  debugGetCreateSourceHash:
      bool.fromEnvironment('dart.vm.product') ? null : $getLikedPackagesHash,
);
typedef GetLikedPackagesRef = AutoDisposeFutureProviderRef<List<String>>;
