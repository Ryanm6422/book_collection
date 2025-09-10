require 'rails_helper'

RSpec.describe "Books (title)", type: :system do
    it "creates a book successfully (sunny) and shows flash" do
        visit new_book_path
        fill_in "Title", with: "Dune"
        click_button "Create Book"
        expect(page).to have_content("Book was successfully created")
        expect(page).to have_content("Dune")
    end

    it "fails to create when title blank (rainy) and shows flash" do
        visit new_book_path
        fill_in "Title", with: ""
        click_button "Create Book"
        expect(page).to have_content("Title can't be blank")
    end
end