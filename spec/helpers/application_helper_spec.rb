require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "full_title" do
    context 'without provided title' do
      it "eql 'The Co'" do
        expect(application_title).to eql 'The Co'
      end
    end

    context 'with provided title' do
      it "eql 'The Co | Title'" do
        expect(application_title('Title')).to eql 'The Co | Title'
      end
    end
  end
end
