class AddGroupApprovalStatusToStatuses < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  
  def change
    add_column :statuses, :approval_status, :integer, null: true
    add_index :statuses, :approval_status, algorithm: :concurrently, where: 'approval_status IS NOT NULL'
  end
end
