require 'nokogiri'

# TODO: Make configurable
rom_path = 'C:/HyperSpin/Emulators/RomFiles/MAME'
xml_path = 'C:/HyperSpin/Databases/MAME/MAME.xml'
output_path = 'C:/Projects/Personal/mame-scraper/MAME_custom.xml'
extensions = 'zip'

doc = Nokogiri::XML(File.open(database_path))

# Create minimal Hyperspin XML file
output = Nokogiri::XML::Document.new
output.root = Nokogiri::XML::Node.new("menu", output)
output.root << doc.xpath("/menu/header")

# For each game in directory, find corresponding entry
# in master xml list.
Dir.glob("#{rom_path}/*.{#{extensions}}") do |file_name|
  rom_name = File.basename(file_name, File.extname(file_name))
  doc.xpath("/menu/game[@name='#{rom_name}']").each {|n| output.root << n}
end

File.open(output_path, 'w') {|f| f.write(output.to_xml) }