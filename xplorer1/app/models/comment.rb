class Comment < ApplicationRecord
  belongs_to :satellite
    belongs_to :user
end
