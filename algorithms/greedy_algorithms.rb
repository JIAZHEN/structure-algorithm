class GreedyAlgorithms
  def self.get_max_profile(stock_prices)
    min_price, max_profit = stock_prices.first, 0
    stock_prices.each do |current_price|
      min_price = [min_price, current_price].min
      profit = current_price - min_price
      max_profit = [profit, max_profit].max
    end
    max_profit
  end

  def self.highest_product_of_3(list)
    return nil if list.size < 3

    lowest, highest = list.first(2).sort

    lowest_product_of_2 = lowest * highest
    highest_product_of_2 = lowest * highest
    highest_product_of_3 = highest_product_of_2 * list[2]

    list[2..-1].each do |current|
      highest_product_of_3 = [
        highest_product_of_3,
        current * highest_product_of_2,
        current * lowest_product_of_2
      ].max

      highest_product_of_2 = [
        highest_product_of_2,
        current * highest,
        current * lowest
      ].max

      lowest_product_of_2 = [
        lowest_product_of_2,
        current * highest,
        current * lowest
      ].min

      lowest = [lowest, current].min
      highest = [highest, current].max
    end

    highest_product_of_3
  end

  def self.get_products_of_all_ints_except_at_index(list)
    return nil if list.size < 2

    before_product, after_product = 1, 1
    products_before_idx = list.map do |e|
      current_before_product, before_product = before_product, before_product * e
      current_before_product
    end

    (list.size-1)
      .downto(0)
      .reduce([]) do |result, i|
        current_after_product, after_product = after_product, after_product * list[i]
        result.unshift(products_before_idx[i] * current_after_product)
      end
  end
end
