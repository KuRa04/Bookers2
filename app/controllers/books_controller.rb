class BooksController < ApplicationController
   before_action :baria_user, only: [:edit]
   
   def new
    @book = Book.new

  end
  
 def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id  #add 12/4
    
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # ３. トップ画面へリダイレクト
    redirect_to @book,notice:"successfully create book!" #add 12/4
  else 
    @books = Book.all
    render 'index'
  end
  
end
  
  def index
    @books = Book.all
    @book = Book.new
  
end

def  show
  @book = Book.find(params[:id])
  
  @book = Book.find(params[:id]) #add 12/4
  @user = @book.user             #add 12/4
  @new_book = Book.new           #add 12/4
  
end

 def edit
    @book = Book.find(params[:id])
  end
  
  
  # 変更部分
  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)  
    redirect_to @book,notice:"successfully create book!" #add 12/4
    
  else
    render "edit"
  end
  end
  #ここまで
  
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path   #add 12/4
  
end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
  #add start
  
  def baria_user
    unless Book.find(params[:id]).user.id.to_i == current_user.id
        redirect_to books_path
    end
end

   #finish

end