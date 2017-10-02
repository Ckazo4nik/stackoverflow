class AddQuestionidToAnswers < ActiveRecord::Migration[5.1]
  change_table :answers do |t|
    t.remove :question_id
  end
end
