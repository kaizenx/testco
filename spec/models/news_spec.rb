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

require 'rails_helper'

RSpec.describe News, :type => :model do
  let(:news) { build :news }

  subject { news }

  it { should respond_to :title }
  it { should respond_to :content }

  describe "validations" do
    [nil, ''].each do |empty|
      it "must have title" do
        news.title = empty
        expect(subject).not_to be_valid
      end
    end

    [nil, ''].each do |empty|
      it "must have content" do
        news.content = empty
        expect(subject).not_to be_valid
      end
    end
  end
end
