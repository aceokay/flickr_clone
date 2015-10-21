require 'rails_helper'

describe Comment do
  it {should validate_presence_of :content}
  it {should belong_to :photo}
  it {should belong_to :user}
end
