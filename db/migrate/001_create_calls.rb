require 'sequel'
require 'sequel/extensions/migration'

class CallsTable < Sequel::Migration
  def up
    create_table :calls do 
      primary_key :id
      varchar :username, :size => 32
      varchar :caller_id_number, :size => 32
      varchar :caller_id_name, :size => 32
      varchar :destination_number, :size => 32, :null => false
      varchar :channel, :null => false
      varchar :context, :null => false
      timestamp :start_stamp, :null => false
      timestamp :end_stamp, :null => false
      varchar :duration, :size => 12
      varchar :billsec, :size => 12
    end unless DB.tables.include?(:calls)
  end

  def down
    drop_table :calls if DB.tables.include?(:calls)
  end
end
