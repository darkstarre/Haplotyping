class CreateDatabaseStructure < ActiveRecord::Migration
  ActiveRecord::Schema.define(version: 0) do

    end

  def change
    create_table :database_structures do |t|
    end
  end
end
