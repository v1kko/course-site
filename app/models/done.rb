class Done < ActiveRecord::Base
  attr_accessible :page_id, :user_id

  belongs_to :page
  belongs_to :user
  # attr_accessible :title, :body
end
