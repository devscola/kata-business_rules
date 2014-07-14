require './processor'
require './product'
require './payment'
require './packing_slip'

describe "Our order processor" do
  context 'when processing a phisical product' do
    it "generates a packing slip for shipping" do
      phisical_product= Product.new(:phisical)
      a_payment= Payment.new(phisical_product)
      expect(Processor.process(a_payment)).to be_a(PackingSlip)
    end
  end
end