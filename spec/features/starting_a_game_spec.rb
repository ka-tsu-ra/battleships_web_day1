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
  scenario 'Can place a ship on the board' do
    visit'/getboard'
    fill_in 'shiptype', with: 'battleship'
    fill_in 'coord', with: 'A5'
    fill_in 'direction', with: 'horizontally'
    click_button('Place ship')
    expect(page).to have_content "BBBB"
  end

  scenario 'can place a ship vertically on the board' do
    visit '/getboard'
    fill_in 'shiptype', with: 'cruiser'
    fill_in 'coord', with: 'H8'
    fill_in 'direction', with: 'vertically'
    click_button('Place ship')
    expect(page).to have_content "C"
  end

  scenario 'goes to error message when placing a ship out of bounds' do
    visit '/getboard'
    fill_in 'shiptype', with: 'cruiser'
    fill_in 'coord', with: 'J10'
    fill_in 'direction', with: 'vertically'
    click_button('Place ship')
    expect(page).to have_content "Please enter a valid coordinate."
  end
end

feature 'Firing at a ship' do
  scenario 'Player 1 can fire at his own board' do
    visit '/firing'
    fill_in 'coord', with: 'A1'
    click_button('Fire!')
    expect(page).to have_content "You have just missed 'A1'"
  end
end
