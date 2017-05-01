class Comment < ApplicationRecord
  belongs_to :satellite
    belongs_to :user
    validates :title, presence: true, length: { minimum: 2}
    validates :content, presence: true

end
