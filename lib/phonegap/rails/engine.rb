class Engine < ::Rails::Engine
  rake_tasks do
    load "phonegap/rails/tasks/rails.rake"
  end
end