class UserProfileController < UsersController
  def new
    if user_signed_in?
      @user_profile = current_user
      @subject_active = @allsubjects.index("プロフィール")
    else
      redirect_to root_path
    end
  end

  def update
    current_user.update(profile_params)
    redirect_to root_path
  end
  
  private
  def profile_params
    params.require(:user).permit(:nickname,:profile)
  end
end
