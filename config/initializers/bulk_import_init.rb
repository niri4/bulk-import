if ENV['RAILS_ENV'] == 'test'
  STORAGE_DEFAULT_PATH = ENV['STORAGE_TEST']
else
  STORAGE_DEFAULT_PATH = ENV['STORAGE_DEVELOPMENT']
end
