class User < ApplicationRecord
    has_secure_password
    #validates :name, presence: true
    validates :password, confirmation: true, unless: -> { password.blank? }
end
