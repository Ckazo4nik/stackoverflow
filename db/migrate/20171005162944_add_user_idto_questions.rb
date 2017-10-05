class AddUserIdtoQuestions < ActiveRecord::Migration[5.1]
  def change
    change_table :questions do |t|
      t.belongs_to :user
    end
  end
end
