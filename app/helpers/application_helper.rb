module ApplicationHelper
    def nav_link_class(path)
        if current_page?(path)
        "text-orange-500 font-medium border-b-2 border-orange-500 pb-1"
        else
        "text-gray-700 hover:text-orange-500 transition-colors"
        end
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        current_user.present?
    end

    def require_login
        unless logged_in?
        redirect_to new_session_path, alert: "You must log in first!"
        end
    end
end
