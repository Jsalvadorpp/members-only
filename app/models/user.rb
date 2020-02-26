class User < ApplicationRecord
    before_save{self.email = self.email.downcase}

    validates(:username,presence: true, uniqueness: true)

    valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email,presence: true, uniqueness: {case_sensitive: false},
        format: {with: valid_email})

    has_secure_password()
    

    def generate_token
        random_token = SecureRandom.urlsafe_base64()
        hashed_token = hash_token(random_token)
        self.update_attribute(:remember_token,hashed_token)
    end

    def forget_token
        self.update_attribute(:remember_token,nil)
    end

    def authenticate_token(token)
        return self.remember_token == token
    end

    private def hash_token(token)
        Digest::SHA256.base64digest(token)
    end
end
