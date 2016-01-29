class User < ActiveRecord::Base

  has_many :followers, :class_name => 'Follow', :foreign_key => 'follower' #Those who follow
  has_many :followed, :class_name => 'Follow', :foreign_key => 'followed'  #Those who's followed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
