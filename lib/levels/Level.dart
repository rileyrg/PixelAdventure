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
    player = Player();
    add(level);
    add(player);
    return super.onLoad();
  }
}
