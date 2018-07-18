require 'yaml'
require 'pry'

CONFIG_PATH = 'readme.yml'

$config = YAML.load File.open(CONFIG_PATH).read
$docs_dir = '_docs'
$repo_url = $config['repo_url']
$raw_repo_url = $config['raw_repo_url']
$readme = []

class Config
  def self.project_ignored?(software, file_name)
    ignored = $config['ignored_projects'].to_a + software['ignored_projects'].to_a
    ignored.include?(file_name)
  end
end

class Render
  def self.root
    textlines = []

    textlines << $config['root']['text']

    textlines << $config['softwares'].map do |software_name, software|
      Render.software_projects(software, pinned_only: true, path_titles: true)
    end

    textlines
  end

  def self.software(software)
    textlines = []

    textlines << [
      "# #{software['name']}",
      "A collection of my #{software['name']} doodles.",
      ""
    ]

    if software['text']
      textlines << software['text']
    end

    textlines << Render.software_projects(software)

    textlines
  end

  def self.software_projects(software, options = {})
    textlines = []

    project_dirs = []
    if software['project_dirs']
      software['project_dirs'].map do |project_dir|
        project_dirs << "./#{software['dir']}/#{project_dir}/*"
      end
    else
      project_dirs << "./#{software['dir']}/*"
    end

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
        file_name, _, __ = Utils.split_project_path(path)
        project = (software['projects'] && software['projects'][file_name]) || {}
        if !Config.project_ignored?(software, file_name) && !options[:pinned_only] || project['pinned']
          Render.project(path, project, options)
        end
      end
    end

    textlines
  end

  def self.project(path, project, options = {})
    file_name, file_url, screenshot_url = Utils.split_project_path(path)
    title = options[:path_titles] ? path : file_name
    [
      "## [#{title}](#{file_url})",
      project['text'],
      screenshot_url ? "![Screenshot](#{screenshot_url})" : nil,
      ""
    ]
  end
end

class Utils
  def self.split_project_path(path)
    software_dir, project_dir, project_file = path.split("\/")
    if project_file == nil
      project_file = project_dir
      project_dir = ""
    end
    docs_path = "#{software_dir}/#{$docs_dir}"
    screenshot_path = docs_path + '/' + Utils.replace_extension(project_file, 'png')
    file_url = "#{$repo_url}/blob/master/#{path}"
    screenshot_url = File.file?(screenshot_path) ? "#{$raw_repo_url}/master/#{screenshot_path}" : nil

    [project_file, file_url, screenshot_url]
  end

  def self.replace_extension(path, new_extension)
    name_parts = path.split('.')
    if name_parts.size == 1
      name_parts << new_extension
    else
      name_parts[-1] = 'png'
    end
    name_parts.join('.')
  end
end

class Writer
  def self.software_readme(software, textlines)
    readme_path = "./#{software['dir']}/README.md"
    readme_content = textlines.flatten.compact.join("\n")
    File.open(readme_path, 'w') { |file| file.write(readme_content) }
    puts "Writing #{readme_path}"
  end

  def self.root_readme(textlines)
    readme_path = "./README.md"
    readme_content = textlines.flatten.compact.join("\n")
    File.open(readme_path, 'w') { |file| file.write(readme_content) }
    puts "Writing #{readme_path}"
  end
end

