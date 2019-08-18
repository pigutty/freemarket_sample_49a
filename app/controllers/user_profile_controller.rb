class UserProfileController < UsersController
  def new
    @subjects= ["マイページ"]
    @subjects2= ["お知らせ", "やることリスト", "いいね！一覧", "出品する", "出品した商品 - 出品中", "出品した商品 - 取引中", "出品した商品 - 売却済み", "購入した商品 - 取引中", "購入した商品 - 過去の取引", "ニュース一覧 評価一覧", "ガイド お問い合わせ"]
    @subjects3=["売上・振込申請", "ポイント"]
    @subjects4=["プロフィール", "発送元・お届け先住所変更", "支払い方法", "メール/パスワード", "本人情報", "電話番号の確認", "ログアウト"]
    @bigcategories = Category.where(parent_id:nil, child_id:nil)
    @bigcategores = Category.where(parent_id:nil, child_id:nil)# parent_id = params[:parent_id].to_i
    # @middlecategories = Categoryactive.where(parent_id: parent_id).take(14)

    if user_signed_in?
      @user_profile = current_user
      @subject_active = @allsubjects.find_index{|e| e[:name]=='プロフィール' }
    else
      redirect_to root_path
    end
  end

  def edit
    if user_signed_in?
      @subject_active = @allsubjects.find_index{|e| e[:name]=='ログアウト' }
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
