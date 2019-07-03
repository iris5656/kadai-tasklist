class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    # add_column テーブル名, 追加したいカラム名, 追加したいカラムの型
    # カラムの型とは
    # string: 文字列
    # integer: 整数
    # text: 文章
    add_column :tasks, :status, :string
  end
end
