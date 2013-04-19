namespace :phonegap do
  namespace :rails do
    namespace :android do
      desc 'create Phonegap project for android'
      task :create => :environment do
        puts "Creating android project"
        phonegap_path = '~/Development/phonegap-2.6.0' + '/lib/android/bin'
        main_activity = Rails.application.class.to_s.split("::").first
        project_path = 'phonegap/android/' + main_activity
        package = 'com.example.appname'
        command = "#{phonegap_path}/create #{project_path} #{package} #{main_activity}"
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
    end
    namespace :ios do
      desc 'export Phonegap project for ios'
      task :export  => :environment do
        # TODO: export project
      end
    end
  end
end