class Ship <ActiveRecord::Base

    belongs_to :user
    has_many :connexes

end