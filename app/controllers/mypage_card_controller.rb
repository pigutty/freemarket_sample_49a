class MypageCardController < UsersController
  def index
    if user_signed_in?
      @subject_active = @allsubjects.find_index{|e| e[:name]=='支払い方法' }
    else
      redirect_to root_path
    end
  end

  def new
    if user_signed_in?
      @subject_active = @allsubjects.find_index{|e| e[:name]=='支払い方法' }
    else
      redirect_to root_path
    end
  end
end
