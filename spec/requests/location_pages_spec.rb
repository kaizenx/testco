require 'rails_helper'

RSpec.describe "LocationPages", :type => :request do
  before do
    admin = create :user, :admin
    login_as admin, scope: :user
  end
  subject { page }

  describe "index" do
    before do
      visit '/locations'
    end

    it "has correct title" do
      expect(page).to have_title full_title('Locations')
    end

    it "has header 'All locations'" do
      expect(page).to have_selector 'div.title h1', text: 'All locations'
    end

    describe "table data" do

      before do
        @location_1 = create :location, name: 'location 1'
        @location_2 = create :location, name: 'location 2'
        @location_3 = create :location, name: 'location 3'
        visit '/locations'
      end

      it "has table head 'Name'" do
        expect(page).to have_selector 'table#location-table thead th', text: 'Name'
      end

      it "has table head 'Actions'" do
        expect(page).to have_selector 'table#location-table thead th', text: 'Actions'
      end

      it "has table data with @location_1 name" do
        expect(page).to have_selector "table#location-table tr#location_#{@location_1.id} td", text: @location_1.name
      end

      it "has table data with @location_2 name" do
        expect(page).to have_selector "table#location-table tr#location_#{@location_2.id} td", text: @location_2.name
      end

      it "has table data with @location_3 name" do
        expect(page).to have_selector "table#location-table tr#location_#{@location_3.id} td", text: @location_3.name
      end

      it "has button to add new location" do
        expect(page).to have_link 'New Location'
        click_link 'New Location'
        expect(page).to have_title full_title('New Location')
      end

      it "has edit action" do
        [@location_1, @location_2, @location_3].each do |location|
          within("tr#location_#{location.id}") do
            expect(page).to have_link 'Edit', href: edit_location_path(location)
          end
        end
      end

      it "has delete action" do
        [@location_1, @location_2, @location_3].each do |location|
          within("tr#location_#{location.id}") do
            expect(page).to have_link 'Delete', href: location_path(location)
          end
        end
      end
    end
  end

  describe "new" do
    before do
      visit '/locations/new'
    end

    it "shoud have correct title" do
      expect(page).to have_title full_title 'New Location'
    end

    it "has header 'New Location'" do
      expect(page).to have_selector '.title h2', text: 'Add a location'
    end

    it "has a form for creating new location" do
      expect(page).to have_selector 'form#new_location'
    end

    it "create new location" do
      within('form#new_location') do
        fill_in 'Name', with: 'Location 2'
        fill_in 'Description', with: 'Description'
        fill_in 'Address', with: 'Address 2'
        attach_file('Image', 'spec/fixtures/images/image.jpg')
        %w(Service Mentor Company Map).each do |page|
          fill_in "#{page} description", with: "#{page} description"
        end
        click_button 'Add location'
      end
      expect(page).to have_title full_title 'Dashboard'
    end
  end

  describe "show" do
    before do
      @location = create :location
      visit "locations/#{@location.id}"
    end

    it "has correct title" do
      expect(page).to have_title full_title @location.name
    end

    it "has correct header" do
      expect(page).to have_selector '.content p', text: "#{@location.name}"
    end
  end

  describe "edit" do
    before do
      @location = create :location
      visit "locations/#{@location.id}/edit"
    end

    it "has correct title" do
      expect(page).to have_title full_title "Edit #{@location.name}"
    end

    it "has correct header" do
      expect(page).to have_selector '.title h2', text: "Edit #{@location.name}"
    end

    it "updates new location" do
      within("form#edit_location_#{@location.id}") do
        fill_in 'Name', with: 'Location 2'
        fill_in 'Description', with: 'Description'
        fill_in 'Address', with: 'Address 2'
        attach_file('Image', 'spec/fixtures/images/image.jpg')
        %w(Service Mentor Company Map).each do |page|
          fill_in "#{page} description", with: "#{page} description"
        end
        click_button 'Save changes'
      end
      expect(page).to have_title full_title 'Dashboard'
    end
  end
end
