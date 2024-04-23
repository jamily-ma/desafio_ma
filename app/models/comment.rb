class Comment < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    belongs_to :post, foreign_key: 'post_id'
    validates :content, presence: true
    attr_accessor :anonymous_name_or_ip
end