class ClicksController < ApplicationController
  def create
#	  if session[:latest_click] < 0  	
	  	storeclicks(params)
#	  else
#	 	if Time.now.to_i - session[:latest_click] > 1
#			storeclicks(params)
#		else
#			respond_to do |format|  
 #     				format.html {   
  #      				flash.now[:error] = "Chill dude !! "  
   #     				#render :action => "new"  
    #  				}	  
     # 				# Render out the validation failed message with a  
      #				# 403 status code.  
      #				format.js { render :text => e.message, :status => 403 }  
#			end
#		end
#	end
  end

# GET /clicks/getcountryclicks.js

  def getcountryclicks
	@countryclicks = CountryClicks.select("country,clicks").where(:poll_id=>params[:poll_id],:date => get_date)
	respond_to do |format|
		format.js{render:json => @countryclicks.to_json}
	end 
  end

  def storeclicks(params)
	 @click = Click.new
         @click.poll_id = params[:poll_id]
         @click.user_id = current_user.id
         @click.option = params[:option]
         @click.location = params[:loc]
         @click.save
         session[:latest_click]=Time.now.to_i
	 @country_click = CountryClicks.where(:poll_id =>params[:poll_id],:date => get_date,:country =>params[:country]) 
	 if (@country_click.count == 0) 
 	 	@county_click = CountryClicks.create_with_params(params,get_date)
	 end

	 @country_click.each do|var| 
	 	if var !=nil
			if(params[:option] == '1')
				var.clicks+=1
			else
				var.clicks-=1	
			end
			var.save
		end
	end
  
  end

  def getcountryclickupdates
	@countryclicks = CountryClicks.select("country,clicks").where(:poll_id=>params[:poll_id],:date => get_date,:updated_at => (Time.now - 600)..(Time.now))
	respond_to do |format|
		format.js{render:json => @countryclicks.to_json}
	end 
  end			
end
