require './processor'
require './product'
require './payment'
require './packing_slip'

describe "Our order processor" do
  context 'when processing a phisical product' do
    it "generates a packing slip for shipping" do
      phisical_product= Product.new(:phisical)
      a_payment= Payment.new(phisical_product)
      
      the_slip = Processor.process(a_payment).first
      
      expect(the_slip).to be_a(PackingSlip)
      expect(the_slip.from_whom).to eq(:shipping)
    end
  end

  context 'when the payment is for a book' do
    it "generates another packing slip for royalty department" do
      a_book= Product.new(:book)
      a_payment= Payment.new(a_book)

      processed_order = Processor.process(a_payment)
      the_slip = processed_order[1]
      
      expect(processed_order.size).to eq(2)
      expect(the_slip.from_whom).to eq(:royalty)
    end
  end
end