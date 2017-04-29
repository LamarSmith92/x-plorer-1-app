class Comment < ApplicationRecord
  belongs_to :satellite
    belongs_to :user
    validates :title, presence: true, length: { minimum: 5}
    validates :content, presence: true

end
