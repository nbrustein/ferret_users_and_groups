require 'ferret'
require "ferret_users_and_groups/version"
Dir.glob(File.expand_path("../ferret/**/*.rb", __FILE__)).each { |f| require(f) }
  
module FerretUsersAndGroups
  class Railtie < Rails::Railtie
      railtie_name :ferret_users_and_groups

      rake_tasks do
        load "tasks/ferret_users_and_groups.rake"
      end
    end
end
