require_relative './lib/analytics'

require 'sinatra/base'
require 'json'
require 'rest-client'


class AnalyticsApp < Sinatra::Base

	get '/' do
		
		# safeurl = URI.encode(('http://localhost/4000').strip)
		
		# api_result = RestClient.post(safeurl, {
	 #    "url": safeurl,
	 #    "events": [
	 #      "send",
	 #      "open",
	 #      "click"
	 # 		]
		# }) { |result| response.return!(result)}
		
		# mail = JSON.parse(api_result)

		mail = [{"Address":"barney@lostmy.name","EmailType":"Shipment","Event":"send","Timestamp":1432820696},
						 {"Address":"tom@lostmy.name","EmailType":"UserConfirmation","Event":"click","Timestamp":1432820702},
			 			 {"Address":"vitor@lostmy.name","EmailType":"Shipment","Event":"open","Timestamp":1432820704}]

		analytics = Analytics.new(mail)
		analytics.calculate()
		@stats = analytics.get_stats()
		@totals = analytics.get_totals()
		erb(:index)
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

