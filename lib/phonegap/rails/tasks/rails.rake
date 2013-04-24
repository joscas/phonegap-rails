namespace :phonegap do
  namespace :rails do
    config_path = File.join(Rails.root, 'config', 'phonegap_rails.yml')
    if File.exist?(config_path)
      config_file = File.read(config_path)
      config = YAML.load(config_file)
      unless config.nil?
        unless config['phonegap_path'].nil?
          phonegap_path = config['phonegap_path']
          scripts_path = phonegap_path + '/lib/android/bin'
        end
        main_activity = Rails.application.class.to_s.split("::").first
        project_path = 'phonegap/android/' + main_activity
        unless config['android'].nil?
          package = config['android']["package"] unless config['android']["package"].nil?
        end
      end
    end
    
    namespace :android do
      desc 'create Phonegap project for android'
      task :create => :environment do
        if phonegap_path.blank?
          puts "You have to specify phonegap path at config/phonegap_rails.yml"
          abort
        end
        if package.blank?
          puts "You have to specify an android package at config/phonegap_rails.yml"
          abort
        end
        puts "Creating android project"     
        command = "#{scripts_path}/create #{project_path} #{package} #{main_activity}"
        puts "creating project: #{command}"
        puts `#{command}`
      end
      desc 'export application assets to android phonegap project'
      task :export => :environment do
        puts "Exporting android project"
        environment = Rails.application.assets        
        puts '* javascript assets'
        file = File.open("#{project_path}/assets/www/js/application.js", "w")
        file.write environment['application.js']
        file.close
        puts '* css assets'
        file = File.open("#{project_path}/assets/www/css/application.css", "w")
        file.write environment['application.css']
        file.close
        puts '* other assets (images and fonts)'
        other_paths = Rails.configuration.assets.paths.select {|x| x =~ /\/fonts$|\/images$/}
        other_paths.each do |path|
          FileUtils.cp_r path, "#{project_path}/assets/www/assets"
        end
        puts '* public folder'
        FileUtils.cp_r 'app/public', "#{project_path}/assets/www"
        puts '* index.html'
        @app_title = main_activity
        public_source = File.expand_path('../../../../public', __FILE__)
        file = File.open("#{project_path}/assets/www/index.html", "w")
        file.write ERB.new(File.read("#{public_source}/android_index.html.erb")).result
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