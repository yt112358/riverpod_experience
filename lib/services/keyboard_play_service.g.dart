// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_play_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(keyboardPlayService)
const keyboardPlayServiceProvider = KeyboardPlayServiceProvider._();

final class KeyboardPlayServiceProvider extends $FunctionalProvider<
    KeyboardPlayService,
    KeyboardPlayService,
    KeyboardPlayService> with $Provider<KeyboardPlayService> {
  const KeyboardPlayServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'keyboardPlayServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$keyboardPlayServiceHash();

  @$internal
  @override
  $ProviderElement<KeyboardPlayService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KeyboardPlayService create(Ref ref) {
    return keyboardPlayService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeyboardPlayService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeyboardPlayService>(value),
    );
  }
}

String _$keyboardPlayServiceHash() =>
    r'43a7d2ddc1cd95cbfbe9905e716c4aad8232f2f2';
