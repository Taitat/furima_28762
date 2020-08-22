class AddAddressLineToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :address_line, :string, null: false
  end
end
