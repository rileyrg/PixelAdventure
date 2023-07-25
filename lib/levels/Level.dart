import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure/actors/Player.dart';

class Level extends World {
  late TiledComponent level;
  late Player player;

  @override
  Future<void> onLoad() async {
    level = await TiledComponent.load("Level-01.tmx", Vector2.all(16));
    add(level);
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>("Spawnpoints");
    for (final spawnPoint in spawnPointsLayer!.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          player = Player(
              character: "Ninja Frog",
              position: Vector2(spawnPoint.x, spawnPoint.y));
          add(player);
      }
    }
    return super.onLoad();
  }
}
