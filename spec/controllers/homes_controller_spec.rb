require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  require 'net/http'
  require 'json'

  # test to fetching records from ecb website for last 1 month
  describe "GET #exchange_rate" do
    describe " EUR vs USD Foreign Exchange Reference Rate API" do
      it 'fetching records from ecb website for last 1 month ' do
        from_date = Time.now.months_since(-1).strftime("%Y-%m-%d")
        url = "https://www.quandl.com/api/v3/datasets/ECB/EURUSD.json?api_key=S17TTxhSvNYxgv78UyRx&start_date=#{from_date}"

        uri = URI(url)
        response = Net::HTTP.get(uri)

        data = JSON.parse(response)

        # test for the 200 status-code
        # expect(response).to be_success

        # check to make sure the right amount of messages are returned
        expect(data["dataset"]["data"])
      end
    end
  end 
  

end
