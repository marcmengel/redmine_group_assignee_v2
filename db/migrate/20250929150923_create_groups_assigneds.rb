class CreateGroupsAssigneds < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_assigneds do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end
end
