class SearchOrder < ActiveHash::Base
  self.data = [
    {id: 1, name: '価格の安い順'},
    {id: 2, name: '価格の高い順'},
    {id: 3, name: '出品の古い順'},
    {id: 4, name: '出品の新しい順'},
    {id: 5, name: 'いいね！の多い順'},
  ]
end
