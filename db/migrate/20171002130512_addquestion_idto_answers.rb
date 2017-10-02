class AddquestionIdtoAnswers < ActiveRecord::Migration[5.1]
  change_table :answers do |t|
    t.belongs_to :questions
  end
end
