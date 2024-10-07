@tool
extends EditorScript

## Requires 2 nodes to be selected when run.
## Snaps the global_position of the first selected node to the second selected node.
## snap_x, snap_y, and snap_z can all be enabled or disabled to adjust snapping behavior.

#region Properties

var snap_x: bool = true
var snap_y: bool = true
var snap_z: bool = true

#endregion

#region Lifecycle

func _run() -> void:
	var selected_nodes = _get_selected_nodes()
	print("EditorScript: Snapping Node <", selected_nodes[0].name, "> to <", selected_nodes[1].name, ">")
	if selected_nodes.size() == 2:
		if snap_x:
			selected_nodes[0].global_position.x = selected_nodes[1].global_position.x
		if snap_y:
			selected_nodes[0].global_position.y = selected_nodes[1].global_position.y
		if snap_z:
			selected_nodes[0].global_position.z = selected_nodes[1].global_position.z

#endregion

#region  Methods

func _get_selected_nodes() -> Array[Node]:
	return get_editor_interface().get_selection().get_selected_nodes()

#endregion
