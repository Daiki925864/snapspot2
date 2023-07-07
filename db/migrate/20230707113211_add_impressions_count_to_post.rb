class AddImpressionsCountToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :impressions_count, :integer, null: false, default: 0
  end
end
