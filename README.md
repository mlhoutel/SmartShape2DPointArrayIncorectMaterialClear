# SmartShape2D Point Array Incorrect Material Clear (MRP)

## Linked issue

https://github.com/SirRamEsq/SmartShape2D/issues/181

## Description

This project demonstrates an issue with the SmartShape2D plugin (version 3.2.0) in Godot 4.3-stable, where material overrides in `SS2D_Point_Array` do not persist between `SS2D_Shape` instantiations when serialized in a `PackedScene`.

## Tested versions

- **Godot:** v4.3-stable
- **SmartShape2D Plugin:** v3.2.0

## Issue

The issue arises because `_material_overrides` is correctly stored in the packed scene but is cleared upon instantiation. This happens due to the deprecated `SS2D_Shape.material_overrides`, which takes precedence and replaces the edges' materials if it is not `null`. By default, `SS2D_Shape.material_overrides` is initialized as an empty `Dictionary`, causing the material overrides to be lost.

## Usage

To reproduce the issue:

1. Open the project in Godot 4.3-stable.
2. Run `DemoScene.tscn`

## Expected Behavior

The `_material_overrides` property should persist across scene instantiations, maintaining the assigned materials instead of being cleared.
