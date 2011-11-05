class PollsController < ApplicationController
  def new
  end

  def show
          @poll = Poll.find(params[:id])
  end

  def create
          @poll = current_user.polls.build(params[:poll])
          if @poll.save
                  redirect_to root_path
          else
                  redirect_to(:back)
          end
  end

  def destroy
  end

  def blob
          @poll = Poll.find(params[:poll_id])
          @data_set = @poll.data_sets.find_by_date(get_date)
          respond_to do |format|
                  format.js
          end
  end

  def update
          @poll = Poll.find(params[:poll_id])
          @clicks =  @poll.clicks.where(:created_at => Time.now.midnight..Time.now)
          @count =  @clicks.where(:option => '1').count -  @clicks.where(:option => '2').count
  end
end
