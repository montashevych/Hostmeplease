RSpec.configure do |config|
  config.before do
    DatabaseCleaner.clean_with :truncation, except: %w[ar_internal_metadata]
  end
  config.after do # or :each or :all
    Dir[Rails.root.join('public/uploads/tmp/**/*')].each do |file|
      FileUtils.rm_rf file
    end
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
