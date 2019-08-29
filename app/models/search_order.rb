class SearchOrder < ActiveHash::Base
  self.data = [
    {id: 0, name: nil, label:'並び替え'},
    {id: 1, name: 'price asc', label:'価格の低い順'},
    {id: 2, name: 'price desc', label:'価格の高い順'},
    {id: 3, name: 'created_at asc', label:'出品の古い順'},
    {id: 4, name: 'created_at desc', label:'出品の新しい順'},
    # {id: 5, name: 'likes desc'},
  ]
end
