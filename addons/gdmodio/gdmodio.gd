@tool
extends EditorPlugin

const MOD_IO_SINGLETON_NAME = "ModIO"
const MOD_IO_SINGLETON_PATH = "res://addons/gdmodio/scripts/mod_io.gd"

func _enter_tree():
	add_autoload_singleton(MOD_IO_SINGLETON_NAME, MOD_IO_SINGLETON_PATH)


func _exit_tree():
	remove_autoload_singleton(MOD_IO_SINGLETON_NAME)
