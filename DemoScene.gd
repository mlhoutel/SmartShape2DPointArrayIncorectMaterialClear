extends Control
class_name DemoScene

@onready var shape_1: SS2D_Shape = %SS2D_Shape_1
@onready var shape_2: SS2D_Shape = %SS2D_Shape_2

## Demonstrate wrong behavior in the SmartShape2D 3.2.0 plugin with Godot 4.3.stable:

## SS2D_Point_Array does not persists material overrides between SS2D_Shape
## instantiations when serializing in a PackedScene for instance.

## Note that _material_overrides is rightly stored in the packed scene 
## but it cleared at instantiation due to the deprecated SS2D_Shape
## material_overrides that takes precedence and replace the Edges 
## materials if not null (initialized as an empty Dictionary)

func _ready() -> void:
    print("Points _material_overrides before pack-instantate: ", shape_2._points._material_overrides)

    var packed_scene: PackedScene = PackedScene.new()
    packed_scene.pack(shape_2)
    shape_2.queue_free()

    shape_2 = packed_scene.instantiate()
    
    add_child(shape_2)
    shape_2.owner = self
    
    print("Points _material_overrides before pack-instantate: ", shape_2._points._material_overrides)
