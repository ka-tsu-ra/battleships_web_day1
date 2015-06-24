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
    expect(page).to have_content "Welcome to Battleships, Admiral Kirsten."
  end

  scenario 'It can produce a board' do
    visit '/start'
    fill_in 'name', with: 'Kirsten'
    click_button('Submit')
    click_link('Gimme a board!')
    expect(page).to have_content "ABCDEFGHIJ"
  end
end

feature 'Place a ship on a board' do
  scenario 'Can place a ship somewhere in the board' do
    visit'/getboard'
    fill_in 'shiptype', with: 'battleship'
    fill_in 'coord', with: 'A5'
    click_button('Place ship')
    expect(page).to have_content "BBBB" #Not sure how to test for other ships/sizes
  end

end
