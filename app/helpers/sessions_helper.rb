module SessionsHelper
    # Helperモジュールに書かれたメソッドは、無条件で全てのViewの中で使用ができる。
    def current_user
        # ||= のことをnilガードという。
        # 左辺がnilならば、右辺を実行して、その値を左辺に代入する
        # 左辺がnil以外ならば、そのまま
        # @current_user ||= User.find_by(id: session[:user_id])
        if @current_user
            return @current_user
        else
            @current_user = User.find_by(id: session[:user_id])
            return @current_user
        end
    end
    def logged_in?
        # !!current_user
        if current_user
            return true
        else
            return false
        end
    end
end
