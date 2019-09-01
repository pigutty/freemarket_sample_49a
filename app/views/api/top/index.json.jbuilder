json.array! @middlecategories do |e|
  json.id e.id
  json.name e.name
end

json.array! @smallcategories do |e|
  json.id e.id
  json.name e.name
end
