class Task < ActiveRecord::Base
  belongs_to :lecture
  has_many :solutions, dependent: :destroy
end
