Jumpup::Heroku.configure do |config|
  config.app = 'babavivo'
end if Rails.env.development?
