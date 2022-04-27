class SessionsController < ApplicationController

  def create 
    user=User.where(email: params[:email]).first
    if user==nil 
      render json: { error: true, message: 'User not found !'}, 
      status: 401 and return
    end

    if user.confirmed?
      if user &.valid_password?(params[:password])
          render json: user.as_json(only: [:id ,:first_name,:last_name,:username,:age,:gender, :email,:authentication_token]),status: :created
      else 
          head(:unauthorized)
      end
    else
      render json: { error: true, message: 'Please confirm your registered email to access your account.'}, 
        status: 401 and return
    end
  end 
  
  def destroy
    # puts("=========",current_user.authentication_token)
    if current_user==nil 
      render json: { error: true, message: 'no current User Login'}, status: 200 and return

    end
    current_user.invalidate_all_sessions!
    # current_user.destroy
    render json: { error: true, message: 'Please confirm your registered email to access your account.'},
    status: 500 and return

    # status: 202 and return
  end

end