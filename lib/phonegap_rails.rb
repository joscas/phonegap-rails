require 'phonegap/rails/version'

module Phonegap
  module Rails
    require "phonegap/rails/engine" if defined?(Rails)
  end
end