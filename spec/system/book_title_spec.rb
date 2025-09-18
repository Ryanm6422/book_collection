require 'rails_helper'

RSpec.describe "Books (title)", type: :system do
  it "creates a book successfully (sunny) and shows flash" do
    visit new_book_path

    fill_in "book_title",  with: "Dune"
    fill_in "book_author", with: "Frank Herbert"
    fill_in "book_price",  with: "19.99"

    # date_select generates these 3 <select> ids:
    # book_published_date_1i (year), _2i (month), _3i (day)
    select "1965",   from: "book_published_date_1i"
    select "August", from: "book_published_date_2i"
    select "1",      from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Book was successfully created")
    expect(page).to have_content("Dune")
  end

  it "rejects blank title and shows error (rainy)" do
    visit new_book_path

    fill_in "book_title",  with: ""
    fill_in "book_author", with: "Frank Herbert"
    fill_in "book_price",  with: "19.99"
    select "1965",   from: "book_published_date_1i"
    select "August", from: "book_published_date_2i"
    select "1",      from: "book_published_date_3i"
    click_button "Create Book"
    expect(page).to have_content("Title can't be blank")
  end
end
