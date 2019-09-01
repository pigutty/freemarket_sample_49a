class Api::ProductsController < ProductsController
  before_action :set_product, only: [:edit,:create] # 対象となる商品を設定
  skip_before_action :correct_user?

  def edit # 商品編集時の画像の削除を実行しています。
    target_index = params[:index].to_i
    @product.images.all.order(id: "ASC")[target_index].purge
  end

  def create # 商品編集時の、画像変更を以下に記述しています。

    # 変更する画像は、商品にひもづく画像をid順に並べた時の
    # index 番目の画像です。
    target = @product.images.all.order(id: "ASC")[params[:index].to_i]
    target_id = target.id

    # 対象画像を削除し、新たな画像を追加する。
    # idを削除した画像のものにしておくことで、元あった場所に画像を入れられるようにする。
    target.purge
    @product.images.attach(params[:image])
    @product.images.last.update(id:target_id)
  end


end
