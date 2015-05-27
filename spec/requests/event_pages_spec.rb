require 'rails_helper'

RSpec.describe "EventPages", :type => :request do
  before do
    admin = create :user, :admin
    login_as admin, scope: :user
    @location = create :location
  end
  subject { page }

  describe "event new page" do
    before do
      visit '/events/new'
    end

    it "shoud have correct title" do
      expect(page).to have_title full_title 'New Event'
    end

    it "has header 'New Event'" do
      expect(page).to have_selector '.title h2', text: 'New Event'
    end

    it "has a form for creating new event" do
      expect(page).to have_selector 'form#new_event'
    end

    it "has input for title" do
      within('form#new_event') do
        expect(page).to have_selector 'label', text: 'Title'
        expect(page).to have_selector 'section#title-input input[type="text"]'
      end
    end

    it "has select for location" do
      within('form#new_event') do
        expect(page).to have_selector 'label', text: 'Location'
        expect(page).to have_selector 'section#location-input select'
      end
    end

    it "has input for date" do
      within('form#new_event') do
        expect(page).to have_selector 'label', text: 'Date'
        expect(page).to have_selector 'section#date-input input[type="date"]'
      end
    end

    it "has input for image" do
      within('form#new_event') do
        expect(page).to have_selector 'label', text: 'Image'
        expect(page).to have_selector 'section#image-input input[type="file"]'
      end
    end

    it "has input for submit" do
      within('form#new_event') do
        expect(page).to have_selector 'section#submit-input input[type="submit"]'
      end
    end

    it "create new event" do
      within('form#new_event') do
        fill_in 'Title', with: 'Event 1'
        select(@location.name.titleize, :from => 'event[location_id]')
        fill_in 'Date', with: Time.now.to_date
        attach_file('Image', 'spec/fixtures/images/image.jpg')
        click_button 'Add new event'
      end
      expect(page).to have_title full_title 'Dashboard'
    end
  end

  describe "edit" do
    before do
      @event = create :event, location: create(:location, name: 'Location 2')
      visit "events/#{@event.id}/edit"
    end

    it "has correct title" do
      expect(page).to have_title full_title "Edit #{@event.title}"
    end

    it "has correct header" do
      expect(page).to have_selector '.title h2', text: "Edit event: #{@event.title}"
    end

    it "has select for location" do
      within("form#edit_event_#{@event.id}") do
        expect(page).to have_selector 'label', text: 'Location'
        expect(page).to have_selector 'section#location-input select'
      end
    end

    it "updates new event" do
      within("form#edit_event_#{@event.id}") do
        fill_in 'Title', with: 'Event 1'
        select(@location.name.titleize, :from => 'event[location_id]')
        fill_in 'Date', with: Time.now.to_date
        attach_file('Image', 'spec/fixtures/images/image.jpg')
        click_button 'Save changes'
      end
      expect(page).to have_title full_title 'Dashboard'
    end
  end

  describe "show" do
    before do
      @event = create :event, location: @location
      visit event_path(@event)
    end

    it "should have correct title" do
      expect(page).to have_title full_title @event.title
    end
  end
end
