class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
    @updateerror = Book.new
  end

  def update
    
    @books = Book.all
    @updateerror = Book.new(book_params)
    
    @book = Book.find(params[:id])
    @book.update(book_params)
    
    if @updateerror.save
    #詳細画面へリダイレクト
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@updateerror.id)
    else
      render :edit
    end
  end

  def create
    
    @books = Book.all
    
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    #詳細画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
      #一覧画面を表示、エラーメッセージを出したい
    else
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
