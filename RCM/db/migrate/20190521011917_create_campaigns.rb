class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
    	t.string :title
    	t.string :description
    end
  end
end
