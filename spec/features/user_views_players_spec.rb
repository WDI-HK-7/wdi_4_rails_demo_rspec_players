require 'rails_helper'

feature 'User views players' do
  scenario 'with all attributes' do
    players = create_list(:player, 3)

    visit root_path

    players.each do |player|
      within('.player', text: player.name) do
        expect(page).to have_content player.job
        expect(page).to have_content player.health
        expect(page).to have_content player.magic
      end
    end
  end
end
