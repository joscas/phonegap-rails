class Railtie < ::Rails::Railtie
  rake_tasks do
    load "phonegap/rails/tasks/rails.rake"
  end
end