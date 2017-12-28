class HomesController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    
  end

  # fetching records from ecb website for last 1 month
  def exchange_rate
    from_date = Time.now.months_since(-1).strftime("%Y-%m-%d")

    begin
      url = "https://www.quandl.com/api/v3/datasets/ECB/EURUSD.json?api_key=S17TTxhSvNYxgv78UyRx&start_date=#{from_date}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)
      dates = data["dataset"]["data"]

      dates.reverse.each_with_index do |d|
        a = Currency.last
        last = a.date.strftime("%Y-%m-%d") if a.present?
        last_rate = a.rate if a.present?
        if last.present?
          if d[0].to_date == last.to_date + 1.day 
              Currency.create(date: d[0], rate: d[1])
          else
            l = (last.to_date + 1.day ).strftime("%Y-%m-%d")
            # c = (d[0].to_date - 1.day ).strftime("%Y-%m-%d")
            date_range = (l..d[0]).to_a
            
            date_range.each do |dr|
              Currency.create(date: dr, rate: last_rate)
            end
            Currency.last.update_attributes(:rate => d[1])
          end
        else
          Currency.create(date: d[0], rate: d[1])
        end
      end

      if dates.reverse.last[0] != Time.now.strftime("%Y-%m-%d")
        a = Currency.last
        last_rate = a.rate if a.present?
        f = (dates.reverse.last[0].to_date + 1.day ).strftime("%Y-%m-%d")
        date_range = (f..Time.now.strftime("%Y-%m-%d")).to_a
            date_range.each do |dr|
              currency = Currency.find_by_date(Time.now.strftime("%Y-%m-%d")) 
              if !currency.present?
                Currency.create(date: dr, rate: last_rate)
              end
            end
      end
    rescue Exception => e
      puts e.message.inspect
    end
    
    redirect_to root_path
  end


end
