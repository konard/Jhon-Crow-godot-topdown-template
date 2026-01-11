# Godot Top-Down Template

A template project for creating top-down games in Godot 4.3+.

## Requirements

- [Godot Engine 4.3](https://godotengine.org/download) or later

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
│   └── ui/                # UI scenes
├── scripts/               # GDScript files (.gd)
│   ├── main.gd            # Main scene script
│   ├── levels/            # Level scripts
│   │   └── test_tier.gd   # Test tier script
│   ├── autoload/          # Autoload/singleton scripts
│   ├── characters/        # Character scripts
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
A test level/tier for developing and testing game mechanics. Includes a basic structure with:
- Camera2D for viewport control
- Environment node for level elements
- Entities node for game objects (player, enemies, etc.)
- UI layer for HUD elements

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
