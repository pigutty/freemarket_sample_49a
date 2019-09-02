crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :profile do
  link "プロフィール", new_user_profile_path
  parent :mypage
end

crumb :mypage_card do
  link "支払い方法", mypage_card_index_path
  parent :mypage
end

crumb :credit_card_information do
  link "クレジットカード情報入力", new_mypage_card_path
  parent :mypage
end

crumb :person_info_registration do
  link "本人情報の登録", new_user_identification_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", edit_user_profile_path
  parent :mypage
end

crumb :top1 do
  if params[:id].to_i > 159
    link Category.find(params[:id]).parent.grandparent.name, top_path(Category.find(params[:id]).parent.grandparent.id)
  elsif params[:id].to_i > 13
    link Category.find(params[:id]).grandparent.name, top_path(Category.find(params[:id]).grandparent.id)
  else
    link Category.find(params[:id]).name, top_path(params[:id])
  end
    parent :root
end

crumb :top2 do
  if  params[:id].to_i > 159
    link Category.find(params[:id]).parent.name, top_path(Category.find(params[:id]).parent.id)
  elsif params[:id].to_i > 13
    link Category.find(params[:id]).name, top_path(params[:id])
  end
  parent :top1
end

crumb :top3 do
  if  params[:id].to_i > 159
  link Category.find(params[:id]).name, top_path(params[:id])
  end
  parent :top2
end
