import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure/actors/Player.dart';

class Level extends World {
  late TiledComponent level;
  late Player player;

  final String levelName;
  Level({required this.levelName});

  @override
  Future<void> onLoad() async {
    level = await TiledComponent.load("$levelName.tmx", Vector2.all(16));
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
