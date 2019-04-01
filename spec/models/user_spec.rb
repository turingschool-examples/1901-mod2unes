require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'roles' do
    it 'can create an admin user' do
      user = User.create(email: 'kjhasdf', password: 'lkjasdf', role: 1)
      expect(user.role).to eq("admin")
      expect(user.admin?).to eq(true)
    end

    it 'can create a default user' do
      user = User.create(email: 'kjhasdf', password: 'lkjasdf', role: 0)
      expect(user.role).to eq("default")
      expect(user.default?).to eq(true)
    end
  end
end
