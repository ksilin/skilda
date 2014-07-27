# encoding: utf-8
require_relative 'spec_helper.rb'

describe 'Skilda Webapp' do

  describe 'sinatra app home page' do

    it 'should allow accessing the home page' do
      visit '/'
      %w{Skilda Such Fähigkeiten Personen Projekte Datenbank}.each do |option|
        expect(page).to have_content(option)
      end
    end

    it 'should perform a search' do
      visit '/'
      click_button('search-btn')
      expect(page).to have_content('Keine Treffer')
      puts page.body
    end

    it 'should perform a search' do
      visit '/'
      fill_in('search', :with => 'Java')
      click_button('search-btn')
      %w{Sebastian Matthias Marco}.each{|first_name|
        expect(page).to have_content(first_name)
      }
      # puts page.body
    end

  end

end