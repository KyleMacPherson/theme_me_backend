# require 'spec_helper'
#
# context 'sounds API' do
#   scenario 'show no sounds if none in database' do
#     visit '/sounds'
#     expect(page).to have_content '[]'
#   end
#
#   scenario 'show sounds in database' do
#     sound = Sound.create(url: 'test.com')
#     visit '/sounds'
#     expect(page).to equal(JSON.parse(current_path))
#   end
#
# end
