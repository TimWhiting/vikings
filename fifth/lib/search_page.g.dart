// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page.dart';

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

String $pubRepositoryHash() => r'84cf58249e32ee9514705d307a691b0e33ab502a';

/// See also [pubRepository].
final PubRepositoryProvider = AutoDisposeProvider<PubRepository>(
  pubRepository,
  name: r'PubRepositoryProvider',
  debugGetCreateSourceHash:
      bool.fromEnvironment('dart.vm.product') ? null : $pubRepositoryHash,
);
typedef PubRepositoryRef = AutoDisposeProviderRef<PubRepository>;
String $fetchPackagesHash() => r'33f38dc4100e6d5a045981df62f432ffb46a8d35';

/// See also [fetchPackages].
final FetchPackagesProvider = AutoDisposeFutureProvider<List<Package>>(
  fetchPackages,
  name: r'FetchPackagesProvider',
  debugGetCreateSourceHash:
      bool.fromEnvironment('dart.vm.product') ? null : $fetchPackagesHash,
);
typedef FetchPackagesRef = AutoDisposeFutureProviderRef<List<Package>>;
