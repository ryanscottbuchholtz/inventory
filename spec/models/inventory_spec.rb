require 'spec_helper'

describe Inventory do
  describe 'validations' do
    it { should_not have_valid(:title).when(nil) }
    it { should_not have_valid(:description).when(nil) }
    it { should_not have_valid(:quantity).when(nil) }
    it { should_not have_valid(:quantity).when('one') }
    it { should_not have_valid(:quantity).when(0.05) }
    it { should_not have_valid(:quantity).when(0) }
  end

  describe 'inventory count' do
    it 'returns the number of inventory entries' do
      Inventory.create!(title: 'Chicken', description: 'bonless breast', quantity: '15')
      Inventory.create!(title: 'Salt', description: 'Sea Salt', quantity: '4')

      expect(Inventory.count).to equal(2)
      expect(Inventory.first.title).to eql('Chicken')
    end
  end

end
