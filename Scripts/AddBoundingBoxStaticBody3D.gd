@tool
extends EditorScript

## Adds a StaticBody3D and CollisionShape3D to the selected nodes when run.
## All selected nodes will have a child StaticBody3D node added with a CollisionShape3D grandchild.
## Using the selected node's AABB to retrieve the bounding box, the added CollisionShape3D node will match the bounding box of the node.
## The StaticBody3D's position is adjusted to align the bounding box and the node.

#region Properties



#endregion

#region Lifecycle

func _run():
	var selected_nodes = get_editor_interface().get_selection().get_selected_nodes()
	for node in selected_nodes:
		if node is MeshInstance3D:
			var bounding_box = node.get_aabb()
			var static_body = create_static_body(bounding_box, node, get_scene())
			static_body.position.y += bounding_box.size.y / 2

#endregion

#region  Methods

func create_static_body(bounding_box: AABB, node: Node3D, scene: Node3D) -> StaticBody3D:
	var static_body = StaticBody3D.new()
	var collision_shape = CollisionShape3D.new()
	
	node.add_child(static_body)
	static_body.add_child(collision_shape)
	
	collision_shape.shape = BoxShape3D.new()
	collision_shape.shape.size = bounding_box.size
	
	static_body.name = "StaticBody3D"
	collision_shape.name = "CollisionShape3D"
	
	static_body.owner = scene
	collision_shape.owner = scene
	
	return static_body

#endregion
