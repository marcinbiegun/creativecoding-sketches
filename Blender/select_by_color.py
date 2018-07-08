
import bpy
col = bpy.context.object.data.materials[0].diffuse_color
mess = [o for o in bpy.context.scene.objects if o.type == 'MESH']

for obj in mess:
	list = []
	for mat in obj.data.materials:
		try: list.append(mat.diffuse_color)
		except: pass
	obj.select = col in list
