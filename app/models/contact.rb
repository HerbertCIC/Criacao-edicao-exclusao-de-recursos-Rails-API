class Contact < ApplicationRecord
    belongs_to :kind

    validates :name, presence: true
    validates :email, presence: true
    validates :birthdate, presence: true
end
