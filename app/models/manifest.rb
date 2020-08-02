class Manifest < ActiveRecord::Base
    belongs_to :ship

    def self.valid_params?(params)
        return !params[:item_name].empty? && !params[:item_quantity].empty?
    end
end