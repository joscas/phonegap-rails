namespace :phonegap do
  namespace :rails do
    config_path = File.join(Rails.root, 'config', 'phonegap_rails.yml')
    config = YAML.load(File.read(config_path))
    phonegap_path = config["phonegap_path"]
    if phonegap_path.blank?
      puts "You have to specify phonegap path at config/phonegap_rails.yml"
      abort
    end
    scripts_path = phonegap_path + '/lib/android/bin'
    main_activity = Rails.application.class.to_s.split("::").first
    project_path = 'phonegap/android/' + main_activity
    package = config["android"]["package"]
    if package.blank?
      puts "You have to specify an android package at config/phonegap_rails.yml"
      abort
    end
    
    namespace :android do
      desc 'create Phonegap project for android'
      task :create => :environment do
        puts "Creating android project"     
        command = "#{scripts_path}/create #{project_path} #{package} #{main_activity}"
        puts "creating project: #{command}"
        puts `#{command}`
      end
      desc 'export application assets to android phonegap project'
      task :export => :environment do
        puts "Exporting android project"
        environment = Sprockets::Environment.new
        paths = Rails.application.config.assets.paths
        paths.each do |path|
          environment.append_path path
        end
        #puts environment['application.js']
      end
      desc 'build android phonegap project'
      task :build => :environment do
        ### /path/to/my_new_cordova_project/cordova/debug
        command = "#{project_path}/cordova/build"
        puts "Building project: #{command}"
        puts `#{command}`
      end
      desc 'Launch emulator for android phonegap project'
      task :emulate => :environment do
        ### /path/to/my_new_cordova_project/cordova/emulate
        command = "#{project_path}/cordova/run"
        puts "Launching emulator: #{command}"
        puts `#{command}`
      end
    end
    namespace :ios do
      desc 'export Phonegap project for ios'
      task :export  => :environment do
        # TODO: export project
      end
    end
  end
end