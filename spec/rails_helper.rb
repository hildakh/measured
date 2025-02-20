# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'shoulda/matchers'
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Apply any pending migrations before running tests
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # Use transactions to ensure database consistency in tests
  config.use_transactional_fixtures = true

  # Enable filtering of Rails framework backtraces for cleaner error output
  config.filter_rails_from_backtrace!

  # Automatically infer spec type from file location
  config.infer_spec_type_from_file_location!
end
