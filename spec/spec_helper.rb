require 'rubygems'
require 'rspec'
require 'dj_unique'

I18n.config.enforce_available_locales = true

RSpec.configure do |config|
  config.order = :rand
  config.color_enabled = true
end
