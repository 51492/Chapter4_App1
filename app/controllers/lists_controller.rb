class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成
    @list = List.new
  end

  def index
    @lists = List.all
    # viewファイルで呼び出せるように@(インスタンス変数)を使用してインスタンス化
    # allメソッドはそのモデルがやり取りしているDBのテーブルに保存されている全てのデータを取得する
  end

  def create
    # ↓フォームに記述された文字やデータを受け取り新規登録するためにインスタンス化
    @list = List.new(list_params)

    # ↓データをデータベースに保存するためのsaveメソッドを実行
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new #render：アクション名で、同じコントローラ内の別アクションのViewを表示する
    end

  end

  def show
    @list = List.find(params[:id]) # findメソッドは引数(:id)とidカラムを照合してレコードを取得するメソッド
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params) # updateメソッドはすでにテーブルに保存されているデータを、新しい情報に更新するメソッド
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ(レコード)を1件取得
    list.destroy #データ(レコード) を削除
    redirect_to "/lists" #投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
    # params:formから送られてくるデータはparamsの中に入る
    # require:送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込む
    # permit:requireで絞り込んだデータの中から、保存を許可するカラムを指定する。
  end


end

