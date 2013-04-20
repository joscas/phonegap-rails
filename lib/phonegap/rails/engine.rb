#class Railtie < ::Rails::Railtie
class Engine < ::Rails::Engine
  # initializer 'static_assets.load_static_assets' do |app|
  #   app.middleware.use ::ActionDispatch::Static, "#{root}/lib/assets"
  # end
  rake_tasks do
    load "phonegap/rails/tasks/rails.rake"
  end
end