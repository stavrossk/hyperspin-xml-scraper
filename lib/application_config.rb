require 'configuration'

Configuration.for('application-config') {
  game_path 'C:/HyperSpin/Emulators/RomFiles/MAME'
  xml_path 'C:/HyperSpin/Databases/MAME/MAME.xml'
  output_path 'C:/Projects/Personal/mame-scraper/MAME_custom.xml'
  extensions 'zip'
}