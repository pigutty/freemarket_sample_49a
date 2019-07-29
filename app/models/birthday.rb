class Year < ActiveHash::Base
  self.data = [
    {id: 1, name: 2019}
  ]
end

class Month < ActiveHash::Base
  self.data = [
    {id: 1, name: 1}
  ]
end

class Day < ActiveHash::Base
  self.data = [
    {id: 1, name: 1}
  ]
end
