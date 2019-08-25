test_user = User.create(email:'test2@gmail.com',password:'password',nickname:'yodo',family_name:'yodogawa',first_name:'genta',family_furigana:'ヨドガワ',first_furigana:'ゲンタ',birth_year:1993,birth_month:1,birth_day:1)

num = 0
while num < 1000 do
  i = [1,2,3,4,5,6,7,8,9,10,11,12,13].sample
  j = Category.find(i).children.sample.id
  k = Category.find(j).grandchildren.sample.id  
  @test_product=Product.create(name:"test",description:'test-description',size_id:1,brand:'brand',status_id:1,shipping_fee_id:1,shipping_date_id:1,shipping_method_id:1,purchase_status_id:1,price:1000,category_grandparent_id:i,category_parent_id:j,category_id:k,user_id:1,prefecture_id:1)
  @test_product.images.attach(io: File.open('app/assets/images/custom-banner-icon.png'), filename: 'custom-banner-icon.png',content_type: "image/jpg")
  num += 1
end
# num = 0
# while num < 1000 do
#   @test_product=Product.create(name:'test',description:'test-description',size_id:1,brand:'brand',status_id:1,shipping_fee_id:1,shipping_date_id:1,shipping_method_id:1,purchase_status_id:1,price:1000,category_grandparent_id:1,category_parent_id:14,category_id:159,user_id:1,prefecture_id:1)
#   @test_product.images.attach(io: File.open('app/assets/images/custom-banner-icon.png'), filename: 'custom-banner-icon.png',content_type: "image/jpg")
#   num += 1
# end
