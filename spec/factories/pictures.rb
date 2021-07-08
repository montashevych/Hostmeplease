FactoryBot.define do
  factory :picture do
    image {
      Rack::Test::UploadedFile.new(
                          File.open(Rails.root.join('spec/factories/test.png')),
                          'image/png',
                        )
    }
    imageable_type { 'Place' }
  end
end
