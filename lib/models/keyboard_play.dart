import 'package:freezed_annotation/freezed_annotation.dart';

part 'keyboard_play.freezed.dart';

// データの型
@freezed
class KeyboardPlay with _$KeyboardPlay {
  final bool initialized;
  final int note;
  KeyboardPlay({
    required this.initialized,
    required this.note,
  });
}
