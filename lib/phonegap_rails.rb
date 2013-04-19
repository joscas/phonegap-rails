require 'phonegap/rails/version'

module Phonegap
  module Rails
    require "phonegap/rails/railtie" if defined?(Rails)
  end
end