class ApplicationController < ActionController::Base
    
  # include モジュールを使用することで、SessionsHelper内のメソッドがこのclassの
  # インスタンスメソッドとして取り込まれる。
  # これをMix-inという。
  include SessionsHelper

  private

  def require_user_logged_in
    # 現在ログインしているかどうかをチェックしようとしている
    unless logged_in?
      # ログインしていなければ、ログインURLにリダイレクトをする
      redirect_to login_url
    end
  end
end