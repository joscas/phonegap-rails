require 'rails/generators'

module Phonegap
  module Rails
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Create config file"
        source_root File.expand_path('../templates', __FILE__)
      end
    end
  end
end