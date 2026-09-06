using StartUpDG

(VX, VY), EToV, edges_dict = read_Gmsh_2D("/home/daniel/Desktop/mesh.msh")
#mesh = read_Gmsh_2D("/home/daniel/Desktop/mesh.msh")

# Create MeshData
rd = RefElemData(Tri(), N=3)
md = MeshData((VX, VY), EToV, rd)

# Get boundary faces and nodes directly from Gmsh
boundary_faces = StartUpDG.tag_boundary_faces_from_edges_dict(md, edges_dict)

# Print summaries
print_boundary_tags(boundary_faces)
print_boundary_nodes_tags(boundary_nodes)

# Access specific boundaries
inlet_faces = boundary_faces[:inlet]
wall_nodes = boundary_nodes[:wall]
