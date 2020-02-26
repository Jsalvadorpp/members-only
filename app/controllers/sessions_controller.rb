class SessionsController < ApplicationController

    def login
        
    end

    def create
        password = params['session']['password']
        user = User.find_by(email: params['session']['email'])

        if user 
            if user.authenticate(password)
                #remember login session option
                params['session']['remember_me'] == '1' ? remember_session(user) : forget_session(user)

                log_in(user)
              
                flash['success'] = 'Successfully Logged In!'
                redirect_to home_path
            else
                flash.now['danger'] = 'invalid email/password'
                render 'login'
            end
        else
            flash.now['danger'] = 'user not registered'
            render 'login'
        end

    end

    def logout
        forget_session(current_user)
        session['user_id'] = nil
        flash['success'] = 'Successfully Logged Out!'
        redirect_to home_path
    end
    
end
