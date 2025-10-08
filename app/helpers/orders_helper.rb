module OrdersHelper
  include ActionView::Helpers::NumberHelper

  def format_price(price)
    "#{number_with_delimiter(price)}円"
  end
end