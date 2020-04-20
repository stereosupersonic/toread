# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  description :text
#  link        :text
#  state       :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rails_helper"

RSpec.describe Article, type: :model do
  it "genrates a valid factort" do
    article = FactoryBot.build :article

    expect(article).to be_valid
    expect(article.save).to eq true
  end
end
