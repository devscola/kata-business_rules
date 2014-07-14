require './processor'
require './product'
require './payment'
require './packing_slip'

describe "Our order processor" do
  context 'when processing a phisical product' do
    it "generates a packing slip for shipping" do
      phisical_product= Product.new(:phisical)
      a_payment= Payment.new(phisical_product)
      the_slip = Processor.process(a_payment)
      expect(the_slip).to be_a(PackingSlip)
      expect(the_slip.owner).to eq(:shipping)
    end
  end

  context 'when the payment is for a book' do
    it "generates another packing slip for royalty department" do
      
    end
  end
end