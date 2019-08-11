class UserIdentificationsController < UsersController
  def new
    @user_information = UserIdentification.new
  end
  def create
    UserIdentification.create(user_information_params)
  end

  private
  def user_information_params
    params.require(:user_identification).permit(:post_number,:prefecture_id,:city,:block,:building,:user_id).merge(user_id:1)
  end
end
