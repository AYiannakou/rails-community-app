class AddSubjectToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :subject, :string
  end
end
