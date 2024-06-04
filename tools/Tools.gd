class_name Tools extends Node

static func get_all_files(path: String, file_ext := "", files : Array[Resource] = []) -> Array[Resource]:
	var dir : DirAccess = DirAccess.open(path)

	if dir:
		dir.list_dir_begin()

		var file_name : String = dir.get_next()

		while file_name != "":
			if dir.current_is_dir():
				files = get_all_files(dir.get_current_dir() + "/" + file_name, file_ext, files)
			else:
				if file_ext and file_name.get_extension() != file_ext:
					file_name = dir.get_next()
					continue

				files.append(ResourceLoader.load(dir.get_current_dir() + "/" + file_name))
				#print(dir.get_current_dir() + "/" + file_name)
				#print(ResourceLoader.load(dir.get_current_dir() + "/" + file_name))

			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access %s." % path)

	return files

static func random_sign() -> int:
	return -1 if randi_range(0, 1) == 0 else 1
