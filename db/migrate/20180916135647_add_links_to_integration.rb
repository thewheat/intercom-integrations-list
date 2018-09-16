class AddLinksToIntegration < ActiveRecord::Migration[5.2]
  def change
    add_column :integrations, :links, :text
  end
end
