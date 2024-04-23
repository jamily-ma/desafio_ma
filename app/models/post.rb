class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum:5, maximum:40 }
    validates :content, presence: true, length: { minimum:10, maximum:1500 }
    belongs_to :user
    has_many :comments
    acts_as_taggable_on :tags
end
