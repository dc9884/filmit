# == Schema Information
#
# Table name: movies
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :string
#  production_id :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Movie < ApplicationRecord

validates :title, presence: true
validates :production_id, presence: true

has_many :permits, :dependent => :destroy
belongs_to :user

end
