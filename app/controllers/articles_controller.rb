# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: "Articel was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @article = Article.new
  end

  def update
    respond_to do |format|
      if @article.update(post_params)
        format.html { redirect_to root_path, notice: "Articel was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Articel was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :link, :description)
  end
end
