require_relative '../app/server'
# require 'rspec'
require 'rack/test'
require 'bundler/setup'

ENV['RACK_ENV'] = 'test'
Sinatra::Application.environment = :test

Bundler.require :default, Sinatra::Application.environment

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }