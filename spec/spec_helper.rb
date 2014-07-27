require_relative '../app/server'
# require 'rspec'
require 'rack/test'
require 'bundler/setup'

require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'
Sinatra::Application.environment = :test

Bundler.require :default, Sinatra::Application.environment

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c|
  c.include RSpecMixin
  c.include Capybara::DSL#, feature: true
  c.include Capybara::RSpecMatchers#, feature: true
}


Capybara.app = Sinatra::Application
