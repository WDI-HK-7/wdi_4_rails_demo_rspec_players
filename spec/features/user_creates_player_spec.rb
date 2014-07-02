require 'rails_helper'

feature 'User creates a player' do
  scenario 'successfully' do
    other_player = create(:player)
    visit root_path

    click_link 'Add Player'
    fill_in 'Name', with: 'Mike'
    select 'Wizard', from: 'Job'
    fill_in 'Health', with: '60'
    fill_in 'Magic', with: '140'
    click_button 'Create Player'

    within('.player', text: 'Mike') do
      expect(page).to have_css '.name', text: 'Mike'
      expect(page).to have_css '.job', text: 'Wizard'
      expect(page).to have_css '.health', text: '60'
      expect(page).to have_css '.magic', text: '140'
    end
    # expect(page).to have_content 'Player successfully created'
    expect(page).to have_css '.player', text: other_player.name
  end
end
