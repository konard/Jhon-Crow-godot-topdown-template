# Godot Top-Down Template

A template project for creating top-down games in Godot 4.3+.

## Requirements

- [Godot Engine 4.3](https://godotengine.org/download) or later
- OpenGL 3.3 / OpenGL ES 3.0 compatible graphics (most systems from 2012+)

## Getting Started

1. Clone or download this repository
2. Open Godot Engine
3. Click "Import" and select the `project.godot` file
4. Press F5 to run the main scene

## Project Structure

```
godot-topdown-template/
├── project.godot          # Godot project configuration
├── icon.svg               # Project icon
├── scenes/                # All game scenes (.tscn files)
│   ├── main/              # Main scenes
│   │   └── Main.tscn      # Main entry scene (runs on F5)
│   ├── levels/            # Game levels/tiers
│   │   └── TestTier.tscn  # Test level for development
│   ├── characters/        # Character scenes
│   │   └── Player.tscn    # Player character with movement
│   └── ui/                # UI scenes
├── scripts/               # GDScript files (.gd)
│   ├── main.gd            # Main scene script
│   ├── levels/            # Level scripts
│   │   └── test_tier.gd   # Test tier script
│   ├── autoload/          # Autoload/singleton scripts
│   ├── characters/        # Character scripts
│   │   └── player.gd      # Player movement script
│   └── utils/             # Utility scripts
├── assets/                # Game assets
│   ├── sprites/           # 2D sprites and textures
│   ├── audio/             # Sound effects and music
│   └── fonts/             # Custom fonts
└── addons/                # Third-party Godot plugins
```

## Scenes

### Main.tscn
The main entry scene that loads when pressing F5. This is the starting point of the game and can be used to display menus or load other scenes.

### TestTier.tscn
A test level/tier (shooting range) for developing and testing game mechanics. This scene serves as a complete example of how to create a playable level with proper collision setup.

#### Features
- **Enclosed play area** with walls that prevent the player from leaving
- **Obstacles** placed within the arena for cover and movement testing
- **Target zone** with red shooting targets for future shooting mechanics
- **UI overlay** showing level name and control instructions

#### Scene Structure
```
TestTier
├── Environment
│   ├── Background      # Dark green background (1280x720)
│   ├── Floor           # Lighter green floor area
│   ├── Walls           # Brown walls with collision (StaticBody2D on layer 3)
│   │   ├── WallTop
│   │   ├── WallBottom
│   │   ├── WallLeft
│   │   └── WallRight
│   ├── Obstacles       # Brown obstacles with collision
│   │   ├── Obstacle1   # Square obstacle
│   │   ├── Obstacle2   # Square obstacle
│   │   └── Obstacle3   # Wide obstacle
│   ├── Targets         # Red target sprites (StaticBody2D)
│   │   ├── Target1
│   │   ├── Target2
│   │   └── Target3
│   └── TargetArea      # Label marking the target zone
├── Entities
│   └── Player          # Player instance at starting position
└── CanvasLayer
    └── UI              # HUD with level label and instructions
```

#### Collision Setup
- **Walls and Obstacles**: Use `collision_layer = 4` (layer 3: obstacles)
- **Player**: Uses `collision_mask = 4` to detect collisions with layer 3
- The player cannot pass through walls or obstacles

#### Running the Test Tier
To test the shooting range directly:
1. Open `scenes/levels/TestTier.tscn` in the Godot editor
2. Press F6 to run the current scene (or F5 if set as main scene)
3. Use WASD or Arrow Keys to move the player
4. Verify collision with walls and obstacles works correctly

### Player.tscn
The player character scene with smooth physics-based movement. Features:
- **CharacterBody2D** root node for physics-based movement
- **CollisionShape2D** with circular collision (16px radius)
- **Sprite2D** with placeholder texture (can be replaced with custom sprites)
- **Camera2D** that smoothly follows the player with configurable limits

#### Player Properties (Inspector)
| Property | Default | Description |
|----------|---------|-------------|
| `max_speed` | 200.0 | Maximum movement speed in pixels/second |
| `acceleration` | 1200.0 | How quickly the player reaches max speed |
| `friction` | 1000.0 | How quickly the player stops when not moving |

The player uses acceleration-based movement for smooth control without jitter. Diagonal movement is normalized to prevent faster diagonal speeds.

## Input Actions

The project includes pre-configured input actions for top-down movement:

| Action | Keys |
|--------|------|
| `move_up` | W, Up Arrow |
| `move_down` | S, Down Arrow |
| `move_left` | A, Left Arrow |
| `move_right` | D, Right Arrow |

## Physics Layers

Pre-configured collision layers for top-down games:

| Layer | Name | Purpose |
|-------|------|---------|
| 1 | player | Player character |
| 2 | enemies | Enemy characters |
| 3 | obstacles | Walls, barriers |
| 4 | pickups | Items, collectibles |
| 5 | projectiles | Bullets, spells |

## Best Practices

This template follows Godot best practices:

- **Snake_case naming** for files and folders
- **Scenes and scripts grouped together** or in parallel folder structures
- **Modular scene structure** with separate nodes for environment, entities, and UI
- **Input actions** instead of hardcoded key checks
- **Named collision layers** for clear physics setup

## Extending the Template

### Adding a New Level
1. Create a new scene in `scenes/levels/`
2. Add a corresponding script in `scripts/levels/`
3. Follow the structure of `TestTier.tscn`

### Adding a Character
1. Create a new scene in `scenes/characters/`
2. Add a corresponding script in `scripts/characters/`
3. Use CharacterBody2D as the root node for physics-based characters

### Adding Autoloads
1. Create a script in `scripts/autoload/`
2. Go to Project > Project Settings > Autoload
3. Add the script as a singleton

## License

See [LICENSE](LICENSE) for details.
