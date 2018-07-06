class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :micropost_id
      t.string :user_name
      t.string :picture

      t.timestamps
    end
  end
end
