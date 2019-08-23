test_user = User.create(email:'test2@gmail.com',password:'password',nickname:'yodo',family_name:'yodogawa',first_name:'genta',family_furigana:'ヨドガワ',first_furigana:'ゲンタ',birth_year:1993,birth_month:1,birth_day:1)

@test_product=Product.create(name:'test',description:'test-description',size_id:1,brand:'brand',status_id:1,shipping_fee_id:1,shipping_date_id:1,shipping_method_id:1,purchase_status_id:1,price:1000,category_id:1000,user_id:1,prefecture_id:1)
@test_product.images.attach(io: File.open('app/assets/images/custom-banner-icon.png'), filename: 'custom-banner-icon.png',content_type: "image/jpg")
