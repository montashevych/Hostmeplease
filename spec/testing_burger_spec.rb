class Burger
  def initialize(ingredients = {})
    @ingredients = ingredients
  end

  def with_ketchup?
    @ingredients[:ketchup]
  end
end

RSpec.describe Burger do
  it 'is with ketchup' do
    burger = described_class.new(ketchup: true)
    expect(burger).to be_with_ketchup
  end

  it 'is without ketchup' do
    burger = described_class.new(ketchup: false)
    expect(burger).not_to be_with_ketchup
  end
end
