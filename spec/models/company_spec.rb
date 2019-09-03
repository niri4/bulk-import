require 'rails_helper'

RSpec.describe Company, :type => :model do
  describe 'Company model unit test' do
    context 'validations' do
      it 'name validates presence' do
        record = Company.new
        record.name = ''
        record.valid?
        expect(record.errors[:name]).to include("can't be blank")
      end
    end
    context 'Associations' do
      it "should have has_many policies" do
        company= Company.reflect_on_association(:policies)
        expect(company.macro).to eq(:has_many)
      end

      it "should have has_many employees" do
        company= Company.reflect_on_association(:employees)
        expect(company.macro).to eq(:has_many)
      end
    end
  end
end
