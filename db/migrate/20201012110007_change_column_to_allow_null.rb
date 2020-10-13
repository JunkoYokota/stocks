class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]

  def change
    def up
      change_column :stocks, :open_date, :date, default: nil
    end

    def down
      change_column :stocks, :open_date, :date
    end
  end
end