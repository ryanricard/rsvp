require 'rails/generators/base'

module Rsvp
  class ViewsGenerator < ::Rails::Generators::Base
    source_root File.expand_path("../../../", __FILE__)

    desc "Copies all Rsvp views to your application."
    def copy_views
      directory "#{Rsvp::Engine.root}/app/views/layouts/rsvp", "#{Rails.root}/app/views/layouts/rsvp/."
      directory "#{Rsvp::Engine.root}/app/views/rsvp", "#{Rails.root}/app/views/rsvp/."
    end
  end
end