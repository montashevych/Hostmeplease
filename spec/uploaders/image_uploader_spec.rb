require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:test_place) { FactoryBot.build(:place) }
  let(:uploader) { described_class.new(test_place, :image) }

  before do
    described_class.enable_processing = true
    File.open(Rails.root.join('spec/factories/test.png')) { |f| uploader.store!(f) }
  end

  after do
    described_class.enable_processing = false
    uploader.remove!
  end

  context 'when the thumb version' do
    it 'scales down a landscape image to be exactly 600 by 600 pixels' do
      expect(uploader.thumb).to have_dimensions(600, 575)
    end
  end

  it 'makes the image readable only to the owner and not executable' do
    expect(uploader).to have_permissions(0o644)
  end

  it 'has the correct format' do
    expect(uploader).to be_format('png')
  end
end
