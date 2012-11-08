require 'configuration'

Configuration.for('application') {
  # Path to folder which contains your rom files
  game_path 'C:/HyperSpin/Emulators/RomFiles/MAME'

  # Path to the Hyperspin database XML file you want search in
  xml_path 'C:/HyperSpin/Databases/MAME/MAME_master.xml'

  # Path of file you want to output your custom list to
  output_path 'C:/HyperSpin/Databases/MAME/MAME.xml'

  # Comma seperated list of extensions you want to search on
  extensions 'zip'
}