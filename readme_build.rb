require_relative 'readme'

$config['softwares'].each do |software|
  textlines = Render.software(software)
  Writer.software_readme(software, textlines)
end

textlines = Render.root
Writer.root_readme(textlines)
