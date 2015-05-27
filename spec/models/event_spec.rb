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

require 'rails_helper'

RSpec.describe Event, :type => :model do
  let(:event) { build :event }

  subject { event }

  it { should respond_to :title }
  it { should respond_to :location_id}
  it { should respond_to :date }
  it { should respond_to :image }

  describe "validations" do
    [nil, ''].each do |empty|
      it "must have title" do
        event.title = empty
        expect(subject).not_to be_valid
      end
    end

    [nil, ''].each do |empty|
      it "must have date" do
        event.date = empty
        expect(subject).not_to be_valid
      end
    end

    [nil, ''].each do |empty|
      it "must have date" do
        event.location_id = empty
        expect(subject).not_to be_valid
      end
    end
  end

  describe "relationship" do
    it "can have location" do
      location = create :location
      event.location = location
      location.save
      expect(event.location).to eql location
    end
  end
end
