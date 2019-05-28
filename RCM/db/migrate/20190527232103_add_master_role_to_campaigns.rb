class AddMasterRoleToCampaigns < ActiveRecord::Migration[5.2]
  def change
  	add_column :campaigns, :master, :text
  end
end
