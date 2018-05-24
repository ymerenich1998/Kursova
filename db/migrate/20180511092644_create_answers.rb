class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :name
      t.integer :question_id
      t.boolean :ans_ques, default: false

      t.timestamps
    end
  end
end
