import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runAnimation;
  final double stepTime = 0.05;
  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = SpriteAnimation.fromFrameData(
        game.images.fromCache("Main Characters/Ninja Frog/Idle (32x32).png"),
        SpriteAnimationData.sequenced(
            amount: 11, stepTime: stepTime, textureSize: Vector2.all(32)));
    runAnimation = SpriteAnimation.fromFrameData(
        game.images.fromCache("Main Characters/Ninja Frog/Run (32x32).png"),
        SpriteAnimationData.sequenced(
            amount: 12, stepTime: stepTime, textureSize: Vector2.all(32)));

    //list of all animationms
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runAnimation
    };

    //set current animation
    current = PlayerState.running;
  }
}