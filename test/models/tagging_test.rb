# == Schema Information
#
# Table name: taggings
#
#  id          :integer          not null, primary key
#  business_id :integer          not null
#  tag_id      :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
