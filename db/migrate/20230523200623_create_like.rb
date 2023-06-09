# frozen_string_literal: true

# Migration to create the 'likes' table for recording likes on various entities.
class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :post, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
