class User < ApplicationRecord

    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :name, length: {maximum: 50}, presence: true
    validates :password, length: {minimum: 6, maximum: 50}, presence: true
    validates :email, length: {maximum: 255}, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: true}

end
