class RemoveRoleFromUsers < ActiveRecord::Migration
  def change
  		change_table :users do |t|
  	t.remove :role
  end
  end
end
