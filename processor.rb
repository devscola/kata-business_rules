require './packing_slip'

class Processor

  def self.process payment
    processed_order = [PackingSlip.new(:shipping)]
    processed_order << PackingSlip.new(:royalty) if payment.is_a_book?
    processed_order
  end
end
