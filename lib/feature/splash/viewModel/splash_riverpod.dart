import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'splash_state.dart';

final splashRiverpod = NotifierProvider<SplashRiverpod, SplashState>(() {
  return SplashRiverpod();
});

class SplashRiverpod extends Notifier<SplashState> {
  @override
  SplashState build() {
    return const SplashState();
  }
}
