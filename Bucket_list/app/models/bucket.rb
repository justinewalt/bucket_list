class Bucket < ActiveRecord::Base
  belongs_to :user
  has_many :activities, dependent: :destroy
end
