require 'rails_helper'

RSpec.describe Book, type: :model do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:published_date) }
end