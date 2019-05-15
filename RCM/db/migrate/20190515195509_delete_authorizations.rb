class DeleteAuthorizations < ActiveRecord::Migration[5.2]
  def change
  	drop_table :authorizations
  end
end
