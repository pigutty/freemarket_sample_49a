crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :top do
  link Category.find(params[:id]).name, top_path(params[:id])
  parent :root
end

