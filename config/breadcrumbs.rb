crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
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
