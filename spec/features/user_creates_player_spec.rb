require 'rails_helper'

feature 'User creates a player' do
  background do
    visit root_path
    click_link 'Add Player'
  end

  scenario 'successfully' do
    other_player = create(:player)

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

  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Create Player'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Job can't be blank"
    expect(page).to have_content "Health can't be blank"
    expect(page).to have_content "Magic can't be blank"
  end
end
