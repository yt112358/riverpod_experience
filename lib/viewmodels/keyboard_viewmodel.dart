import '/models/keyboard_play.dart';
import '/services/keyboard_play_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'keyboard_viewmodel.g.dart';

/// Memo this viewmodel will be stay in memory after complete of use.
@Riverpod(keepAlive: true)
class KeyboardViewmodel extends _$KeyboardViewmodel {
  @override
  AsyncValue<KeyboardPlay?> build() {
    _initialize();
    return const AsyncValue.loading();
  }

  AsyncValue<KeyboardPlay?> get currentKeyboadPlay => state;

  Future<void> _initialize() async {
    state = const AsyncValue.loading();

    try {
      final service = ref.read(keyboardPlayServiceProvider);
      final keyboardPlayState = await service.initialize();
      state = AsyncValue.data(keyboardPlayState);
    } catch (e) {
      state = AsyncValue.error('Keyboard initialize error: $e', StackTrace.current);
    }
  }

  Future<void> playNote(int note, int? attribute) async {
    try {
      final keyboardPlayService = ref.read(keyboardPlayServiceProvider);
      if (state.asData?.value?.initialized == false) {
        await _initialize();
      }
      final initialized = state.asData?.value?.initialized ?? false;
      keyboardPlayService.playNote(note);

      final keyboardPlay = KeyboardPlay(
          initialized: initialized,
          note: note);
      state = AsyncValue.data(keyboardPlay);

    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> playPhrase(List<int> notes) async {
    try {
      final keyboardPlayService = ref.read(keyboardPlayServiceProvider);
      if (state.asData?.value?.initialized == false) {
        await _initialize();
      }
      final initialized = state.asData?.value?.initialized ?? false;
      keyboardPlayService.playPhrase(notes, 200);

      final keyboardPlay = KeyboardPlay(
          initialized: initialized,
          note: notes[notes.length - 1]);
      state = AsyncValue.data(keyboardPlay);

    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
