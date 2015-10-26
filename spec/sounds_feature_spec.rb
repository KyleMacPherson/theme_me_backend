# require 'rails_helper'
#
# feature 'sounds' do
#   context 'no sounds been added' do
#     scenario 'should display a prompt to add a restaurant' do
#       visit '/sounds'
#       expect(page).to have_content '[]'
#     end
#   end
#
#   context 'restaurants have been added' do
#     before do
#       Sound.create(url: 'www.sound.com/sound')
#     end
#
#     scenario 'display restaurants' do
#       visit '/sounds'
#       expect(page).to have_content([{url: 'www.sound.com/sound'}])
#     end
#   end
# end
