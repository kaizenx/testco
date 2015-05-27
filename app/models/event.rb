# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  title             :string(255)      not null
#  date              :datetime         not null
#  created_at        :datetime
#  updated_at        :datetime
#  location_id       :integer          not null
#  image             :string(255)
#  description       :text
#  short_description :string(255)
#

class Event < ActiveRecord::Base

  validates :title, presence: true
  validates :date, presence: true
  validates :location_id, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :location

  scope :between, lambda {|start_time, end_time|
    where("? < date and date < ?", Event.format_date(start_time), Event.format_date(end_time)) 
  }

  # need to override the json view to return what full_calendar is expecting.

  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description || "",
      :start => date.rfc822,
      :recurring => false,
      :url => "#",
      #:color => "red"
    }
    # Rails.application.routes.url_helpers.event_path(id)
  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
  
end
