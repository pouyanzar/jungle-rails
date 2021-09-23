require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "They see one product" do
    # ACT
    visit root_path
    save_screenshot
    # abort page.find_link("Details »", match: :first).inspect
    page.find('a.btn.btn-default.pull-right').trigger('click')
    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-details'
  end
end