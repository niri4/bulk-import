require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model unit test' do
    context 'validations' do
      it 'Email validates presence' do
        record = User.new
        record.email = ''
        record.valid?
        expect(record.errors[:email]).to include("can't be blank")
      end

      it 'email should be unique' do
        record = User.new
        record.email = 'abc@niri.com'
        record.save
        expect(record.errors[:email]).to include('has already been taken')
      end
    end
  end
end
