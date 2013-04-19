require 'rails/generators'

module PhonegapRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Create config file"
      source_root File.expand_path('../templates', __FILE__)
      
      def create_config_file
        copy_file "config/phonegap_rails.yml"
      end
    end
  end
end