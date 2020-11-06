class ChangeCoktailsToCoktailInReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :cocktails_id, :cocktail_id
  end
end
