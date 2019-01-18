# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gif, type: :model do
  describe 'associations' do
    it { should have_many(:gif_messages) }
    it { should have_many(:messages).through(:gif_messages) }
    # it { should have_many(:tasks) }
    # it { should belong_to(:user) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:first_name) }
  #   it { should validate_presence_of(:email) }
  # end

  # describe '#full_name' do
  #   it 'returns full name of the contact' do
  #     contact = Gif.create(first_name: 'John', last_name: 'Abraham', email: 'john@test.com')
  #     expect(contact.full_name).to eq 'John Abraham'
  #   end
  # end
end


