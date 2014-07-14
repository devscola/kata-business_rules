require './packing_slip'

class Processor
  def self.process payment
    [PackingSlip.new()]
  end
end
