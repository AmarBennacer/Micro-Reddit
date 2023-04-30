class Post < ActiveRecord::Base
    validates :title ,  presence: true
    validates :description ,  presence: true

    has_many :posts
    validates :user_id, presence: true

end