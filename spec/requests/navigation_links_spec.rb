require 'rails_helper'

RSpec.describe "NavigationLinks", :type => :request do
  subject { page }
  describe "navigation" do
    before do
      3.times do
        create :location
      end
      visit root_path
    end

    it "has correct navigation links" do
      Location.all.each do |location|
        expect(page).to have_link location.name
      end
    end

    it "has working navigation links" do
      Location.all.each do |location|
        click_link location.name
        expect(page).to have_title full_title(location.name)
      end
    end

    context 'if admin' do
      before do
        admin = create :user, :admin
        login_as admin, scope: :user
        visit '/'
      end

      it "have correct navigation" do
        expect(page).to have_link 'Dashboard', href: dashboard_path
      end

      it "have sign out link" do
        expect(page).to have_link 'Sign out'
      end
    end
  end
end
