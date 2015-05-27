require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  let(:admin) { create :user, :admin }

  describe "user new page" do
    before do
      login_as admin, scope: :user
      visit '/users/new'
    end

    it "should have correct title" do
      expect(page).to have_title full_title('New User')
    end

    it "has correct" do
      expect(page).to have_selector '.title h2', text: 'Add a new user'
    end

    it "has a form for creating new user" do
      expect(page).to have_selector 'form#new_user'
    end

    it "has input for email" do
      within('form#new_user') do
        expect(page).to have_selector 'label', text: 'Email'
        expect(page).to have_selector 'section#email-input input[type="email"]'
      end
    end

    it "has input for location" do
      within('form#new_user') do
        expect(page).to have_selector 'label', text: 'Location'
        expect(page).to have_selector 'section#location-input select'
      end
    end

    it "has input for password" do
      within('form#new_user') do
        expect(page).to have_selector 'label', text: 'Password'
        expect(page).to have_selector 'section#password-input input[type="password"]'
      end
    end

    it "has input for password" do
      within('form#new_user') do
        expect(page).to have_selector 'label', text: 'Password confirmation'
        expect(page).to have_selector 'section#password-confirmation-input input[type="password"]'
      end
    end

    it "has input for submit" do
      within('form#new_user') do
        expect(page).to have_selector 'section#submit-input input[type="submit"]'
      end
    end

    describe "submitting form" do
      it "should submit form" do
        within('form#new_user') do
          fill_in 'Email', with: 'email@example.com'
          select('User', :from => 'Role')
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Add user'
          expect(page).to have_title full_title('Dashboard')
        end
      end
    end
  end

  describe "user edit page" do
    before do
      @user = create :user
      login_as admin, scope: :user
      visit "/users/#{@user.id}/edit"
    end

    it "should have correct title" do
      expect(page).to have_title full_title('Edit User')
    end

    it "has correct" do
      expect(page).to have_selector '.title h2', text: 'Edit User'
    end

    it "has a form for creating edit user" do
      expect(page).to have_selector "form#edit_user_#{@user.id}"
    end

    it "has input for email" do
      within("form#edit_user_#{@user.id}") do
        expect(page).to have_selector 'label', text: 'Email'
        expect(page).to have_selector 'section#email-input input[type="email"]'
      end
    end

    it "has input for location" do
      within("form#edit_user_#{@user.id}") do
        expect(page).to have_selector 'label', text: 'Location'
        expect(page).to have_selector 'section#location-input select'
      end
    end


    it "has input for password" do
      within("form#edit_user_#{@user.id}") do
        expect(page).to have_selector 'label', text: 'Password'
        expect(page).to have_selector 'section#password-input input[type="password"]'
      end
    end

    it "has input for password" do
      within("form#edit_user_#{@user.id}") do
        expect(page).to have_selector 'label', text: 'Password confirmation'
        expect(page).to have_selector 'section#password-confirmation-input input[type="password"]'
      end
    end

    it "has input for submit" do
      within("form#edit_user_#{@user.id}") do
        expect(page).to have_selector 'section#submit-input input[type="submit"]'
      end
    end

    describe "submitting form" do
      it "should submit form" do
        within("form#edit_user_#{@user.id}") do
          fill_in 'Email', with: 'email@example.com'
          select('User', :from => 'Role')
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Save changes'
          expect(page).to have_title full_title('Dashboard')
        end
      end
    end
  end
end
