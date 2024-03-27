module ItemsHelper
  def sold_out?(item)
    item.order.present?
  end
end
