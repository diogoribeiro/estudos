class Follow < ActiveRecord::Base
  # following:integer follower:integer
  belongs_to :followed, :class_name => 'User'
  belongs_to :follower, :class_name => 'User'
end
