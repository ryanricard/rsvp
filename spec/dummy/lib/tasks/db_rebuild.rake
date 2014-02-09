namespace :db do
  desc "Rebuild database from scratch"
  task :rebuild => :environment do
    if Rails.env == "production"
      puts "Whoa. Rebuild production?! Nope."
      Process.exit
    end
    # Rake::Task["dummy:destroy:migrations"].invoke
    # Rake::Task["rsvp:install:migrations"].invoke
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end