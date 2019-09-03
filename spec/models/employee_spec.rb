require 'rails_helper'

RSpec.describe Employee, :type => :model do
  describe 'Employee model unit test' do
    context 'validations' do

      it 'name validates presence' do
        record = Employee.new
        record.name = ''
        record.valid?
        expect(record.errors[:name]).to include("can't be blank")
      end

      it 'Email validates presence' do
        record = Employee.new
        record.email = ''
        record.valid?
        expect(record.errors[:email]).to include("can't be blank")
      end

      it 'email should be unique' do
        record = Employee.new
        record.email = 'niri@niri.com'
        record.save
        expect(record.errors[:email]).to include('has already been taken')
      end
    end
    context 'Associations' do
      it "should have has_many_and_belongs_to_many policies" do
        employee= Employee.reflect_on_association(:policies)
        expect(employee.macro).to eq(:has_and_belongs_to_many)
      end
      it "should belongs_to company" do
        employee= Employee.reflect_on_association(:company)
        expect(employee.macro).to eq(:belongs_to)
      end
    end
  end
end
