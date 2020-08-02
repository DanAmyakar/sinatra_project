class Ship <ActiveRecord::Base

    belongs_to :user

    def self.valid_params?(params)
        return !params[:ship_name].empty? && !params[:cargo_slots].empty?
    end
end