class AddUserRefToTasks < ActiveRecord::Migration[5.2]
  def change
    # 下記でしているのは、tasksテーブルに対して、usersテーブルを参照する外部キーである、
    # user_idを追加しているに過ぎない。
    add_reference :tasks, :user, foreign_key: true
  end
end
