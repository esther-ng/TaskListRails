class ChangeNameToTitle < ActiveRecord::Migration
  def change
    rename_column(:tasks, :name, :title)
  end
end
