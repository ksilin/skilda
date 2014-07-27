require_relative '../app/server'
require 'rspec'
require 'rack/test'
require 'bundler/setup'

Sinatra::Application.environment = :test
ENV['RACK_ENV'] = 'test'

Bundler.require :default, Sinatra::Application.environment

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }