require './processed_order'
require './processor'
require './product'
require './payment'
require './packing_slip'
require './membership'
require './upgrade'

describe "Our order processor" do
  context 'when processing a phisical product' do
    it "generates a packing slip for shipping" do
      phisical_product= Product.new(:phisical)
      a_payment= Payment.new(phisical_product)
      
      the_slip = Processor.process(a_payment).slips.first
      
      expect(the_slip).to be_a(PackingSlip)
      expect(the_slip.from_whom).to eq(:shipping)
    end
  end

  context 'when the payment is for a book' do
    it "generates another packing slip for royalty department" do
      a_book= Product.new(:book)
      a_payment= Payment.new(a_book)

      processed_order = Processor.process(a_payment)
      the_slip = processed_order.slips[1]
      
      expect(processed_order.slips.size).to eq(2)
      expect(the_slip.from_whom).to eq(:royalty)
    end
  end

  context 'when the payment is for a membership' do
    it "activates the membership" do
      a_membership = Membership.new
      a_payment= Payment.new(a_membership)
      expect(a_membership.is_active?).to be_false()

      processed_order = Processor.process(a_payment)
      
      expect(a_membership.is_active?).to be_true()
    end

    it "sends a mail informing about the activation" do
      a_membership = Membership.new
      a_payment= Payment.new(a_membership)

      processed_order = Processor.process(a_payment)
      
      expect(processed_order.mails.size).to eq(1)
      expect(processed_order.mails.first).to eq("Your membership has been activated")
    end
  end

  context 'when the payment is for a upgrade of a membership' do
    it "upgrade the membership" do
      a_membership = Membership.new
      an_upgrade = Upgrade.new(a_membership)
      a_payment= Payment.new(an_upgrade)
      expect(a_membership.upgraded?).to be_false()

      processed_order = Processor.process(a_payment)
      
      expect(a_membership.upgraded?).to be_true()
    end

    it "send a mail informing of the upgrade" do
      a_membership = Membership.new
      an_upgrade = Upgrade.new(a_membership)
      a_payment= Payment.new(an_upgrade)
      
      processed_order = Processor.process(a_payment)

      expect(processed_order.mails.size).to eq(1)
      expect(processed_order.mails.first).to eq("Your membership has been upgraded")
    end
  end
end