$: << File.dirname(__FILE__)

require 'nokogiri'
require 'application_config'

config = Configuration.for 'application'
doc = Nokogiri::XML(File.open(config.xml_path))

# Create minimal Hyperspin XML file
output = Nokogiri::XML::Document.new
output.root = Nokogiri::XML::Node.new("menu", output)
output.root << doc.xpath("/menu/header")

# For each game in directory, find corresponding entry
# in master xml list.
Dir.glob("#{config.game_path}/*.{#{config.extensions}}") do |file_name|
  rom_name = File.basename(file_name, File.extname(file_name))
  doc.xpath("/menu/game[@name='#{rom_name}']").each {|n| output.root << n}
end

File.open(config.output_path, 'w') {|f| f.write(output.to_xml) }