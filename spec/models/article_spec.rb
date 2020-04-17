# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do
  it "genrates a valid factort" do
    article = build :articles

    expect(article).to be valid
    expect(article.save).to be true
  end
end
