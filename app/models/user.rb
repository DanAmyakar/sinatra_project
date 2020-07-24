class User < ActiveRecord::Base

    has_secure_password

    # if the user name is taken do not allow creatation
    validates :username, presence: true, uniqueness: { case_sensitive: false }

end