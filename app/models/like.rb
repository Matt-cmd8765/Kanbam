class Like < ApplicationRecord
  #* https://medium.com/swlh/how-to-add-a-simple-like-button-to-your-rails-6-application-c1040999dc2

  belongs_to :user
  belongs_to :comment
end
