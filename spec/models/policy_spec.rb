require 'rails_helper'

RSpec.describe Policy, :type => :model do
  describe 'Policy model unit test' do
    context 'validations' do

      it 'name validates presence' do
        record = Policy.new
        record.name = ''
        record.valid?
        expect(record.errors[:name]).to include("can't be blank")
      end

      it 'email should be unique' do
        record = Policy.new
        record.name = 'sick leave'
        record.save
        expect(record.errors[:name]).to include('has already been taken')
      end
    end

    context 'Associations' do
      it "should have has_many_and_belongs_to_many employees" do
        policy= Policy.reflect_on_association(:employees)
        expect(policy.macro).to eq(:has_and_belongs_to_many)
      end
      it "should belongs_to company" do
        policy= Policy.reflect_on_association(:company)
        expect(policy.macro).to eq(:belongs_to)
      end
    end
  end
end
