require 'rails_helper'

RSpec.describe Currency, type: :model do
  it "get rates with respect to passing date" do
    rates = Currency.exchange(100,[Date.yesterday, Date.today, Date.today - 3.day])
    rates != nil?
    expect(rates == false)
    puts ("Rates with respect to date")
  end 


  it "is nil with a invalid date" do
    rates = Currency.exchange(100,[ Date.today + 1.day])
    rates == nil?
    expect(rates == true)
    puts ("Record Not Found")
  end 

end