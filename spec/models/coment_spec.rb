require 'rails_helper'

describe Comment do
  context "comment has no body and no rating" do
    it "must have a body" do  
      subject.valid?  
      expect(subject.errors[:body].size).to eq(1)
    end

    it "must have a rating" do
      subject.valid?
      expect(subject.errors[:rating].size).to eq(2)
    end
  end
  context "commend doesn't have a valid rating" do
    subject { Comment.new(body:"comment's body", rating: "good" )}
    it "should throw an error when rating is not an integer" do
      subject.valid?
      expect(subject.errors[:rating].size).to eq(1)
    end
  end

end