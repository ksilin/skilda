# encoding: utf-8
require_relative 'spec_helper.rb'

describe 'skills page' do

  before(:each) { visit '/skills' }

  it 'should allow accessing the home page' do
    %w{Java JavaScript Ruby Lua Neo4j }.each do |option|
      expect(page).to have_content(option)
    end
  end

  it 'should allow adding of skills' do
    click_link('add-skill-btn2')
    puts page.body
    expect(page).to have_content('Fähigkeit anlegen')
  end

end
