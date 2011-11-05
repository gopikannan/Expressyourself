class User < ActiveRecord::Base

        has_many :polls, :dependent => :destroy

        def self.create_with_omniauth(auth)  
                create! do |user|  
                        user.fb_id = auth["uid"]  
                        user.name = auth["user_info"]["name"]  
                        user.email = auth["user_info"]["email"]  
                end
        end
end
