class UsersController < TopController
  before_action :subjects
  def index
    if user_signed_in?
      @user_profile = current_user
      @subject_active = @allsubjects.find_index{|e| e[:name]=='マイページ' }
    else
      redirect_to root_path
    end
  end

  def show
    @products = Product.where(user_id: current_user.id).order("id DESC").page(params[:page]).per(10) 
  end

  def subjects
    if user_signed_in?
      @subjects2= 
        [{name:"マイページ",link:users_path},
        {name:"お知らせ",link:users_path}, 
        {name:"やることリスト",link:users_path}, 
        {name:"いいね！一覧",link:users_path}, 
        {name:"出品する",link:users_path},
        {name:"出品した商品 - 出品中",link:user_path(current_user.id)}, 
        {name:"出品した商品 - 取引中",link:user_path(current_user.id)}, 
        {name:"出品した商品 - 売却済み",link:user_path(current_user.id)}, 
        {name:"購入した商品 - 取引中",link:user_path(current_user.id)}, 
        {name:"購入した商品 - 過去の取引",link:user_path(current_user.id)}, 
        {name:"ニュース一覧",link:users_path},
        {name:"評価一覧",link:users_path},
        {name:"ガイド",link:users_path},
        {name:"お問い合わせ",link:users_path}]
      @subjects3=[{name:"売上・振込申請",link:users_path}, {name:"ポイント",link:users_path}]
      @subjects4=
        [{name:"プロフィール",link:new_user_profile_path},
        {name:"発送元・お届け先住所変更",link:users_path},
        {name:"支払い方法",link:mypage_card_index_path},
        {name:"メール/パスワード",link:users_path},
        {name:"本人情報",link:new_user_identification_path},
        {name:"電話番号の確認",link:users_path},
        {name:"ログアウト",link:edit_user_profile_path(current_user.id)}]
      @allsubjects= @subjects2 + @subjects3 + @subjects4
    end
  end
end
