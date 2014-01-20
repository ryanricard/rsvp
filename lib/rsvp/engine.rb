module Rsvp
  class Engine < ::Rails::Engine
    isolate_namespace Rsvp

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
