require './packing_slip'

class Processor

  def self.process payment
    slips=generate_slips(payment)
    payment.fulfilled()
    
    slips
  end

  
  def self.generate_slips payment
    slips=[]
    
    slips << PackingSlip.new(:shipping)
    slips << PackingSlip.new(:royalty) if payment.is_for_a_book?
    slips
  end

end
