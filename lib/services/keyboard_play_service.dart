import 'dart:async';

import '../models/keyboard_play.dart';
import 'package:flutter_midi_pro/flutter_midi_pro.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'keyboard_play_service.g.dart';

abstract class KeyboardPlayService {
  Future<void> playNote(int note);
  Future<KeyboardPlay> initialize();
  Future<void> playPhrase(List<int> notes, int interval);
}

class KeyboardPlayServiceImpl extends KeyboardPlayService {
  KeyboardPlayServiceImpl({required this.ref});

  final Ref ref;

  final String _sffile = 'assets/Kids_Piano.sf2';
  MidiPro midiPro = MidiPro();

  @override
  Future<KeyboardPlay> initialize() async {
    print('KeyboardPlayService: initialize');
    int sfId = await midiPro.loadSoundfontAsset(
        assetPath: _sffile, bank: 0, program: 0);
    await midiPro.selectInstrument(sfId: sfId, channel: 0, bank: 0, program: 0);

    print('✅ AudioService: initialize done. $sfId');
    return KeyboardPlay(initialized: true, note: -1);
  }

  @override
  Future<void> playNote(int note) async {
    try {
      await midiPro.playNote(key: note);
    } catch (error) {
      throw Exception('playNote has error $error');
    }
  }

  @override
  Future<void> playPhrase(List<int> notes, int interval) async {
    if (notes.isEmpty) {
      return;
    }
    try {
      int i = 0;
      Timer.periodic(Duration(milliseconds: interval), (timer) async {
        await midiPro.playNote(key: notes[i]);
        i++;
        if (i == notes.length) {
          timer.cancel();
        }
      });
    } catch (error) {
      throw Exception('playNote has error $error');
    }
  }
}

@Riverpod(keepAlive: true)
KeyboardPlayService keyboardPlayService(Ref ref) {
  ref.onDispose(() {
    print("keyboardPlayService onDispose $ref");
  });
  final service = KeyboardPlayServiceImpl(ref: ref);
  return service;
}
