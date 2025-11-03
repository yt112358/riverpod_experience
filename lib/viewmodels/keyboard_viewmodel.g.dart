// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Memo this viewmodel will be stay in memory after complete of use.

@ProviderFor(KeyboardViewmodel)
const keyboardViewmodelProvider = KeyboardViewmodelProvider._();

/// Memo this viewmodel will be stay in memory after complete of use.
final class KeyboardViewmodelProvider
    extends $NotifierProvider<KeyboardViewmodel, AsyncValue<KeyboardPlay?>> {
  /// Memo this viewmodel will be stay in memory after complete of use.
  const KeyboardViewmodelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'keyboardViewmodelProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$keyboardViewmodelHash();

  @$internal
  @override
  KeyboardViewmodel create() => KeyboardViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<KeyboardPlay?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<KeyboardPlay?>>(value),
    );
  }
}

String _$keyboardViewmodelHash() => r'964ede4e754ca6a70a0a794743f217fd27228f60';

/// Memo this viewmodel will be stay in memory after complete of use.

abstract class _$KeyboardViewmodel
    extends $Notifier<AsyncValue<KeyboardPlay?>> {
  AsyncValue<KeyboardPlay?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<KeyboardPlay?>, AsyncValue<KeyboardPlay?>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<KeyboardPlay?>, AsyncValue<KeyboardPlay?>>,
        AsyncValue<KeyboardPlay?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
