class CreateRecordsUpdateLock < ActiveRecord::Migration
  def change
    create_table :records_update_locks do |t|
      t.datetime   :last_update
    end
  end
end
