# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :link
      t.text :description
      t.string :title
      t.string :state

      t.timestamps
    end
  end
end
