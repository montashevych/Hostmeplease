Capybara.javascript_driver = :webkit # Selenium works, but not as well
 
RSpec.configure do |config|
  config.use_transactional_fixtures = false

   Debug.rb
  # Use transactions by default
  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  # For the javascript-enabled tests, switch to truncation, but *only on tables that were used*
  config.before :each, :js => true do
    DatabaseCleaner.strategy = :truncation, {:pre_count => true}
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end