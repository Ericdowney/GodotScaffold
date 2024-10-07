@tool
extends EditorScript

## Sorts the child nodes of all selected nodes when run.
## Sorts the editing scene hierarchy to match an alphabetical descending sort order.

#region Properties



#endregion

#region Lifecycle

func _run():
	var selected_nodes = get_editor_interface().get_selection().get_selected_nodes()
	for node in selected_nodes:
		print("EditorScript: Sorting Node <", node.name, ">")
		var children = node.get_children()
		children.sort_custom(
			func (a, b):
				return a.name.naturalnocasecmp_to(b.name) < 0
		)
		for index in range(0, children.size()):
			var child = children[index]
			node.move_child(child, index)

#endregion

#region  Methods



#endregion
