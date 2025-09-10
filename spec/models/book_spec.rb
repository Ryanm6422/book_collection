require 'rails_helper'

RSpec.describe Book, type: :model do
    it "is valid with a title" do
        expect(Book.new(title: "Dune")).to be_valid
    end

    it "is invalid without a title" do
        b = Book.new(title: "")
        expect(b).to be_invalid
        expect(b.errors[:title]).to be_present
    end
end