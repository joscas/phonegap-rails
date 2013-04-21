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
    
    desc 'Test generator within task'
    task :generate => :environment do
      puts "Calling generator"
      #require 'rails/generators'
      #source_root File.expand_path('generators/phonegap_rails/install/templates', __FILE__)
      #copy_file "config/phonegap_rails.yml" "phonegap_rails.yml"
      puts File.expand_path('../../../public', __FILE__)
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
        puts '* javascript assets'
        file = File.open("#{project_path}/assets/www/js/application.js", "w")
        file.write environment['application.js']
        file.close
        puts '* css assets'
        file = File.open("#{project_path}/assets/www/css/application.css", "w")
        file.write environment['application.css']
        file.close
        puts '* images'
        `cp app/assets/images/* #{project_path}/assets/www/img/`
        puts '* index.html'
        file = File.open("#{project_path}/assets/www/index2.html", "w")
        file.write environment['phonegap_rails_android_index.html']
        file.close
      end
      desc 'build android phonegap project'
      task :build => :environment do
        command = "#{project_path}/cordova/build"
        puts "Building project: #{command}"
        puts `#{command}`
      end
      desc 'Launch emulator for android phonegap project'
      task :emulate => :environment do
        command = "#{project_path}/cordova/run"
        puts "Launching emulator: #{command}"
        puts `#{command}`
      end
      desc 'Clean android phonegap project'
      task :clean => :environment do
        command = "#{project_path}/cordova/clean"
        puts "Cleaning project: #{command}"
        puts `#{command}`
      end
      desc 'Log'
      task :clean => :environment do
        command = "#{project_path}/cordova/log"
        puts "Log: #{command}"
        puts `#{command}`
      end
    end
    namespace :ios do
      desc 'export Phonegap project for ios'
      task :export  => :environment do
        # TODO: export project
        puts "Not implemented"
      end
    end
  end
end