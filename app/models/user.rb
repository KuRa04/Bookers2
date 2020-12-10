class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
          has_many :books, dependent: :destroy #add 12/4
          
          has_many :book_comments, dependent: :destroy #12/9
          
           has_many :favorites, dependent: :destroy #add 12/8
         
          attachment :profile_image
          
          validates :name,uniqueness: true, length: {maximum: 20, minimum: 2} #add 12/4
          validates :introduction, length: {maximum: 50}     #add 12/4
       
end
