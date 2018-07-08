require 'yaml'

CONFIG_PATH = 'readmes_config.yml'

config = YAML.load File.open(CONFIG_PATH).read
$docs_dir = '_docs'
$repo_url = config['config']['repo_url']
$readme = []

class Render
    def self.software(software)
        textlines = []

        textlines << [
            "# #{software['name']}",
            "A collection of my doodles in #{software['name']}",
            ""
        ]

        textlines << Dir["./#{software['dir']}/*"].select do |path|
            File.file?(path)
        end.map do |path|
            Render.project(path)
        end

        textlines
    end

    def self.project(project_path)
        here, software_path, project_filename = project_path.split("\/")
        docs_path = "#{here}/#{software_path}/#{$docs_dir}"

        screenshot_path = docs_path + '/' + Utils.replace_extension(project_filename, 'png')

        [
            "## #{project_filename}",
            File.file?(screenshot_path) ? "![Screenshot](#{$repo_url}/master/#{screenshot_path})" : nil,
            ""
        ]
    end
end

class Utils
    def self.replace_extension(path, new_extension)
        name_parts = path.split('.')
        name_parts[-1] = 'png'
        name_parts.join('.')
    end
end

class Writer
    def self.software_readme(software, readme_lines)
        readme_path = "./#{software['dir']}/README.md"
        readme_content = readme_lines.flatten.compact.join("\n")
        File.open(readme_path, 'w') { |file| file.write(readme_content) }
        puts "Written #{readme_path}"
    end
end

config['softwares'].each do |software_name, software|
    readme_lines = Render.software(software)
    Writer.software_readme(software, readme_lines)
end
