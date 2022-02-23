class RegistrationsController < DeviseTokenAuth::RegistrationsController
  # Create an Registration API for sign_up
  def create
    user = User.new(sign_up_params)
    if user.save 
      render_success 200, true, 'User created successfully', user.as_json
    else
      render_success 401, false, 'User already created', user.as_json
    end
  end
  
  # Fetch an Registration API
  def show
    render json: User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end
   
  private

  # Strong Params of Registration
  def sign_up_params
    params.require(:user).permit(:email,:password,:password_confirmation,:uid,:provider,:name)
  end
end
