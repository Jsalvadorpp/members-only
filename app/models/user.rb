class User < ApplicationRecord
    before_save{self.email = self.email.downcase}

    validates(:username,presence: true, uniqueness: true)

    valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email,presence: true, uniqueness: {case_sensitive: false},
        format: {with: valid_email})

    has_secure_password()
end
