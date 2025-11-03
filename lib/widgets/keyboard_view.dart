import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_keyboard/viewmodels/keyboard_viewmodel.dart';

class Keyboard extends ConsumerWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyboardNotifier = ref.watch(keyboardViewmodelProvider.notifier);
    final keyboardProvider = ref.watch(keyboardViewmodelProvider);
    Future<void> playNote(int note) async {
      keyboardNotifier.playNote(note, 0);
    }
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        ElevatedButton(
          onPressed: () => keyboardNotifier.playPhrase([60, 64, 67]),
          child: Text("Test play phrase"),
        ),
        Text("Key ${keyboardProvider.asData?.value?.note} played"),
        Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          children: [
            Container(
              color: Colors.white,
              width: 100,
              height: 150,
              child: GestureDetector(
                onTap: () => playNote(60),
                child: Text("Do"),
              ),
            ),
            Container(
              width: 100,
              height: 150,
              color: Colors.white,
              child: GestureDetector(
                onTap: () =>  playNote(62),
                child: Text("Re"),
              ),
            ),
            Container(
              width: 100,
              height: 150,
              color: Colors.white,
              child: GestureDetector(
                onTap: () =>  playNote(64),
                child: Text("Mi"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
