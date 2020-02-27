class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    def logged
        unless is_logged?
            flash['danger'] = 'please log in'
            redirect_to login_path
        end
    end
end
