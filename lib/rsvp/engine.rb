module Rsvp
  class Engine < ::Rails::Engine
    isolate_namespace Rsvp

    config.generators do |g|
      g.test_framework :rspec
    end

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

    # Add engine db/migrate to paths so migrations run with wrapping application
    # Inspired by: http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
    initializer :append_migrations do |app|
      # unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      # end
    end

  end
end
