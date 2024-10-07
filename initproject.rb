require 'fileutils'
require 'yaml'

project_path = ARGV[0]
config_path = ARGV[1]

def create_filesystem(project_path, file_system_config)
    begin
        puts "📂 Creating File System"
        for directory in file_system_config
            FileUtils.mkdir("#{project_path}/#{directory}")
        end
    rescue SystemCallError => e
        puts "❌ `create_filesystem` Failed"
        throw e
    end
end

def create_gitignore(project_path)
    puts "🔧 Creating .gitignore"

    if File.exists?("#{project_path}/.gitignore")
        FileUtils.rm "#{project_path}/.gitignore"
    end
    FileUtils.cp "Template.gitignore", "#{project_path}/.gitignore"
end

def create_script_templates(project_path)
    puts "💾 Creating Script Templates"

    FileUtils.cp_r "script_templates", "#{project_path}/script_templates"
end

def create_editor_scripts(project_path)
    puts "💾 Creating Editor Scripts"

    FileUtils.cp_r "Scripts", "#{project_path}/Scripts"
end

if project_path && !project_path.empty? && File.exists?(project_path)
    begin
        puts "Godot Scaffolding: 🚀 Started..."
        puts "--------------------------------"
        puts ""

        config = YAML.load_file("./DefaultConfig.yml")
        config = YAML.load_file(config_path) if config_path && !config_path.empty?
        create_filesystem project_path, config["FileSystem"]
        create_gitignore project_path
        create_script_templates project_path
        create_editor_scripts project_path

        puts ""
        puts "--------------------------------"
        puts "Godot Scaffolding: ✅ Success"
    rescue SystemCallError => e
        puts "Godot Scaffolding: ❌ Failed"
        puts e
    end
else
    puts "Godot Scaffolding: ❌ Please provide a valid Godot project directory path."
end