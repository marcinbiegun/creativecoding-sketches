require 'yaml'
require 'pry'

CONFIG_PATH = 'readmes_config.yml'

$config = YAML.load File.open(CONFIG_PATH).read
$docs_dir = '_docs'
$repo_url = $config['config']['repo_url']
$raw_repo_url = $config['config']['raw_repo_url']
$readme = []

class Render
  def self.software(software)
    textlines = []

    textlines << [
      "# #{software['name']}",
      "A collection of my doodles in #{software['name']}",
      ""
    ]

    project_dirs = []
    if software['project_dirs']
      software['project_dirs'].map do |project_dir|
        project_dirs << "./#{software['dir']}/#{project_dir}/*"
      end
    else
      project_dirs << "./#{software['dir']}/*"
    end

    puts "project_dirs"
    puts project_dirs

    project_dirs.each do |project_dir|
      textlines << Dir[project_dir].map do |path|
        path.sub(/^\.\//, '')
      end.select do |path|
        if software['projects_in_directories']
          true
        else
          File.file?(path)
        end
      end.map do |path|
        puts path
        Render.project(path)
      end
    end

    textlines
  end

  def self.project(path)
    software_dir, project_dir, project_file = path.split("\/")
    if project_file == nil
      project_file = project_dir
      project_dir = ""
    end

    binding.pry if project_file == nil
    docs_path = "#{software_dir}/#{$docs_dir}"
    screenshot_path = docs_path + '/' + Utils.replace_extension(project_file, 'png')

    [
      "## [#{project_file}](#{$repo_url}/blob/master/#{path})",
      File.file?(screenshot_path) ? "![Screenshot](#{$raw_repo_url}/master/#{screenshot_path})" : nil,
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

$config['softwares'].each do |software_name, software|
  readme_lines = Render.software(software)
  Writer.software_readme(software, readme_lines)
end
