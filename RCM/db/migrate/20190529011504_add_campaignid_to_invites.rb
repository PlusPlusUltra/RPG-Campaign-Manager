class AddCampaignidToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :campaignid, :integer
  end
end
