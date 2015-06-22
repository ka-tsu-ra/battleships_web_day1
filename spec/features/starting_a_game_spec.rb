require 'spec_helper'

feature 'Starting a new game' do
  scenario 'Starting a new game' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'It can receive a name' do
    visit '/start'
    fill_in 'name', with: 'Kirsten'
    click_button('Submit')
    expect(page).to have_content "Welcome to Battleships, Admiral Kirsten"
  end
end
