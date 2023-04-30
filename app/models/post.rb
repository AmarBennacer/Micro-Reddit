class Post < ActiveRecord::Base
    validates :title ,  presence: true
    validates :description ,  presence: true
    belongs_to :user

   
    validates :user_id, presence: true

end