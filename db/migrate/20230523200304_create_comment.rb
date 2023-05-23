# frozen_string_literal: true

# Migration to create the 'comments' table for storing comments on various entities.
class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :post, null: false, foreign_key: true, index: true
      t.text :text

      t.timestamps
    end
  end
end
