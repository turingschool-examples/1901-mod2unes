require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
  end
  describe 'Relationships' do
    it { should have_many :songs }
  end

end