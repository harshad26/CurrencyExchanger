class Currency < ApplicationRecord

  # exchange any amount of euros for period
  def self.exchange(value, period)
    if period.length > 1
      r = []
      period.each do |p|
        a = Currency.find_by_date(p)
        if a.present?
          r << a.rate * value
        else
          r << nil
        end
      end
    else
      a = Currency.find_by_date(period)
      r = a.present? ? a.rate * value : nil
    end
    return r
  end


end
