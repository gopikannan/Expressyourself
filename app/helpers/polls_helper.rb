module PollsHelper

        def get_date
          year, month, day = Date.today.to_s.split(/-/)
          year+month+day
        end
end
