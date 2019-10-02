# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GifMessage, type: :model do
  describe 'default scope order' do
    it { should have_many(:gif_messages) }
    it { should have_many(:messages).through(:gif_messages) }
  end


end


