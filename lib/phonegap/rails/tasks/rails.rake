namespace :phonegap do
  namespace :rails do
    namespace :android do
      desc 'export Phonegap project for android'
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