class Payment
  def initialize product
    @product = product
  end

  def is_a_book?
    @product.is_a_book?
  end
end