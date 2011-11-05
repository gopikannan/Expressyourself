class Poll < ActiveRecord::Base

        belongs_to :user
        has_many :clicks, :dependent => :destroy
        has_many :country_clicks, :dependent => :destroy
        has_many :data_sets
end
