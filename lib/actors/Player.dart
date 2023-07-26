import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState { idle, running }

enum PlayerDirection { left, right, none }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  String character;
  late final SpriteAnimation idleAnimation;

  late final SpriteAnimation runAnimation;
  final double stepTime = 0.05;

  PlayerDirection playerDirection = PlayerDirection.none;
  double moveSpeed = 100;
  Vector2 velocity = Vector2.zero();

  Player({position, required this.character}) : super(position: position);
  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _updatePlayerMovement(dt);
    super.update(dt);
  }

  void _loadAllAnimations() {
    final SpriteAnimation idleAnimation = _spriteAnimation("Idle", 11);
    final SpriteAnimation runAnimation = _spriteAnimation("Run", 12);

    //list of all animationms
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runAnimation
    };

    //set current animation
    current = PlayerState.running;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
        game.images.fromCache("Main Characters/$character/$state (32x32).png"),
        SpriteAnimationData.sequenced(
            amount: amount, stepTime: stepTime, textureSize: Vector2.all(32)));
  }

  void _updatePlayerMovement(double dt) {
    double dirX = 0;
    switch (playerDirection) {
      case PlayerDirection.left:
        dirX = -moveSpeed;
        break;
      case PlayerDirection.right:
        dirX = moveSpeed;
        break;
      case PlayerDirection.none:
        break;
      default:
        break;
    }
    velocity = Vector2(dirX, 0);
    position = (position += velocity * dt);
    position.x %= 640;
  }
}
