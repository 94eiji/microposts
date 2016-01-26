class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      
      # 外部キー(user_id)
      t.references :user, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      
      # 昇順 (ユーザID、登録順に並べる)
      t.index [:user_id, :created_at]
    end
  end
end
