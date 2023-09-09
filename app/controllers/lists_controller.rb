class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成
    @list = List.new
  end

  def index
  end

  def create
    # ↓フォームに記述された文字やデータを受け取り新規登録するためにインスタンス化
    list = List.new(list_params)
    # ↓データをデータベースに保存するためのsaveメソッドを実行
    list.save
    # ↓トップ画面へリダイレクトする
    redirect_to "/top"
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
    # params:formから送られてくるデータはparamsの中に入る
    # require:送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込む
    # permit:requireで絞り込んだデータの中から、保存を許可するカラムを指定する。
  end

end

