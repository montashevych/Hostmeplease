require 'rails_helper'

RSpec.describe PlacesHelper do
  context 'when have lon and lat' do
    let(:test_place) { FactoryBot.build(:place) }

    it 'returns address' do
      adres = address(test_place)
      expect(adres).to eq('Ukraine, Rivne Oblast, Rivne, Kvitky-Osnovianenka Street, 8б')
    end
  end
end
