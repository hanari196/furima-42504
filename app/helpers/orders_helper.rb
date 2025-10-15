module OrdersHelper
  include ActionView::Helpers::NumberHelper

  def format_price(price)
    "#{ price }円"
  end
end