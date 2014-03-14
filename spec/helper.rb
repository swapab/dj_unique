require 'logger'
require 'rspec'

begin
  require 'protected_attributes'
rescue LoadError
end

require 'delayed_job_active_record'

ENV['RAILS_ENV'] = 'test'

db_adapter, gemfile = ENV["ADAPTER"], ENV["BUNDLE_GEMFILE"]
db_adapter ||= gemfile && gemfile[%r(gemfiles/(.*?)/)] && $1
db_adapter ||= 'sqlite3'

config = YAML.load(File.read('spec/database.yml'))
ActiveRecord::Base.establish_connection config[db_adapter]
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :delayed_jobs, :force => true do |table|
    table.integer  :priority, :default => 0
    table.integer  :attempts, :default => 0
    table.text     :handler
    table.text     :last_error
    table.datetime :run_at
    table.datetime :locked_at
    table.datetime :failed_at
    table.string   :locked_by
    table.string   :queue
    table.timestamps
  end

  add_index :delayed_jobs, [:priority, :run_at], :name => 'delayed_jobs_priority'
end

# Add this directory so the ActiveSupport autoloading works
ActiveSupport::Dependencies.autoload_paths << File.dirname(__FILE__)
