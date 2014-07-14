require './packing_slip'

class Processor

  def self.process payment
    processed_order=[]
    processed_order << PackingSlip.new(:shipping)
    processed_order << PackingSlip.new(:royalty) if payment.is_for_a_book?
    processed_order
  end
end
