# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class News < ActiveRecord::Base
  validates :title,   presence: true
  validates :content, presence: true
end
