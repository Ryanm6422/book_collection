require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with all required fields" do
    b = Book.new(
      title: "Dune",
      author: "Frank Herbert",
      price: 19.99,
      published_date: Date.new(1965, 8, 1)
    )
    expect(b).to be_valid
  end

  it "is invalid without a title" do
    b = Book.new(
      title: "",
      author: "Frank Herbert",
      price: 19.99,
      published_date: Date.new(1965, 8, 1)
    )
    expect(b).to be_invalid
    expect(b.errors[:title]).to be_present
  end
end
