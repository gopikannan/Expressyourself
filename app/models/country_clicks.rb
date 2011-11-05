class CountryClicks < ActiveRecord::Base
	belongs_to :poll
	 
	def self.create_with_params(params,date)
                create! do |country_clicks|
                	country_clicks.poll_id = params[:poll_id]
                        country_clicks.country = params[:country]
                        country_clicks.clicks = 0
                        country_clicks.date = date
                end
        end

end
