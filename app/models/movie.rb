class Movie < ApplicationRecord 
    validates :Title, presence: true
end
