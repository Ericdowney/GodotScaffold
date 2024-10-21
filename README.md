# Godot Scaffold

This project contains a templatized version of a common setup for a Godot 4+ project. The setup provided by the default configuration is what I personally have used for my projects, but can be configured to match your setup as well.

## Steps

1. Create your Godot 4 project through the Godot project manager as normal.
2. Run the following following from within the the `GodotScaffold` project directory

```sh
ruby initproject.rb </path/to/godot/project> </path/to/config>
```

The first argument is the path to your newly created Godot project. The second argument is the path to your custom configuration file. If a custom configuration file is not provided the `DefaultConfig.yml` from the repository is used.

## Config

The `initproject.rb` script accepts a custom config or uses the default provided by the repository. The default config contains the following:

```yaml
FileSystem:
  - Assets
  - Assets/Audio
  - Assets/Characters
  - Assets/Environments
  - Assets/Player
  - Assets/UserInterface
  - Scenes
  - Scenes/Characters
  - Scenes/Environment
  - Scenes/Player
  - Scenes/UserInterface
  - Scenes/Prototypes
  - docs
  - Systems
  - Systems/Foundation
  - Systems/Player
  - Systems/Environment
  - Systems/Prototypes
  - Systems/UserInterface
```

This will create all listed items as directories within your project.

### Custom Config

If the `DefaultConfig.yml` file does not provide the setup you're looking for, you can create your own custom config file with the directories you want to include in your project. The only requirement is any directory must be provided as a child of `FileSystem` as can be seen in the example config above.

## Additonal Items

Additionally, a `script_templates`, `Scripts` directories, and a `.gitignore` will also be created within your project.

### Script Templates

These are custom `GDScript` templates I use in my project and will be automatically picked up by Godot 4+. They provide the default script setup with custom `#region`s for convenience.

### Scripts

The `Scripts` directory has custom Editor Scripts that can be run while editing scenes in Godot. They provide the following functionality:

* `AddBoundingBoxStaticBody3D` - Adds a StaticBody3D and CollisionShape3D to the selected nodes
* `SnapNodePositionToOther` - Snaps the global_position of the first selected node to the second selected node
* `SortNodesAlphabetically` - Sorts the child nodes of all selected nodes when run.
