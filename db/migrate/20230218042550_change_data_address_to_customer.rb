class ChangeDataAddressToCustomer < ActiveRecord::Migration[6.1]
  def change
   
  change_column :customers, :address, :string
  end
end
