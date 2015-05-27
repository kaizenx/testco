require 'rails_helper'

RSpec.describe "NewsPages", :type => :request do
  let(:admin) { create :user, :admin }
  before do
    login_as admin, scope: :user
  end
  describe "news new page" do
    before do
      visit '/news/new'
    end

    it "should have correct title" do
      expect(page).to have_title full_title('New News')
    end

    it "has correct" do
      expect(page).to have_selector 'section.title h1', text: 'New News'
    end

    it "has a form for creating new news" do
      expect(page).to have_selector 'form#new_news'
    end

    it "has input for title" do
      within('form#new_news') do
        expect(page).to have_selector 'label', text: 'Title'
        expect(page).to have_selector 'section#title-input input[type="text"]'
      end
    end

    it "has input for content" do
      within('form#new_news') do
        expect(page).to have_selector 'label', text: 'Content'
        expect(page).to have_selector 'section#content-input textarea'
      end
    end

    it "has input for submit" do
      within('form#new_news') do
        expect(page).to have_selector 'section#submit-input input[type="submit"]'
      end
    end

    describe "submitting form" do
      it "should submit form" do
        within('form#new_news') do
          fill_in 'Title', with: 'News title'
          fill_in 'Content', with: 'content'
          click_button 'Add new news'
          expect(page).to have_title full_title('Dashboard')
        end
      end
    end
  end

  describe "news edit page" do
    before do
      @news = create :news
      visit "news/#{@news.id}/edit"
    end

    it "has correct title" do
      expect(page).to have_title full_title "Edit #{@news.title}"
    end

    it "has correct header" do
      expect(page).to have_selector '.title h2', text: "Edit Story"
    end

    it "updates new news" do
      within("form#edit_news_#{@news.id}") do
        fill_in 'Title', with: 'News 2 title'
        fill_in 'Content', with: 'News 2 content'
        click_button 'Save changes'
      end
      expect(page).to have_title full_title 'Dashboard'
    end
  end
end
