require './processed_order'
require './packing_slip'

class Processor

  def self.process payment
    result = ProcessedOrder.new
    result.slips=generate_slips(payment)
    payment.fulfilled()
    
    result
  end

  
  def self.generate_slips payment
    slips=[]
    
    slips << PackingSlip.new(:shipping)
    slips << PackingSlip.new(:royalty) if payment.is_for_a_book?
    slips
  end

end
