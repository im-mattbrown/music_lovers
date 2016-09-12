class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :seeking
      t.integer :age
      t.string :profile_video
      t.text :answer1
      t.text :answer2
      t.text :answer3
      t.text :answer4
      t.text :answer5
      t.text :answer6
      t.text :answer7
      t.string :playlist
      t.integer :suitors, array: true, default:[]

      t.timestamps
    end
  end
end
