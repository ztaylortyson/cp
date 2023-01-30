class FixSbnAddNullFalse < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:users, :sbn, true)
  end
end
