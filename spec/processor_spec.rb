require './processor'

describe "Our order processor" do
  context 'when processing a phisical product' do
    it "generates a packing slip for shipping" do
      phisical_product= Product.new(:phisical)
      a_payment= Payment.new(phisical_product)
      expect(Processor.process(an_order)).to be_a(PackingSlip)
    end
  end
end