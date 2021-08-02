extends Node

const SAVE_DATA_PATH = "user://save_data.json"

var default_save_data: Dictionary = {
	highscore = 0
}

func save_data_to_file(save_data):
	var json_str = to_json(save_data)
	# create the file
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_str)
	save_file.close()


func load_data_from_file():
	var save_file = File.new()
	# si el fichero no existe retornamos
	# el diccionario por defecto.
	if !save_file.file_exists(SAVE_DATA_PATH):
		return default_save_data

	# de lo contrario leemos todo el
	# contenido desde el fichero.
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()

	return save_data
