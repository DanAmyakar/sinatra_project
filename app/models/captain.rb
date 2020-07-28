class Captain < ActiveRecord::Base

    has_secure_password
    has_many :ships

    # if the user name is taken do not allow creatation
    validates :captain_name, presence: true, uniqueness: { case_sensitive: false }

end