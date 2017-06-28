require 'rubygems'
require 'bundler/setup'

require 'sqlite3'
require 'active_record'
require 'yaml'

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    connection_details = YAML.safe_load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate('db/migrate/')
  end

  desc 'Rollback last migration'
  task :rollback do
    connection_details = YAML.safe_load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.rollback('db/migrate/')
  end

  desc 'Drop the database'
  task :drop do
    connection_details = YAML.safe_load(File.open('config/database.yml'))
    admin_connection = connection_details.merge('schema_search_path' => 'public')
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.drop_database(connection_details.fetch('database'))
  end
end
