namespace :dummy do
  namespace :destroy do
    desc "Destroy all dummy app migrations."
    task :migrations => :environment do
      # require 'fileutils'
      FileUtils.rm_rf(Dir.glob("#{Rails.root}/db/migrate/*"))
      puts "done."
    end
  end
end