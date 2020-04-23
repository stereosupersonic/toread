# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end
end
