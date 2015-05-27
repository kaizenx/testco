# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :string(255)      default("user"), not null
#  location_id            :integer
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { build :user }

  subject { user }

  it { should respond_to :name }
  it { should respond_to :location }

  describe "#self.roles" do
    it "should return correct roles" do
      expect(User.roles).to eql %w[admin manager user]
    end
  end

  describe "Roles" do
    context 'user' do
      it "role should be user" do
        expect(user).to be_user
      end
    end

    context 'manager' do
      let(:manager) { build :user, :manager }

      it "role should be manager" do
        expect(manager).to be_manager
      end

      it "can have location" do
        location = create :location
        manager.location = location
        manager.save
        expect(manager.location).to eql location
      end
    end

    context 'admin' do
      let(:admin) { build :user, :admin }

      it "role should be admin" do
        expect(admin).to be_admin
      end
    end
  end
end
