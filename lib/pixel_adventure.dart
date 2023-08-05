import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'levels/Level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() {
    return const Color(0xFF211F30);
  }

  late final CameraComponent cam;
  final world = Level(levelNum: 2);

  @override
  FutureOr<void> onLoad() async {
    //load all images into cache
    await images.loadAllImages();
    cam = CameraComponent.withFixedResolution(
        world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);

    return super.onLoad();
  }
}
